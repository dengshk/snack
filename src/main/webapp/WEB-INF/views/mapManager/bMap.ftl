<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.0.2
Version: 1.5.4
Author: KeenThemes
Website: http://www.keenthemes.com/
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>移动网络自动路测系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="caoj" />
	<meta name="MobileOptimized" content="320">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="${application.getContextPath()}/scripts/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/js/easyui/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/js/easyui/themes/icon.css">
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
	<!--select2 选择器 开始-->
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/select2/select2_metro.css" />
	<!--easyui-->
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/js/easyui/themes/gray/easyuirevise.css">
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/js/easyui/themes/icon.css">
	<style>
		#container{height:500px;width:100%}  
		.legend{position: absolute; z-index: 10; -moz-user-select: none;  right: 0; top: 21px; left: auto;width:220px;}
		.legend ul li{height:24px;line-height:24px;list-style-type:none;float:left;width:90px;}
		#titlediv {margin-bottom:1px;border: 1px solid transparent;min-height: 50px;position: relative;}
#tooltip{  
    float:left;  
    position:absolute;  
    border:1px solid #333;  
    background:#f7f5d1;  
    padding:1px;  
    color:#333;  
    display:none;
    z-index:1;
} 
.gis-tk{width:420px;margin:0px; padding:0px;border-collapse:collapse; font-family:Arial; color:#428bca;border-top:1px  solid #428bca}
.gis-tk ul{float:left; height:auto; line-heigh:auto;background:none;padding-left:0px;}
.gis-tk ul li{background:none;float:none;text-align:left;height:24px;line-height:24px;list-style-type:none;}
.gis-tk ul li span{float:left; width:90px; display:block; color:#000}
.gis-mapgj {
z-index: 10; position:relative; float:right; right:17px;top:10px;

}
.gis-mapgj .gis-mapgj-hand, .gis-mapgj .gis-mapgj-marquee,.gis-mapgj .gis-mapgj-marquee-hover,.gis-mapgj .gis-mapgj-hand-hover,.gis-mapgj .gis-mapgj-circle,.gis-mapgj .gis-mapgj-circle-hover {
	float:right;
	direction: ltr;
	overflow: hidden;
	text-align: left;
	position: relative;
	color: rgb(0, 0, 0);
	font-family: Roboto, Arial, sans-serif;
	-moz-user-select: none;
	font-size: 11px;
	background:#fff;
	padding: 10px;
	border-bottom-left-radius: 2px;
	border-top-left-radius: 2px;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, 0.15);
	box-shadow: 0px 1px 4px -1px rgba(0, 0, 0, 0.3);
    width:16px; height:16px;
}
.gis-mapgj .gis-mapgj-hand img, .gis-mapgj .gis-mapgj-marquee img,.gis-mapgj .gis-mapgj-circle img,.gis-mapgj .gis-mapgj-hand-hover img,.gis-mapgj .gis-mapgj-marquee-hover img,.gis-mapgj .gis-mapgj-circle-hover img{position: absolute; left: 1px; top: -48px; -moz-user-select: none; border: 0px none; padding: 0px; margin: 0px; width: 16px; height: 103px; cursor:pointer;}
.gis-mapgj .gis-mapgj-marquee img{top:0px; right:4px; left:2px;}
.gis-mapgj .gis-mapgj-circle img{top:-66px; right:4px;}
.gis-mapgj .gis-mapgj-hand-hover img{top:-32px; right:4px; left:2px;}
.gis-mapgj .gis-mapgj-hand img{top:-50px; right:4px;left:2px;}
.gis-mapgj .gis-mapgj-marquee-hover img{top:-15px; right:4px; left:2px;}
.gis-mapgj .gis-mapgj-circle-hover img{top:-81px; right:4px;}
.no_service_box{position:absolute; top:50%; left:50%;}
.no_service {width:180px; height:26px; margin:-13px 0 0 -40px;}
.no_service span{float:leftl;}
.no_service img{float:left; width:23px; margin-right:5px;}
div.messager-body.panel-body.panel-body-noborder.window-body{
		width:100% !important;
	}
	</style>
	<script>
		var contextPath = '${application.getContextPath()}';
	</script>
	<script src="${application.getContextPath()}/js/jquery-1.7.1.min.js" type="text/javascript"></script>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->   
	<#include "../index/indexTop.ftl" />
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<#include "../index/indexMenu.ftl" />
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet-body">
						<div class="navbar navbar-default" id="titlediv" role="navigation">
							<div  class="navbar-form navbar-left breadcrumb" >
								<!--时间范围控件       开始-->
								<div class="form-group">
									<label class="control-label">时间:</label>
									<div class="form-group" id="reportrange">
										<input type="text" name="queryTime" value="${(queryTime)!}" class="form-control" readOnly>	
									</div>
								</div>
								<div class="form-group" style="margin-left;8px;">
									<label class="control-label">运营商:</label>
									<select class="form-control input-small select2me kpi_v" style="width: 175px !important;" name="operator" id="operator">
										<#if operators ?? && operators?size &gt; 0>
											<#list operators as p>
												<option value="${(p.id)!}" <#if vo.operator?? && vo.operator+'' == p.id>selected = "true" </#if>>${(p.text)!}</option>
											</#list>
										</#if>
									</select>	
								</div>
								<div class="form-group" style="margin-left:8px;">
									<label class="control-label">指标类型:</label>
									<select class="form-control input-small select2me kpi_v" style="width: 150px !important;" name="kpiType" id="kpiType">
										<option value="1" <#if vo.kpiType?? && vo.kpiType == 1>selected = "true" </#if>>RSRP</option>
										<option value="2" <#if vo.kpiType?? && vo.kpiType == 2>selected = "true" </#if>>SNR</option>
										<option value="3" <#if vo.kpiType?? && vo.kpiType == 3>selected = "true" </#if>>RSRQ</option>
										<option value="4" <#if vo.kpiType?? && vo.kpiType == 4>selected = "true" </#if>>下行链路带宽</option>
										<option value="5" <#if vo.kpiType?? && vo.kpiType == 5>selected = "true" </#if>>时延</option>
										<option value="6" <#if vo.kpiType?? && vo.kpiType == 6>selected = "true" </#if>>丢包</option>
									</select>
									&nbsp;
									<select class="form-control input-small select2me" style="width: 125px !important;margin-left:-5px;" name="kpiSymbol" id="kpiSymbol">
										<option value="1" <#if vo.kpiSymbol?? && vo.kpiSymbol == 1>selected = "true" </#if>>></option>
										<option value="2" <#if vo.kpiSymbol?? && vo.kpiSymbol == 2>selected = "true" </#if>>>=</option>
										<option value="3" <#if vo.kpiSymbol?? && vo.kpiSymbol == 3>selected = "true" </#if>>=</option>
										<option value="4" <#if vo.kpiSymbol?? && vo.kpiSymbol == 4>selected = "true" </#if>><</option>
										<option value="5" <#if vo.kpiSymbol?? && vo.kpiSymbol == 5>selected = "true" </#if>><=</option>
									</select>   
									&nbsp;                                   
									<input name="kpiVaule" type="text" class="form-control " style="width:146px;margin-left:-5px;" id="kpiVaule" maxlength="8" value="${(kpiVaule)!}" placeholder="请输入指标值">
						     	</div>
					     </br>
							<!--区域  开始-->
								<div class="form-group">
									<label class="control-label">区域:</label>
									<select class="form-control input-small select2me" style="width:110px !important;" name="province" id="province">
										<#if countrys ?? && countrys?size &gt; 0>
											<#list countrys as p>
												<option value="${(p.id)!}" <#if vo?? && p.id == vo.province>selected</#if>>${(p.text)!}</option>
											</#list>
										</#if>
									</select>
									&nbsp;
									<select class="fform-control input-small select2me" <#if user?? && user.district?? && user.district=='-1'>hasAreaAll="1"</#if> style="width:80px !important;margin-left:-5px;" name="district" id="district">
										<#if user?? && user.district?? && user.district=='-1'><option value="-1"  <#if vo?? && '-1' == vo.district>selected</#if>>全部</option></#if>
										<#if citys ?? && citys?size &gt; 0>
											<#list citys as p>
												<option value="${(p.id)!}"  <#if vo?? && p.id == vo.district>selected</#if>>${(p.text)!}</option>
											</#list>
										</#if>
									</select>
									&nbsp;
									<select class="form-control input-small select2me" <#if user?? && user.district?? && user.district=='-1'>hasAreaAll="1"</#if> style="width:110px !important;margin-left:-5px;" name="area" id="area">
										<#if user?? && user.county?? && user.county=='-1'><option value="-1" <#if vo?? && '-1' == vo.area>selected</#if>>全部</option></#if>
										<#if areas ?? && areas?size &gt; 0>
											<#list areas as p>
												<option value="${(p.id)!}" <#if vo?? && p.id == vo.area>selected</#if>>${(p.text)!}</option>
											</#list>
										</#if>
									</select>
								</div>
								<!-- 区域 结束 -->	
								
								<!--道路  开始-->
								<div class="form-group" style="margin-left:8px;">
									<label class="control-label">道路类型:</label>
									<select class="form-control input-small select2me" style="width: 80px !important;" name="roadType" id="roadType">
										<option value="-1" <#if vo.roadType ?? && vo.roadType==-1>selected</#if>>全部</>
										<option value="1" <#if vo.roadType ?? && vo.roadType==1>selected</#if>>道路</>
										<option value="2" <#if vo.roadType ?? && vo.roadType==2>selected</#if>>桥梁</>
										<option value="3" <#if vo.roadType ?? && vo.roadType==3>selected</#if>>隧道</>
									</select>
								</div>
								<div class="form-group" style="margin-left:8px;">
									<label class="control-label">等级:</label>
									<select class="fform-control input-small select2me" style="width:80px !important;" name="roadLevel" id="roadLevel">
										       <option value="-1" <#if vo.roadLevel ?? && vo.roadLevel==-1>selected</#if>>全部</option>
												<option value="1" <#if vo.roadLevel ?? && vo.roadLevel==1>selected</#if>>主干路</option>
												<option value="2" <#if vo.roadLevel ?? && vo.roadLevel==2>selected</#if>>次干路</option>
												<option value="3" <#if vo.roadLevel ?? && vo.roadLevel==3>selected</#if>>高速公路</option>
												<option value="4" <#if vo.roadLevel ?? && vo.roadLevel==4>selected</#if>>国道</option>
												<option value="5" <#if vo.roadLevel ?? && vo.roadLevel==5>selected</#if>>省道</option>
												<option value="6" <#if vo.roadLevel ?? && vo.roadLevel==6>selected</#if>>县道</option>
												<option value="7" <#if vo.roadLevel ?? && vo.roadLevel==7>selected</#if>>乡村道路</option>
									</select>
								</div>
								<div class="form-group" style="margin-left:8px;">
									<label class="control-label" >名称:</label>
									<select class="form-control input-small select2me" style="width:140px !important;" name="roadId" id="roadId" placeholder="请选择道路">
									<option value=""></option>
										<#if roads ?? && roads?size &gt; 0>
											<#list roads as p>
												<option value="${(p.id)!}" <#if vo??&&vo.roadId?? && p.id == vo.roadId>selected</#if>>${(p.text)!}</option>
											</#list>
										</#if>
									</select>
								</div>
								<!--道路 结束-->	
								&nbsp;
								<button class="btn blue" id="btn_query" style="margin-top:-6px;padding:7px 14px;">查询</button>
								<button class="btn green" onclick="excelClick('')" id="btn_export" style="margin-top:-6px;margin-left:5px;padding:7px 14px;">导出</button>
							</div>
							<!--颜色说明-->
							<div class="legend" id="legend"><ul>
							          <li class="heat_7"><input type="checkbox" name="kpiInterv" value="7" <#if vo.kpiInterv?index_of("7")!=-1>checked ='checked'</#if>><font  style="color:#000000;font-size:18px;">${(kpis.shape)!}</font>
							              <span style="font-size:11px;"> 无服务</span>
							               </li>
							               <li class="heat_1"><input type="checkbox" name="kpiInterv" value="1" <#if vo.kpiInterv?index_of("1")!=-1>checked ='checked'</#if>><font  style="color:${(kpis.range_one_color)!};font-size:18px;">${(kpis.shape)!}</font>
							              <span style="font-size:11px;"> 
							              <#if kpis.range_one_state ?? && kpis.range_one_state==1>(${(kpis.range_one_start)!},${(kpis.range_one_end)!})</#if>
							               <#if kpis.range_one_state ?? && kpis.range_one_state==2>[${(kpis.range_one_start)!},${(kpis.range_one_end)!})]</#if>
							               <#if kpis.range_one_state ?? && kpis.range_one_state==3>(${(kpis.range_one_start)!},${(kpis.range_one_end)!}]</#if>
							               <#if kpis.range_one_state ?? && kpis.range_one_state==4>[${(kpis.range_one_start)!},${(kpis.range_one_end)!})</#if></span>
							               </li>
											<li class="heat_2"> <input type="checkbox" name="kpiInterv" value="2" <#if vo.kpiInterv?index_of("2")!=-1>checked ='checked'</#if>><font style="color:${(kpis.range_two_color)!};font-size:18px;">${(kpis.shape)!}</font>
										  <span style="font-size:11px;"> 
										  <#if kpis.range_two_state ?? && kpis.range_two_state==1>(${(kpis.range_two_start)!},${(kpis.range_two_end)!})</#if>
							               <#if kpis.range_two_state ?? && kpis.range_two_state==2>[${(kpis.range_two_start)!},${(kpis.range_two_end)!})]</#if>
							               <#if kpis.range_two_state ?? && kpis.range_two_state==3>(${(kpis.range_two_start)!},${(kpis.range_two_end)!}]</#if>
							               <#if kpis.range_two_state ?? && kpis.range_two_state==4>[${(kpis.range_two_start)!},${(kpis.range_two_end)!})</#if></span>
							               </li>
											<li class="heat_3"> <input type="checkbox" name="kpiInterv" value="3" <#if vo.kpiInterv?index_of("3")!=-1>checked ='checked'</#if>><font  style="color:${(kpis.range_three_color)!};font-size:18px;">${(kpis.shape)!}</font>
										 <span style="font-size:11px;"> 
										  <#if kpis.range_three_state ?? && kpis.range_three_state==1>(${(kpis.range_three_start)!},${(kpis.range_three_end)!})</#if>
							               <#if kpis.range_three_state ?? && kpis.range_three_state==2>[${(kpis.range_three_start)!},${(kpis.range_three_end)!})]</#if>
							               <#if kpis.range_three_state ?? && kpis.range_three_state==3>(${(kpis.range_three_start)!},${(kpis.range_three_end)!}]</#if>
							               <#if kpis.range_three_state ?? && kpis.range_three_state==4>[${(kpis.range_three_start)!},${(kpis.range_three_end)!})</#if></span>
							               </li>
											<li class="heat_4"><input type="checkbox" name="kpiInterv" value="4" <#if vo.kpiInterv?index_of("4")!=-1>checked ='checked'</#if>><font  style="color:${(kpis.range_four_color)!};font-size:18px;">${(kpis.shape)!}</font>
                                          <span style="font-size:11px;">
                                           <#if kpis.range_four_state ?? && kpis.range_four_state==1>(${(kpis.range_four_start)!},${(kpis.range_four_end)!})</#if>
							               <#if kpis.range_four_state ?? && kpis.range_four_state==2>[${(kpis.range_four_start)!},${(kpis.range_four_end)!})]</#if>
							               <#if kpis.range_four_state ?? && kpis.range_four_state==3>(${(kpis.range_four_start)!},${(kpis.range_four_end)!}]</#if>
							               <#if kpis.range_four_state ?? && kpis.range_four_state==4>[${(kpis.range_four_start)!},${(kpis.range_four_end)!})</#if></span>
							               </li>
											<li class="heat_5"> <input type="checkbox" name="kpiInterv" value="5" <#if vo.kpiInterv?index_of("5")!=-1>checked ='checked'</#if>><font  style="color:${(kpis.range_five_color)!};font-size:18px;">${(kpis.shape)!}</font>
											<span style="font-size:11px;">
											<#if kpis.range_five_state ?? && kpis.range_five_state==1>(${(kpis.range_five_start)!},${(kpis.range_five_end)!})</#if>
							               <#if kpis.range_five_state ?? && kpis.range_five_state==2>[${(kpis.range_five_start)!},${(kpis.range_five_end)!})]</#if>
							               <#if kpis.range_five_state ?? && kpis.range_five_state==3>(${(kpis.range_five_start)!},${(kpis.range_five_end)!}]</#if>
							               <#if kpis.range_five_state ?? && kpis.range_five_state==4>[${(kpis.range_five_start)!},${(kpis.range_five_end)!})</#if></span>
							               </li>		
											<li class="heat_6"> <input type="checkbox" name="kpiInterv" value="6" <#if vo.kpiInterv?index_of("6")!=-1>checked ='checked'</#if>><font  style="color:${(kpis.range_six_color)!};font-size:18px;">${(kpis.shape)!}</font>
	                                      <span style="font-size:11px;"> 
	                                      <#if kpis.range_six_state ?? && kpis.range_six_state==1>(${(kpis.range_six_start)!},${(kpis.range_six_end)!})</#if>
							               <#if kpis.range_six_state ?? && kpis.range_six_state==2>[${(kpis.range_six_start)!},${(kpis.range_six_end)!})]</#if>
							               <#if kpis.range_six_state ?? && kpis.range_six_state==3>(${(kpis.range_six_start)!},${(kpis.range_six_end)!}]</#if>
							               <#if kpis.range_six_state ?? && kpis.range_six_state==4>[${(kpis.range_six_start)!},${(kpis.range_six_end)!})</#if></span>
							               </li>
											</ul>
						</div>
						</div>	
						<input id="uuid" style="display:none" value=""/>
                        <div class="gis-mapgj">
							 			
							  <div id="m_1" class="gis-mapgj-marquee" title="框选"><img src="${application.getContextPath()}/images/drawing.png"></div>
							  <div id="h_1" class="gis-mapgj-marquee-hover"  style="display:none;" title="框选"><img src="${application.getContextPath()}/images/drawing.png"></div>
		  		              <div id="m_2" class="gis-mapgj-circle" title="不规则选择"><img src="${application.getContextPath()}/images/drawing.png"></div>
							  <div id="h_2" class="gis-mapgj-circle-hover"  style="display:none;" title="不规则选择"><img src="${application.getContextPath()}/images/drawing.png"></div>
							  <div id="m_3" class="gis-mapgj-hand" style="display:none;" title="拖拽"><img src="${application.getContextPath()}/images/drawing.png"></div>
							  <div id="h_3" class="gis-mapgj-hand-hover" title="拖拽"><img src="${application.getContextPath()}/images/drawing.png"></div>	
		                </div>
						<!--地图-->
						<div id="container"></div> 	
					</div>		
				</div>	
			</div>		
		</div>
	</div>
	
	
<!-- BEGIN FOOTER -->
	<!-- END FOOTER -->
		<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- 开始    核心插件 -->   
	<!--[if lt IE 9]>
	<script src="${application.getContextPath()}/scripts/plugins/respond.min.js"></script>
	<script src="${application.getContextPath()}/scripts/plugins/excanvas.min.js"></script> 
	<![endif]-->   
	<!-- 结束    核心插件 -->
	<!-- 开始    日期范围控件脚本-->
	
    
	<script src="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/daterangepicker_amend.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/scripts/scripts/form-dateRanges_amend.js" type="text/javascript"></script>  
	<script type="text/javascript" src="${application.getContextPath()}/js/ejs_production.js"></script>
	<!--页面工具脚本-->
	   <script src="${application.getContextPath()}/js/report/areaRoad.js" type="text/javascript"></script>
	   <script src="${application.getContextPath()}/js/mapManager/map.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=byh1tKOFFXcgzqTYGkj5mWWp"></script>
<script type="text/javascript" src="${application.getContextPath()}/js/mapManager/DrawingManager_min.js"></script>
<script type="text/javascript" src="${application.getContextPath()}/js/mapManager/AreaRestriction_min.js"></script>
<script src="${application.getContextPath()}/js/mapManager/MarkerClusterer.min.js" type="text/javascript"></script>
<script src="${application.getContextPath()}/js/mapManager/TextIconOverlay_min.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/js/mapManager/mapStyle.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/js/mapManager/draws.js" type="text/javascript"></script>
	<script src="${application.getContextPath()}/js/mapManager/grid.js" type="text/javascript"></script>
    <script src="${application.getContextPath()}/js/mapManager/data.js" type="text/javascript"></script>
	<!--<script type="text/javascript" src="${application.getContextPath()}/js/utils/netTypeUtils.js"></script>
	自定义js 开始
	<script src="${application.getContextPath()}/js/echartsTools.js" type="text/javascript"></script>

	<script src="${application.getContextPath()}/js/mapManager/pline.js" type="text/javascript"></script>
	
	<script src="${application.getContextPath()}/js/mapManager/mapReport.js" type="text/javascript"></script>-->
	
	<script>
	<!--顶级区域-->
	 var oneregionname = <#if oneregionname?? && oneregionname!= ''>'${oneregionname!}'<#else>''</#if>;
	 
	 var tiaozhuan = <#if tiaozhuan?? && tiaozhuan!= ''>'${tiaozhuan!}'<#else>''</#if>;
	 
	jQuery(document).ready(function() {
			//设置菜单样式
		//	setMenuCss(["mapManage"]);
			DateRanges.init('reportrange');	   
			//$(".page-content").css('min-height',document.body.clientHeight-5);  
		});
	</script>
 
	</body>
<!-- END BODY -->
</html>