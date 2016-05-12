$(function(){
	//编辑/新增订单
	$(".editOrder").click(function(){
		var _id = $(this).attr("fid");
		if($('#flowId').val()==null||$('#flowId').val()==""){
			$.messager.alert('提示', '请先保存一笔进货信息!', "error");
		}else{
			editOrder(_id);
		}
	});
	//表单验证
    $('#proStockForm').bootstrapValidator({
	        message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
			fields: {
				expressPrice:{
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
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
            $.post(contextPath+'/proStock/saveStockInfo', $form.serialize(), function(data) {
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
});


/**
 * 返回
 */
function goBack(){
	$("#modal-backdrop").show();
	window.location.href=contextPath+"/proStock/proStock";
}

/**
 * 打开编辑页面
 **/
function editOrder(_id){
	var $modal = $('#ajax-modal');
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