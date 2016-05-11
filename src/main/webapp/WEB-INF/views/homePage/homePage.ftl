<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta charset="utf-8" />
	<title>零食管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="yaon" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="${application.getContextPath()}/scripts/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="${application.getContextPath()}/scripts/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
	<!-- END THEME STYLES -->
	<link href="${application.getContextPath()}/skins/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/echarts3/echarts.min.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/echarts3/macarons.js"></script>
</head>
<body class="page-header-fixed">
	<!-- 上框 开始 -->   
	<#include "../index/indexTop.ftl" />
	<!-- 上框 结束 -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- 左边菜单 开始 -->
		<#include "../index/indexMenu.ftl" />
		<!-- 左边菜单 结束 -->
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">
					<!--无线宽带覆盖率-->
					<div id="wirelessCover" style="width:80%;height:400px;float:left;margin-top:20px;margin-left:20px;"></div>
				</div>
			</div>
		</div>
	</div>
    <script type="text/javascript">
		var myChart = echarts.init(document.getElementById('wirelessCover'),'macarons');
		var	option = {
				tooltip : {
					trigger: 'axis',
					axisPointer : {            // 坐标轴指示器，坐标轴触发有效
						type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend: {
					data:['利润', '支出', '收入']
				},
				grid: {
					left: '3%',
					right: '4%',
					bottom: '3%',
					containLabel: true
				},
				xAxis : [
					{
						type : 'value'
					}
				],
				yAxis : [
					{
						type : 'category',
						axisTick : {show: false},
						data : ['周一','周二','周三','周四','周五','周六','周日']
					}
				],
				series : [
					{
						name:'利润',
						type:'bar',
						label: {
							normal: {
								show: true,
								position: 'inside'
							}
						},
						data:[200, 170, 240, 244, 200, 220, 210]
					},
					{
						name:'收入',
						type:'bar',
						stack: '总量',
						label: {
							normal: {
								show: true
							}
						},
						data:[320, 302, 341, 374, 390, 450, 420]
					},
					{
						name:'支出',
						type:'bar',
						stack: '总量',
						label: {
							normal: {
								show: true,
								position: 'left'
							}
						},
						data:[-120, -132, -101, -134, -190, -230, -210]
					}
				]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChart.setOption(option);
    </script>
	<!--自定义js 结束-->
	<script type="text/javascript">
		$(document).ready(function(){
			var winHeight = window.screen.height;
			var scHeight = document.body.scrollTop;
			var winHeight = window.screen.height;
			$('.page-content').css('min-height',winHeight);
			$("#modal-backdrop").hide();
		});
	</script>
</body>
</html>