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
	
	$("#save").live('click',function(){
		if(unique==0){
			var _flowId = $("#flowId").val();
			var _customerName = $("#customerName").val();
			var _customerTel = $("#customerTel").val();
			var _expressPrice = $("#expressPrice").val();
			var _express = $("#express").val();
			var _expressNo = $("#expressNo").val();
			var _address = $("#address").val();
			var _reallyPay = $("#reallyPay").val();
			var _orderDate = $("#orderDate").val();
			$("#modal-backdrop").show();
			$.ajax({
				type : "post",
				url : contextPath+"/proSale/saveSaleInfo",
				data:{
					flowId : _flowId,
					customerName : _customerName,
					customerTel : _customerTel,
					expressPrice : _expressPrice,
					express : _express,
					expressNo : _expressNo,
					address : _address,
					reallyPay : _reallyPay,
					orderDate : _orderDate
				},
				success : function(data) {
					unique = 0;
					$("#modal-backdrop").hide();
					if (data.msg != "-1") {
						$.messager.show({
							title:'提示',
							msg:'操作成功!',
							showType:'show',
							style:{
								right:'',
								left:0,
								top:document.body.scrollTop+document.documentElement.scrollTop,
								bottom:''
							}
						});
						$("#flowId").val(data.flowId);
					} else {
						$.messager.alert('提示', "操作失败！", "error");
					}
				},
				error : function() {
					unique = 0;
					$("#modal-backdrop").hide();
					$.messager.alert('提示', "连接服务器失败！", "error");
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