unique = 0;
$(function(){
	//新增
	$("#add").click(function(){
		edit(null);
	});
	$(".edit").click(function(){
		var _id = $(this).attr("fid");
		edit(_id);
	});
	/**
	 * 查询按钮
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#queryTime_query").val($("#queryTime").val());
		$("#productName_query").val($("#productName").val());
		$("#pageForm").submit();
	});
	//删除
	$(".delete").live('click',function(){
		var _id=$(this).attr("fid");
		var _name=$(this).attr('fname');
		$.messager.confirm('提示',"是否删除订单【"+_name+"】? ",function(data){
			if(data){
				$("#modal-backdrop").show();
				$.ajax({
					type:"post", 
					url:contextPath + "/proStock/deleteOne",
					data:{
						id:_id
					},
					success:function(data){
						if(data.msg==1){
							$("#modal-backdrop").show();
							$("#queryTime_query").val($("#queryTime").val());
							$("#productName_query").val($("#productName").val());
							$("#pageForm").submit();
						}else{
							$("#modal-backdrop").hide();
							$.messager.alert('提示', '订单【'+_name+"】,删除失败！", "error");
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
});

/**
 * 打开编辑页面
 **/
function edit(_id){
	var $modal = $('#ajax-modal');
	// create the backdrop and wait for next modal to be triggered
    //$('body').modalmanager('loading');
	$.fn.modal.Constructor.prototype.enforceFocus = function () { };
    $modal.load(contextPath + '/proStock/editStockOrder',{"Content-type":"application/x-www-form-urlencoded",id:_id},function(){
	//初始化验证
	//formValidate.init();
	$(".saveOrder").click(function(){
			saveOrder();
		});
	$modal.modal();
    });
}

/**
 * 保存新添或者修改
 */
var unique= 0;
function saveOrder(){
	if(unique==0){//防止快速多次提交
		unique++;
		//获取订单信息
		var _id = $("#id_child").val();
		var _productName = $("#productName_child").val();
		var _costPrice = $("#costPrice_child").val();
		var _orderNum = $("#orderNum_child").val();

		$.ajax({
			type:"post",
			url:contextPath +"/proOrderLog/saveOrder",
			data:{
				id:_id,
				productName:_productName,
				costPrice:_costPrice,
				orderNum:_orderNum,
				type:1
			},
			success:function(data){
				unique = 0;
				if(data.msg==1){
					$("#modal-backdrop").show();
					$("#queryTime_query").val($("#queryTime").val());
					$("#productName_query").val($("#productName").val());
					$("#pageForm").submit();
				}else{
					$.messager.alert('提示',"操作失败！","error");
				}
			},
			error:function(){
				$.messager.alert('提示',"连接服务器失败！","error");
			}
		});
	}
}