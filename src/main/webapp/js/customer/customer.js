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
	//表单验证
    $('#editUser').bootstrapValidator({
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
            save();
        });
	$(".save").click(function(){
		$('#editUser').bootstrapValidator('validate');
	});
	$modal.modal();
    });
}

/**
 * 保存新添或者修改
 */
var unique= 0;
function save(){
	if(unique==0){//防止快速多次提交
		unique++;
		//判断是否通过验证
		//if(!$("#editUser").valid()){
		//	return false; //如果不通过则不提交
		//}
		//获取信息
		var _id = $("#id").val();
		var _customerName =$("#customerName").val();
		var _customerTel = $("#customerTel").val();
		var _address = $("#address").val();
		
		$.ajax({
			type:"post",
			url:contextPath +"/customer/save",
			data:{
				id:_id,
				customerName:_customerName,
				customerTel:_customerTel,
				address:_address
			},
			success:function(data){
				unique = 0;
				if(data.msg==1){
					window.location.href=contextPath+"/customer/customer";
				}else{
					var info="";
					if(data.info!=null&&data.info!=""){
						info='操作失败！' + data.info;
					}else{
						info='操作失败！';
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
							$.messager.alert('提示',"操作失败！","error");
						}
					},
					error:function(){
						$.messager.alert('提示',"连接服务器失败！","error");
					}
				});
			}
		});
	});
});