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
	<meta content="" name="yaon" />
	<meta name="MobileOptimized" content="320">       	
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGIN STYLES --> 
	<link href="${application.getContextPath()}/scripts/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
	<link href="${application.getContextPath()}/scripts/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css"/>
	
	
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-fileupload/bootstrap-fileupload.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/select2/select2_metro.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/clockface/css/clockface.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-datepicker/css/datepicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-timepicker/compiled/timepicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-colorpicker/css/colorpicker.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-datetimepicker/css/datetimepicker.css" />
	
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/jquery-multi-select/css/multi-select.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch-metro.css"/>
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/jquery-tags-input/jquery.tagsinput.css" />
	<link rel="stylesheet" type="text/css" href="${application.getContextPath()}/scripts/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
	<!-- END PAGE LEVEL PLUGIN STYLES -->
	<!-- BEGIN THEME STYLES --> 
	<link href="${application.getContextPath()}/scripts/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/pages/tasks.css" rel="stylesheet" type="text/css"/>
	<link href="${application.getContextPath()}/scripts/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="${application.getContextPath()}/scripts/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link href="${application.getContextPath()}/skins/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/plugins/jquery-1.10.2.min.js"></script>
	<style type="text/css">
		.row{
		margin-left: 0px !important;
		margin-right: 0px !important;
		}
	</style>
	
    </head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
    <#include "../index/indexTop.ftl" />
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
			<#include "../index/indexMenu.ftl" />
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content" >
			<div class="row" >
	<div class="col-md-12">
		<div class="portlet">
			<!--报表正文-->
			<div class="portlet-body">
			<!--报表工具-->
				<!--抬头信息-->
				<div class="navbar navbar-default" role="navigation" method="post" action="${application.getContextPath()}/epinfo/epinfo" style="background:#fff !important;">
					<form class="navbar-form form-inline navbar-left breadcrumb"  id="epinfoForm" onsubmit="return false;" >
						<input name="id" type="hidden" id="id" value="${(product.id)!}"/>
						<!--时间范围控件       开始-->
						<div class="form-group">
							<!--<label class="control-label"></label>-->
			                <div class="input-group date form_date" style="margin-left:8px;" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
			                    <input class="form-control" size="12" type="text" value="2016-04-21" readonly>
			                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			                </div>
						</div>
						<!--时间范围控件       结束-->
						<!-- 顾客姓名 开始 -->
						<div class="form-group" style="margin-left:8px;">
							<label class="control-label">顾客姓名:</label>
							<input class="form-control" type="text" id="customerName" name="customerName" style="width:160px !important;" value="${(bean.customerName)!}" placeholder="请输入顾客姓名"/>
						</div>
						<!-- 顾客姓名 结束 -->
						<!-- 顾客电话 开始 -->
						<div class="form-group" style="margin-left:8px;">
							<label class="control-label">顾客电话:</label>
							<input class="form-control" type="text" id="customerName" name="customerName" style="width:160px !important;" value="${(bean.customerName)!}" placeholder="请输入顾客电话"/>
						</div>
						<!-- 顾客电话 结束 -->
						<!-- 备注信息 开始 -->
						<div class="form-group" style="margin-left:8px;">
							<label class="control-label">备注信息:</label>
							<input class="form-control" type="text" id="customerName" name="customerName" style="width:160px !important;" value="${(bean.customerName)!}" placeholder="请输入备注信息"/>
						</div>
						<!-- 备注信息 结束 -->
						<button class="btn blue" style="height:31px;width:62px;margin-top:-6px;margin-left:10px;" id="querybtn">修改</button>
					</form>
				</div>
				<!--新增-->
				<div class="table-toolbar">
					<div class="btn-group">
						<button class="btn blue editUser">
						 <i class="fa fa-plus"></i> &nbsp;新增清单
						</button>
					</div>
				</div>
				<!--分页信息-->
				<form id="pageForm" action="${application.getContextPath()}/record/newProduct" method="post">
					<input type="hidden" name="pageIndex" value="${(page.pageIndex)!1}" />
					<input type="hidden" name="pageSize" value="${(page.pageSize)!10}" />
				</form>
				<!--报表列属性名-->
				<form id="submitform" action="${application.getContextPath()}/record/newProduct" method="post">
					<div class="table-responsive table-scrollable" style="height:<#if !(page.list??) ||  page.list?size == 0>111<#else>${((page.list?size+2)*37)!}</#if>px;">
						<table class="table table-striped table-hover table-bordered dataTable" id="sample_editable_1">
							<thead>
								<tr style="background-color:#EAEAEA;">
									<!--<th class="table-checkbox">
										<span>
											<input class="group-checkable" data-set="#childs .checkboxes" type="checkbox" >
										</span>
									</th>-->
									<th style="text-align:center;width:30%;">产品名称</th>
									<th style="text-align:center;width:10%;">进货单价</th>
									<th style="text-align:center;width:10%;">销售单价</th>
									<th style="text-align:center;width:10%;">销售数量</th>
									<th style="text-align:center;width:10%;">销售金额</th>
									<th style="text-align:center;width:10%;">小计收入</th>
									<th style="text-align:center;width:20%;">操作</th>
								</tr>
							</thead>
							<tbody>
								 <#if page.list?? &&  page.list?size &gt; 0>
									<#list page.list as p>
										 <tr style="height:37px;<#if p_index==page.list?size-1>border-bottom:1px #dddddd  solid;</#if>">
											<td align='center'>${(p.name)!}</td>
											<td align='center'>
												${(p.buyPrice)!}
											</td>
											<td align='center'>
												${(p.salePrice)!}
											</td>
											<td align='center'>
												${(p.expiration)!}
											</td>
											<td align='center'>
												88.88
											</td>
											<td align='center'>
												8.88
											</td>
											<td align='center'>
												<a class="editUser" href="#" id="${(p.id)!}">修改</a>|
												<a class="deleteUser" href="#" id="${(p.id)!}" un="${(p.name)!}" userid="${(p.id)!}">删除</a>
											</td>
										</tr>
									</#list>
								<#else>
									<tr>
										<td colspan="7" style="text-align:'center';">还没有数据</td>
									</tr>
								</#if>
							</tbody>
						</table>
					</div>
				</form>
				<div id="containerPage"></div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
		</div>
	</div>
	<!--分页-->
	<script type="text/javascript" src="${application.getContextPath()}/js/ejs_production.js"></script>
	<script type="text/javascript" src="${application.getContextPath()}/scripts/scripts/table-pages.js"></script>	

	<!-- 开始    日期范围控件脚本  -->
<script type="text/javascript" src="${application.getContextPath()}/scripts/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="${application.getContextPath()}/scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="${application.getContextPath()}/scripts/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${application.getContextPath()}/scripts/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
	<script type="text/javascript">
	jQuery(document).ready(function() {    
		   PageUtils.init({
				"sync" : true, //异步或者form提交,默认form提交
				"method" : -1,
			   	"lengthMenu": [10, 15, 20, 50],
		        "defaultLength": ${(page.pageSize)!10},      
		        "pageIndex":${(page.pageIndex)!1},
		        "total": ${(page.totalPage)!1},     
		        "form":"submitform",
		        "displayContainer":"containerPage",
		        "language": "zh"         //语言  zh or en
		   });
		var winHeight = window.screen.height;
		var scHeight = document.body.scrollTop;
		var winHeight = window.screen.height;
		$('.page-content').css('min-height',winHeight);
		$("#modal-backdrop").hide();
    });
 	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	</script>
</body>
<!-- END BODY -->
</html>