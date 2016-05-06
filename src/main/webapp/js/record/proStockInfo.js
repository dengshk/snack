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
							var info = '订单【'+_name+'】,删除失败！'; 
							if(data.info!=null && data.info!=""){
								info = data.info;
							}
							$("#modal-backdrop").hide();
							$.messager.alert('提示', info, "error");
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
	//表单验证
    $('#editStockChild').bootstrapValidator({
	        message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
			fields: {
				productName_child: {
					validators: {
						notEmpty: {}
					}
				},
	            costPrice_child: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            },
	            orderNum_child: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^[1-9]\d*$/,
		            		message: '请输入正确的订单数'
		            	}
	            	}
	            }
			}
		}).on('success.form.bv', function(e) {
			// Prevent form submission
            e.preventDefault();
            saveOrder();
        });
        
	$(".saveOrder").click(function(){
		$('#editStockChild').bootstrapValidator('validate');
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
			url:contextPath +"/proStock/saveOrder",
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
					var info = "操作失败！"; 
					if(data.info!=null && data.info!=""){
						info = data.info;
					}
					$.messager.alert('提示',info,"error");
				}
			},
			error:function(){
				$.messager.alert('提示',"连接服务器失败！","error");
			}
		});
	}
}