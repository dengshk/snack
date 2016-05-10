(function($){
	$(".editUser").click(function(){
		var productId = this.id;
		editProduct(productId);
	});
	
	$(".changeUserState").click(function(){
		var id = this.id;
		var state="";
		if($(this).attr("_islock")==0){
			state=1;
		}else if($(this).attr("_islock")==1){
			state=0;
		}
		changeState(id,state);
	});
	/**
	 * 查询
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#typeId").val($("#qry_typeId").val());
		$("#productName").val($("#qry_productName").val());
		$("#pageForm").submit();
	});
})(jQuery);


/**
 * 打开编辑页面
 **/
function editProduct(productId){
	var $modal = $('#ajax-modal');
	// create the backdrop and wait for next modal to be triggered
    //$('body').modalmanager('loading');
	$.fn.modal.Constructor.prototype.enforceFocus = function () { };
    $modal.load(contextPath + '/record/editProduct',{"Content-type":"application/x-www-form-urlencoded",id:productId},function(){
	//表单验证
    $('#editUser').bootstrapValidator({
	        message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
			fields: {
				name: {
					validators: {
						notEmpty: {}
					}
				},
	            agent1Price: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            },
	            agent2Price: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            },
	            agent3Price: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            },
	            agent4Price: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            },
	            salePrice: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的金额'
		            	}
	            	}
	            },
	            grammage: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的克数'
		            	}
	            	}
	            },
	            expiration: {
	            	validators: {
		            	notEmpty: {},
		            	regexp: {
		            		regexp: /^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
		            		message: '请输入正确的保质期'
		            	}
	            	}
	            }
			}
		}).on('success.form.bv', function(e) {
			// Prevent form submission
            e.preventDefault();
            saveUser();
        });
	$(".saveUser").click(function(){
		$('#editUser').bootstrapValidator('validate');
	});
	$modal.modal();
	    //价格修改
    $("#agent1Price").blur(function(){
			initPrice();
		});
    });
}

/**
 * 自动修改代理价格逐级+2
 */
function initPrice(){
	var price1=$("#agent1Price").val();
	var price2=$("#agent2Price").val();
	var price3=$("#agent3Price").val();
	var price4=$("#agent4Price").val();
	if(price1!=null && price1 != ""){
		if(price2==null||price2==""){
			$("#agent2Price").attr("value",parseFloat(price1)+parseFloat(2));
		}
		if(price3==null||price3==""){
			$("#agent3Price").attr("value",parseFloat(price1)+parseFloat(4));
		}
		if(price4==null||price4==""){
			$("#agent4Price").attr("value",parseFloat(price1)+parseFloat(6));
		}
	}
}


/**
 * 保存新添用户或者修改用户
 */
var unique= 0;
function saveUser(){
	if(unique==0){//防止快速多次提交
		unique++;
		//判断是否通过验证
		//if(!$("#editUser").valid()){
		//	return false; //如果不通过则不提交
		//}
		//获取用户信息
		var _id = $("#id").val();
		var _name =$("#name").val();
		var _agent1Price = $("#agent1Price").val();
		var _agent2Price = $("#agent2Price").val();
		var _agent3Price = $("#agent3Price").val();
		var _agent4Price = $("#agent4Price").val();
		var _salePrice = $("#salePrice").val();
		var _grammage = $("#grammage").val();
		var _expiration = $("#expiration").val();
		var _typeId =$("#typeId").val();
		var _state = -1;
		if($("#state").is(':checked')){
			_state=1;
		}else{
			_state=0;
		}

		var sucMsg="";
		if(_id!=null&&_id!=""){
			sucMsg="修改成功！";
		}else{
			sucMsg="添加成功！";
		}
		$.ajax({
			type:"post",
			url:contextPath +"/record/saveProduct",
			data:{
				id:_id,
				name:_name,
				agent1Price:_agent1Price,
				agent2Price:_agent2Price,
				agent3Price:_agent3Price,
				agent4Price:_agent4Price,
				salePrice:_salePrice,
				expiration:_expiration,
				grammage:_grammage,
				state:_state,
				typeId:_typeId
			},
			success:function(data){
				unique = 0;
				if(data.msg==1){
					$('#ajax-modal').modal('hide');
					$.messager.alert('提示',sucMsg,"success",function(){reloadPage(contextPath + '/record/newProduct',0);});
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

/**
 * 更改用户状态
 */
function changeState(id,state){
	$.ajax({
		type:"post",
		url:contextPath +"/record/changeState",
		data:{
			id:id,
			state:state
		},
		success:function(data){
			if(data.msg==1){
				$.messager.alert('提示',"修改成功！","success",function(){reloadPage(contextPath + '/record/newProduct?op_menu=11',100);});
			}else{
				$.messager.alert('提示',"操作失败！","error");
			}
		},
		error:function(){
			$.messager.alert('提示',"连接服务器失败！","error");
		}
	});
}

//延迟设置时间后刷新页面
var timeout1;
function reloadPage(url,ms){
	clearTimeout(timeout1);
	timeout1=setTimeout(function(){
		//window.location.href=url;
		$("#pageForm").submit();
		//window.location.reload();
		//history.go(0); 
		//location.reload(); 
		//location=location; 
		//location.assign(location); 
		//document.execCommand('Refresh'); 
		//window.navigate(location); 
		//location.replace(location); 
		//document.URL=location.href;
	},ms);
}

$(function(){
	$(".deleteUser").live('click',function(){
		var id=$(this).attr("userid");
		$.messager.confirm('提示',"是否确定删除\""+$(this).attr('un')+"\"？",function(data){
			if(data){
				$.ajax({
					type:"post",
					url:contextPath +"/record/deleteProduct",
					data:{
						id:id
					},
					success:function(data){
						if(data.msg==1){
							$.messager.alert('提示',"删除成功！","success",function(){reloadPage(contextPath + '/record/newProduct?op_menu=11',100);});
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