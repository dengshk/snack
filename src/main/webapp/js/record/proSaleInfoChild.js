unique = 0;
$(function(){
	$(".editUser").click(function(){
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
					validators: {
						notEmpty: {}
					}
				},
	            customerTel: {
	                validators: {
	                    notEmpty: {},
	                    digits: {},
	                    regexp: {
	                        regexp: /^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/,
	                        message: '请输入正确的11位手机号码'
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

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

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
	//失去焦点自动补全订货人其他信息
	$('#customerName').live('blur',function(){
		if($("#customerTel").val()=="" || $("#address").val()==""){
	        $.ajax({
		          type : "post",
		          url: contextPath+'/proSale/queryByName',
		          data: {
	    			customerName:$("#customerName").val()
		          },
		          success: function( data ) {
		              if(data.customer!=null){
	                      if($("#customerTel").val()==""){
			        		  $("#customerTel").val(data.customer.customerTel);
			        	  }
			        	  if($("#address").val()==""){
			        		  $("#address").val(data.customer.address);
			        	  }
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
	//初始化验证
	//formValidate.init();
	$(".saveOrder").click(function(){
			saveOrder();
		});
	$modal.modal();
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
		//判断是否通过验证
		//if(!$("#editUser").valid()){
		//	return false; //如果不通过则不提交
		//}
		//获取订单信息
		var _id = $("#id").val();
		var _flowId =$("#flowId").val();
		var _productName = $("#productName").val();
		var _costPrice = $("#costPrice").val();
		var _salePrice = $("#salePrice").val();
		var _orderNum = $("#orderNum").val();

		$.ajax({
			type:"post",
			url:contextPath +"/proOrderLog/saveOrder",
			data:{
				id:_id,
				flowId:_flowId,
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