$(function(){
	/**
	 * 查询
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#queryTime_query").val($("#queryTime").val());
		$("#typeId_query").val($("#qry_typeId").val());
		$("#productName_query").val($("#qry_productName").val());
		$("#editPage").submit();
	});
	$(".editOrder").click(function(){
		var _id = $(this).attr("fid");
		editOrder(_id);
	});
	$(".delete").live('click',function(){
		var _id=$(this).attr("fid");
		var _name=$(this).attr('fname');
		$.messager.confirm('提示',"是否删除订单【"+_name+"】? ",function(data){
			if(data){
				$("#modal-backdrop").show();
				$.ajax({
					type:"post", 
					url:contextPath + "/proSelf/deleteOneOrder",
					data:{
						id:_id
					},
					success:function(data){
						$("#modal-backdrop").hide();
						if(data.msg==1){
							$("#editPage").submit();
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

function editOrder(_id){
	var $modal = $('#ajax-modal');
	// create the backdrop and wait for next modal to be triggered
    //$('body').modalmanager('loading');
	$.fn.modal.Constructor.prototype.enforceFocus = function () { };
    $modal.load(contextPath + '/proSelf/child',{"Content-type":"application/x-www-form-urlencoded",id:_id},function(){
		$modal.modal();
		$('#productName_child').select2();
		//表单验证
	    $('#editOrderChild').bootstrapValidator({
		        message: 'This value is not valid',
	            feedbackIcons: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
				fields: {
					productName_child: {
						selector: '#productName_child',
						validators: {
							callback: {
		                        message: '请选择产品名称',
								callback: function(value, validator) {
									if(value == "-1"){
										return false;
									}else{
										return true;
									}
								}
							}
						}
					},
					costPrice_child:{
		            	validators: {
			            	notEmpty: {},
			            	regexp: {
			            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
			            		message: '请输入正确的金额'
			            	}
		            	}
		            },
		            orderNum_child:{
		            	validators: {
			            	notEmpty: {},
			            	digits: {}
		            	}
		            }
				}
			}).on('success.form.bv', function(e) {
				// Prevent form submission
	            e.preventDefault();
	            saveOrder();
	        });
	    //点击事件
		$("#saveBtn").click(function(){
			$('#editOrderChild').bootstrapValidator('validate');
		});
		//选项改变补全产品其他信息
		$('#productName_child').live('change',function(){
			if($("#productName_child").val()!=-1){
		        $.ajax({
			          type : "post",
			          url: contextPath+'/record/queryByID',
			          data: {
		    			id:$("#productName_child").val()
			          },
			          success: function( data ) {
			              if(data.product!=null){
			        		  $("#costPrice_child").val(data.product.agent2Price);
			              }
			          }
			    });
			}
		});
	
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
		var _flowId =$("#flowId_query").val();
		var _productId = $("#productName_child").val();
		var _productName = $("#productName_child").find("option:selected").text();
		var _costPrice = $("#costPrice_child").val();
		var _orderNum = $("#orderNum_child").val();

		$.ajax({
			type:"post",
			url:contextPath +"/proSelf/saveOrder",
			data:{
				id:_id,
				flowId:_flowId,
				productId: _productId,
				productName:_productName,
				costPrice:_costPrice,
				orderNum:_orderNum,
				type:2
			},
			success:function(data){
				unique = 0;
				if(data.msg==1){
					$("#modal-backdrop").show();
					$("#editPage").submit();
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