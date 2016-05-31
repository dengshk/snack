<!DOCTYPE html>
<!-- 
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.6
Version: 4.5.6
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8" />
        <title>高同学零食</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="${application.getContextPath()}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${application.getContextPath()}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${application.getContextPath()}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${application.getContextPath()}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="${application.getContextPath()}/assets/global/plugins/cubeportfolio/css/cubeportfolio.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="${application.getContextPath()}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${application.getContextPath()}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="${application.getContextPath()}/assets/pages/css/portfolio.min.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="${application.getContextPath()}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="${application.getContextPath()}/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="${application.getContextPath()}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" />
	    <style type="text/css">
			.page-content{
				margin-right: 235px;
			}
			.scroll-to-top{
				right: 100px;
			}
			.icon-arrow-up{
				font-size: 50px;
			}
			.page-footer-inner-self{
				color: #98a6ba;
				text-align:center;
				margin:auto;
			}
		</style>
	</head>
    <!-- END HEAD -->

    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
        <!-- BEGIN CONTAINER -->
        <div class="page-container" style="margin-top: 0px;">
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN PAGE BAR -->
                    <div class="page-bar">
                        <h3 class="page-title"> 零食
                        	<small>- Show</small>
                    	</h3>
                    </div>
                    <!-- END PAGE HEADER-->
                    <div class="portfolio-content portfolio-3">
                        <div class="clearfix">
                            <div id="js-filters-lightbox-gallery2" class="cbp-l-filters-button cbp-l-filters-left">
                                <div data-filter="*" class="cbp-filter-item-active cbp-filter-item btn blue btn-outline uppercase">
                                	所有<div class="cbp-filter-counter"></div>
                               	</div>
                                <div data-filter=".product-hot" class="cbp-filter-item btn blue btn-outline uppercase">
                                	热销产品<div class="cbp-filter-counter"></div>
                                </div>
                                <div data-filter=".product-recommend" class="cbp-filter-item btn blue btn-outline uppercase">
                                	店家推荐<div class="cbp-filter-counter"></div>
                                </div>
                                <div data-filter=".product-new" class="cbp-filter-item btn blue btn-outline uppercase">
                                	新品上架<div class="cbp-filter-counter"></div>
                                </div>
                            </div>
                        </div>
                        <div id="js-grid-lightbox-gallery" class="cbp">
                            <div class="cbp-item product-hot product-new">
                                <a href="${application.getContextPath()}/assets/show/details-001.ftl"
                                		class="cbp-caption cbp-singlePageInline" data-title="XO酱肉粒<br />精选上等新鲜精肉" rel="nofollow">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="${application.getContextPath()}/assets/show/600x600/001-1.png" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignLeft">
                                            <div class="cbp-l-caption-body">
                                                <div class="cbp-l-caption-title">XO酱肉粒</div>
                                                <div class="cbp-l-caption-desc">精选上等新鲜精肉</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="cbp-item product-hot product-recommend">
                                <a href="${application.getContextPath()}/assets/show/details-002.ftl"
                                		class="cbp-caption cbp-singlePageInline" data-title="碧根果<br />美国山核桃果实" rel="nofollow">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="${application.getContextPath()}/assets/show/600x600/002-1.png" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignLeft">
                                            <div class="cbp-l-caption-body">
                                                <div class="cbp-l-caption-title">碧根果</div>
                                                <div class="cbp-l-caption-desc">美国山核桃果实</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="cbp-item product-hot product-recommend">
                                <a href="${application.getContextPath()}/assets/show/details-003.ftl"
                                		class="cbp-caption cbp-singlePageInline" data-title="蜜汁香辣鳗鱼丝<br />必备零食，爆款之王" rel="nofollow">
                                    <div class="cbp-caption-defaultWrap">
                                        <img src="${application.getContextPath()}/assets/show/600x600/003-1.png" alt=""> </div>
                                    <div class="cbp-caption-activeWrap">
                                        <div class="cbp-l-caption-alignLeft">
                                            <div class="cbp-l-caption-body">
                                                <div class="cbp-l-caption-title">蜜汁香辣鳗鱼丝</div>
                                                <div class="cbp-l-caption-desc">必备零食，爆款之王</div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div id="js-loadMore-lightbox-gallery" class="cbp-l-loadMore-button">
                            <a href="${application.getContextPath()}/assets/show/loadMore.ftl" class="cbp-l-loadMore-link btn grey-mint btn-outline" rel="nofollow">
                                <span class="cbp-l-loadMore-defaultText">加载更多</span>
                                <span class="cbp-l-loadMore-loadingText">加载中...</span>
                                <span class="cbp-l-loadMore-noMoreLoading">没有了</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="page-footer">
            <div class="page-footer-inner-self"> 2016 &copy; made by dengshk.
                <a href="#" title="联系我"_self">代理商 - 楼瑶</a>
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- END FOOTER -->
        <!-- BEGIN CORE PLUGINS -->
        <script src="${application.getContextPath()}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="${application.getContextPath()}/assets/global/plugins/cubeportfolio/js/jquery.cubeportfolio.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="${application.getContextPath()}/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="${application.getContextPath()}/assets/pages/scripts/portfolio-3.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="${application.getContextPath()}/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
        <script src="${application.getContextPath()}/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>