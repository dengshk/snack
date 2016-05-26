(function($){
	$(".edit").click(function(){
		var customerId = this.id;
		edit(customerId);
	});
	/**
	 * 查询
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#customerName_submit").val($("#qry_customerName").val());
		$("#customerLevel_submit").val($("#qry_customerLevel").val());
		$("#pageForm").submit();
	});
})(jQuery);

/**
 * 打开编辑页面
 **/
function edit(customerId){
	var $modal = $('#ajax-modal');
	// create the backdrop and wait for next modal to be triggered
    //$('body').modalmanager('loading');
	$.fn.modal.Constructor.prototype.enforceFocus = function () { };
    $modal.load(contextPath + '/customer/edit',{"Content-type":"application/x-www-form-urlencoded",id:customerId},function(){
    $modal.modal();
	$('#customerLevel').select2();
	//表单验证
    $('#editCustomer').bootstrapValidator({
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
	            address: {
	            	validators: {
		            	notEmpty: {}
	            	}
	            }
			}
		}).on('success.form.bv', function(e) {
			// Prevent form submission
            e.preventDefault();
            saveCustomer();
        });
        //点击事件
		$(".save").click(function(){
			$('#editCustomer').bootstrapValidator('validate');
		});
    });
}

/**
 * 保存新添或者修改
 */
var uniqueFlag= 0;
function saveCustomer(){
	if(uniqueFlag==0){//防止快速多次提交
		uniqueFlag++;
		//获取信息
		var _id = $("#id").val();
		var _customerName = $("#customerName").val();
		var _customerLevel = $("#customerLevel").val();
		var _customerTel = $("#customerTel").val();
		var _address = $("#address").val();
		
		$.ajax({
			type:"post",
			url:contextPath +"/customer/save",
			data:{
				id:_id,
				customerName:_customerName,
				customerLevel:_customerLevel,
				customerTel:_customerTel,
				address:_address
			},
			success:function(data){
				uniqueFlag = 0;
				if(data.msg==1){
					window.location.href=contextPath+"/customer/customer";
				}else{
					var info="";
					if(data.info!=null&&data.info!=""){
						info='操作失败！' + data.info;
					}else{
						info='操作失败！';
					}
					toastr.warning(info);
				}
			},
			error:function(){
				uniqueFlag = 0;
				toastr.error("连接服务器失败！");
			}
		});
	}
}

$(function(){
	$(".delete").live('click',function(){
		var id=$(this).attr("id");
		$.messager.confirm('提示',"是否确定删除【"+$(this).attr('cname')+"】？",function(data){
			if(data){
				$.ajax({
					type:"post",
					url:contextPath +"/customer/delete",
					data:{
						id:id
					},
					success:function(data){
						if(data.msg==1){
							window.location.href=contextPath+"/customer/customer";
						}else{
							toastr.warning("操作失败！ ");
						}
					},
					error:function(){
						toastr.error("连接服务器失败！");
					}
				});
			}
		});
	});
});