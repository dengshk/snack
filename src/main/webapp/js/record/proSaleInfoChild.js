unique = 0;
$(function(){
	$(".editUser").click(function(){
		var _id = $(this).attr("fid");
		if($('#flowId').val()==null||$('#flowId').val()==""){
			$.messager.alert('提示', '请先保存一笔订货信息!', "error");
			//$('#proInfoForm').bootstrapValidator('validate');
		}else{
			editOrder(_id);
		}
	});
	
	$(".delete").live('click',function(){
		var _id=$(this).attr("fid");
		var _name=$(this).attr('fname');
		$.messager.confirm('提示',"是否删除订单【"+_name+"】? ",function(data){
			if(data){
				$("#modal-backdrop").show();
				$.ajax({
					type:"post", 
					url:contextPath + "/proOrderLog/deleteOne",
					data:{
						id:_id
					},
					success:function(data){
						$("#modal-backdrop").hide();
						if(data.msg==1){
							$("#editChild").val($("#flowId").val());
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
	//表单验证
    $('#proInfoForm').bootstrapValidator({
	        message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
			fields: {
				customerName: {
					selector: '#customerName',
					validators: {
						callback: {
	                        message: '请选择订货人',
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
	            reallyPay:{
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            }
			}
		}).on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Use Ajax to submit form data
            $("#modal-backdrop").show();
            $.post(contextPath+'/proSale/saveSaleInfo', $form.serialize(), function(data) {
					$("#modal-backdrop").hide();
					if (data.msg != "-1") {
						$("#modal-backdrop").show();
						$("#editChild").val(data.flowId);
						$("#editPage").submit();
					} else {
						$.messager.alert('提示', "操作失败！", "error",function(){
							$("#modal-backdrop").show();
							$("#editChild").val(null);
							$("#editPage").submit();
						});
					}
            }, 'json');
        });
	//选项改变补全订货人其他信息
	$('#customerId').live('change',function(){
		if($("#customerId").val()!=-1){
	        $.ajax({
		          type : "post",
		          url: contextPath+'/customer/queryById',
		          data: {
	    		      customerId:$("#customerId").val()
		          },
		          success: function( data ) {
		              if(data.customer!=null){
		        		  $("#customerTel").val(data.customer.customerTel);
		        		  $("#address").val(data.customer.address);
		        		  $("#customerLevel").select2("val", data.customer.customerLevel);
		              }
		          }
		    });
		}
	});

});

/**
 * 打开编辑页面
 **/
function editOrder(_id){
	var $modal = $('#ajax-modal');
	// create the backdrop and wait for next modal to be triggered
    //$('body').modalmanager('loading');
	$.fn.modal.Constructor.prototype.enforceFocus = function () { };
    $modal.load(contextPath + '/proOrderLog/editSaleOrder',{"Content-type":"application/x-www-form-urlencoded",id:_id},function(){
		$modal.modal();
		$('#productName').select2();
		//表单验证
	    $('#editUser').bootstrapValidator({
		        message: 'This value is not valid',
	            feedbackIcons: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
				fields: {
					productName: {
						selector: '#productName',
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
					costPrice:{
		            	validators: {
			            	notEmpty: {},
			            	regexp: {
			            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
			            		message: '请输入正确的金额'
			            	}
		            	}
		            },
		            salePrice:{
		            	validators: {
			            	notEmpty: {},
			            	regexp: {
			            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
			            		message: '请输入正确的金额'
			            	}
		            	}
		            },
		            orderNum:{
		            	validators: {
			            	notEmpty: {}
		            	}
		            }
				}
			}).on('success.form.bv', function(e) {
				// Prevent form submission
	            e.preventDefault();
	            saveOrder();
	        });
	    //点击事件
		$(".saveOrder").click(function(){
			$('#editUser').bootstrapValidator('validate');
		});
		//选项改变补全产品其他信息
		$('#productName').live('change',function(){
			if($("#productName").val()!=-1){
				var customerLevel = $("#customerLevel").val();
		        $.ajax({
			          type : "post",
			          url: contextPath+'/record/queryByID',
			          data: {
		    			id:$("#productName").val()
			          },
			          success: function( data ) {
			              if(data.product!=null){
			        		  $("#costPrice").val(data.product.agent2Price);
			        		  if(customerLevel==1){
				        		  $("#salePrice").val(data.product.agent1Price);
			        		  }else if(customerLevel==2){
			        		      $("#salePrice").val(data.product.agent2Price);
			        		  }else if(customerLevel==3){
			        		      $("#salePrice").val(data.product.agent3Price);
			        		  }else if(customerLevel==4){
			        		      $("#salePrice").val(data.product.agent4Price);
			        		  }else if(customerLevel==5){
			        		      $("#salePrice").val(data.product.salePrice);
			        		  }
			              }
			          }
			    });
			}
		});
	
    });
}

/**
 * 返回
 */
function goBack(){
	$("#modal-backdrop").show();
	window.location.href=contextPath+"/proSale/fetchPage";
}

/**
 * 保存新添或者修改
 */
var unique= 0;
function saveOrder(){
	if(unique==0){//防止快速多次提交
		unique++;
		//获取订单信息
		var _id = $("#id").val();
		var _flowId =$("#flowId").val();
		var _productId = $("#productName").val();
		var _productName = $("#productName").find("option:selected").text();
		var _costPrice = $("#costPrice").val();
		var _salePrice = $("#salePrice").val();
		var _orderNum = $("#orderNum").val();

		$.ajax({
			type:"post",
			url:contextPath +"/proOrderLog/saveOrder",
			data:{
				id:_id,
				flowId:_flowId,
				productId: _productId,
				productName:_productName,
				costPrice:_costPrice,
				salePrice:_salePrice,
				orderNum:_orderNum,
				type:2
			},
			success:function(data){
				unique = 0;
				if(data.msg==1){
					$("#modal-backdrop").show();
					$("#editChild").val($("#flowId").val());
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