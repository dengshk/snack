$(function(){
	/**
	 * 查询
	 */
	$("#querybtn").click(function(){
		$("#modal-backdrop").show();
		$("#typeId").val($("#qry_typeId").val());
		$("#nums").val($("#qry_nums").val());
		$("#pageForm").submit();
	});
});