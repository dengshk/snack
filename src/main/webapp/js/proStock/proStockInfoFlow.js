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
	//删除
	$(".delete").live('click',function(){
		var _id=$(this).attr("fid");
		var _flowId =$("#flowId").val();
		var _name=$(this).attr('fname');
		$.messager.confirm('提示',"是否删除订单【"+_name+"】? ",function(data){
			if(data){
				$("#modal-backdrop").show();
				$.ajax({
					type:"post", 
					url:contextPath + "/proStock/deleteOneOrder",
					data:{
						id:_id,
						flowId:_flowId
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
						$("#editFlowId").val(data.flowId);
						$("#editPage").submit();
					} else {
						$.messager.alert('提示', "保存失败！", "error");
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
    $modal.load(contextPath + '/proStock/editStockOrder',{"Content-type":"application/x-www-form-urlencoded",id:_id},function(){
		$modal.modal();
		$('#productName_child').select2();
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
		$("#save_child").click(function(){
			$('#editStockChild').bootstrapValidator('validate');
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
		var _flowId =$("#flowId").val();
		var _productId = $("#productName_child").val();
		var _productName = $("#productName_child").find("option:selected").text();
		var _costPrice = $("#costPrice_child").val();
		var _orderNum = $("#orderNum_child").val();

		$.ajax({
			type:"post",
			url:contextPath +"/proStock/saveOrder",
			data:{
				id:_id,
				flowId:_flowId,
				productId: _productId,
				productName:_productName,
				costPrice:_costPrice,
				orderNum:_orderNum,
				type:1
			},
			success:function(data){
				unique = 0;
				if(data.msg==1){
					$("#modal-backdrop").show();
					$("#editFlowId").val($("#flowId").val());
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