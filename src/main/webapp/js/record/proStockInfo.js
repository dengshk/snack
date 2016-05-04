unique = 0;
$(function(){
	/**
	 * 查询
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#queryTime_query").val($("#queryTime").val());
		$("#productName_query").val($("#productName").val());
		$("#pageForm").submit();
	});
});