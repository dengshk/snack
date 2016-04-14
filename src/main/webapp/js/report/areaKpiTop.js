$(function(){
	$("#leadExcel").click(function(){
		$("#modal-backdrop").show();
		$.ajax({
			type:"post",
			url:contextPath + "/areaKpiTop/export",
			data:{
				queryTime:$("#queryTime_page").val(),
				
				province:$("#province_page").val(),
				district:$("#district_page").val(),
				area:$("#area_page").val(),
				kpiType:$("#kpi_page").val()
			},
			success:function(data){
				$("#modal-backdrop").hide();
				var fileName = data.fileName;
				if(fileName!="-1"){
					window.location.href=contextPath+"/export/export?fileName="+fileName;
				}else{
					$.messager.alert('提示',"生成excel失败","error");
				}
			},
			error:function(data){
				$("#modal-backdrop").hide();
				$.messager.alert('提示',"生成excel失败","error");
			}
		});
	});
});
function dataPage(){
	$("#modal-backdrop").show();
	$("#pageForm").submit();
}
$("#querybtn").click(function(){
	   	$("#modal-backdrop").show();
	   	
	   	$("#queryTime_query").val($("#queryTime").val());
	   	$("#province_query").val($("#province").val());
	   	$("#district_query").val($("#district").val());
	   	$("#area_query").val($("#area").val());
	   	$("#kpi_query").val($("#kpiType").val());
	   	
		$("#kpiForm").submit();
});