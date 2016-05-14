unique = 0;
$(function(){
	$("#add").click(function(){
		$("#modal-backdrop").show();
		$("#editChild").val(null);
		$("#editPage").submit();
	});
	$(".edit").live('click',function(){
		$("#modal-backdrop").show();
		$("#editChild").val($(this).attr('fid'));
		$("#editPage").submit();
	});
	$(".save").live('click',function(){
		if(unique==0){
			var _flowId = $(this).attr('fid');
			var _state = $(this).parent().parent().find("[name='state']").val();
			var _pay = $(this).parent().parent().find("[name='pay']").val();
			var _type = $(this).parent().parent().find("[name='type']").val();
			$("#modal-backdrop").show();
			$.ajax({
				type : "post",
				url : contextPath+"/proSale/updSaleInfoValue",
				data:{
					flowId : _flowId,
					state : _state,
					pay : _pay,
					type : _type
				},
				success : function(data) {
					unique = 0;
					$("#modal-backdrop").hide();
					if (data != "-1") {
						$.messager.show({
							title:'提示',
							msg:'操作成功!',
							showType:'show',
							style:{
								right:'',
								left:0,
								top:document.body.scrollTop+document.documentElement.scrollTop,
								bottom:''
							}
						});
					} else {
						$.messager.alert('提示', "操作失败！", "error");
						window.location.href=contextPath+"/proSale/fetchPage";
					}
				},
				error : function() {
					unique = 0;
					$("#modal-backdrop").hide();
					$.messager.alert('提示', "连接服务器失败！", "error");
					window.location.href=contextPath+"/proSale/fetchPage";
				}
			});
		}
	});
    /**
	 * 删除
	 */
	$(".delete").live('click',function(){
		var _id=$(this).attr("fid");
		$.messager.confirm('提示',"是否确定删除? ",function(data){
			if(data){
				$("#modal-backdrop").show();
				$.ajax({
					type:"post", 
					url:contextPath + "/proSale/deleteOne",
					data:{
						id:_id
					},
					success:function(data){
						$("#modal-backdrop").hide();
						if(data.msg>=1){
							window.location.href=contextPath+"/proSale/fetchPage";
						}else{
							$("#modal-backdrop").hide();
							$.messager.alert('提示', '删除失败！', "error");
						}
					},
					error:function(data){
						$("#modal-backdrop").hide();
						$.messager.alert('提示', "连接服务器失败！", "error");
					}
				});
			}
		});
	});
	/**
	 * 查询
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#queryTime_query").val($("#queryTime").val());
		$("#customerId_query").val($("#customerId").val());
		$("#pageForm").submit();
	});
	/**
	 * 导出
	 */
	$("#export").click(function(){
		if(unique==0){
			$("#modal-backdrop").show();
			unique++;
			$.ajax({
				type : "post",
				url : contextPath+"/proSale/createExport",
				data:{
					queryTime : $("#queryTime").val(),
					customerName : $("#customerName").val()
				},
				success : function(data) {
					$("#modal-backdrop").hide();
					unique = 0;
					if (data != "-1") {
						window.location.href=contextPath+"/export/export?fileName="+data;
					} else {
						$.messager.alert('提示', "导出失败！", "error");
					}
				},
				error : function() {
					$("#modal-backdrop").hide();
					unique = 0;
					$.messager.alert('提示', "连接服务器失败！", "error");
				}
			});
		}
	});
	
	/**
	 * 导出模板
	 */
	$("#demo").click(function(){
		if(unique==0){
			$("#modal-backdrop").show();
			unique++;
			window.location.href=contextPath+"/export/template?fileName="+$(this).attr("fileName");
			setTimeout(function(){
				$("#modal-backdrop").hide();
				unique = 0;
			},500);
		}
	});
	
	/**
	 * 导入
	 */
	$("#import").click(function(){
		var $modal = $('#ajax-modal');
	    $modal.load(contextPath + '/proSale/importFile',{"Content-type":"application/x-www-form-urlencoded"},function(){
	    	$(".importFile").live('click',function(){
	    		importExcel();
	    	});
	    	$modal.modal();
	    });
	});
});
function importExcel(){
	if(unique == 0){
		unique++;
		$('#importExcel').form({url:contextPath + '/proSale/saveExcel', 
			onSubmit:function(){
				var name = $("#file").val();
				if(name!=null && name!=""){
					if(name.indexOf(".xlsx")>0){
						unique = 0;
						$("#modal-backdrop").show();
						return true;
					}else{
						unique = 0;
						$.messager.alert('提示', "请选择正确类型的文件!", "error");
						return false;
					}
				}else{
					unique = 0;
					$.messager.alert('提示', "请选择文件!", "error");
					return false;
				}
				
			}, success: function (data) {
				var info = eval("(" + data + ")");
				$('.default').click(); 
				if(info.msg == 0){
					$("#modal-backdrop").hide();
					unique = 0;
					$.messager.alert('提示', "导入成功!", "success",function(){
						$("#pageForm").submit();
					});
				}else{
					document.getElementById("error").innerHTML = openErrorInfo( info.error);
					unique = 0;
					$("#modal-backdrop").hide();
					$("#error").modal('show');
				}
			}
		});
		$('#importExcel').submit(); 
	}
}

function openErrorInfo(html){
	var word="";
	word+="<div class='portlet box blue' style='width:545px;margin-left:30%;margin-top:50px;'>";
		word+="<div class='portlet-title'>";
			word+="<div class='caption'>错误信息</div>";
		word+="</div>";
		word+="<div class='portlet-body form'>";
			word+="<div class='form-body'>";
				word+= html;
			word+="</div>";
			word+="<div class='form-actions modal-footer'>";
				word+="<button type='button' class='btn default' data-dismiss='modal'>关闭</button>";
			word+="</div>";
		word+="</div>";
	word+="</div>";
	return word;
}
function isEmpty(str)     
{     
    if(str != null && str.length > 0)     
    {     
        return true;     
    }     
    return false;     
}

function importMsg(error ,msg){
	if(msg == 0){
		$.messager.alert('提示', "修改成功", "success", function() {
			$("#modal-backdrop").show();
			$("#pageForm").submit();
		});
	}else{
		var html ="";
		for(var i = 0;i<error.size;i++){
			html += error[i].name+":"+error[i].info+"<br/>";
		}
		alert(html);
	}
}

function importMsg(){
	alert("aa");
}