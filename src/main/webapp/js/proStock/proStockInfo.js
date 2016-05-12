unique = 0;
$(function(){
	$("#add").click(function(){
		$("#modal-backdrop").show();
		$("#editFlowId").val(null);
		$("#flowInfoPage").submit();
	});
	$(".edit").live('click',function(){
		$("#modal-backdrop").show();
		$("#editFlowId").val($(this).attr('fid'));
		$("#flowInfoPage").submit();
	});
	/**
	 * 查询按钮
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#queryTime_query").val($("#queryTime").val());
		$("#queryForm").submit();
	});
	//删除
	$(".delete").live('click',function(){
		var _id=$(this).attr("fid");
		var _name=$(this).attr('fname');
		$.messager.confirm('提示',"是否确定删除? ",function(data){
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
							$("#pageForm").submit();
						}else{
							$("#modal-backdrop").hide();
							$.messager.alert('提示', '删除失败！', "error");
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