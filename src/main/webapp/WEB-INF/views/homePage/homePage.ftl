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
					<!--累计盈利-->
					<div id="chart4profit" style="width:95%;height:500px;float:left;margin-top:20px;margin-left:30px;"></div>
					<!-- 分隔线  -->
					<div style="width: 97%;float: left;margin-top:30px;margin-left:10px;argin-bottom:30px;vertical-align:middle;">
						<div style="border-top:3px solid #ddd;height:1px;width: 100%;float: left;"></div>
					</div>
					<!--收支情况-->
					<div id="chart4IO" style="width:95%;height:500px;float:left;margin-top:30px;margin-left:30px;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${application.getContextPath()}/js/homePage/homePage.js"></script>
	<!--自定义js-->
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