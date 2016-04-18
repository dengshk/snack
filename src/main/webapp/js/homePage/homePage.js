require.config({
	    paths: {
	        echarts: contextPath+'/scripts/plugins/echarts/www/js'
	    }
	});

/**
 * 首页图标回调
 */
function loadChart(){
	$("#modal-backdrop").show();
	$.ajax({
		type:"post",
		url:contextPath + "/home/getChartsInfo",
		async: false,
		success:function(data){
			//无线宽带覆盖率
			var wirelessCover = data.wirelessCover;
			var wirelessName = wirelessCover.name;
			var wirelessData = wirelessCover.data;
			var wirelessX = wirelessCover.x;
			var wirelessAX = wirelessCover.ax;
			var wirelessSeries = [];
			for(var i=0;i<wirelessName.length;i++){
				var t = {
				name : wirelessName[i],
				type : 'line',
	            data : wirelessData[i]
				};
				wirelessSeries[i] = t;
			}
			wirelessQuota = createData('覆盖率' ,'vertical',wirelessName,wirelessAX,'覆盖率(%)',wirelessSeries ,false,'line',-45);
			
			//下行链路宽带覆盖率
			var broadbandCover = data.broadbandCover;
			var broadbandName = broadbandCover.name;
			var broadbandData = broadbandCover.data;
			var broadbandX = broadbandCover.x;
			var broadbandAX = broadbandCover.ax;
			var broadbandSeries = [];
			for(var i=0;i<broadbandName.length;i++){
				var t = {
				name : broadbandName[i],
				type : 'line',
	            data : broadbandData[i]
				};
				broadbandSeries[i] = t;
			}
			broadbandQuota = createData('下行链路带宽' ,'vertical',broadbandName,broadbandAX,'速率(Mbps)',broadbandSeries ,false,'line',-45);

			pageSevenCharts(data.wirelessCover.prev,data.wirelessCover.next,wirelessX[0],wirelessX[wirelessX.length],'wirelessCoverCheck','wirelessCoverButton');
			pageSevenCharts(data.broadbandCover.prev,data.broadbandCover.next,broadbandX[0],broadbandX[broadbandX.length],'broadbandCoverCheck','broadbandCoverButton');
			$("#modal-backdrop").hide();
		}	
	});
}

$(function(){
	/**
	 * 无线覆盖率分页
	 */
	$('.wirelessCoverCheck').live('click',function(){
		var quota = 'wireless';
		var time = $(this).attr('time');
		var pageType = $(this).attr('pagetype');
		$("#modal-backdrop").show();
		$.ajax({
			type:"post",
			url:contextPath + "/home/queryChartsInfo",
			data:{time:time,pageType:pageType,quota:quota},
			async: false,
			success:function(data){
				//无线宽带覆盖率
				var cover = data.cover;
				var name = cover.name;
				var coverData = cover.data;
				var x = cover.x;
				var ax = cover.ax;
				var series = [];
				for(var i=0;i<name.length;i++){
					var t = {
					name : name[i],
					type : 'line',
		            data : coverData[i]
					};
					series[i] = t;
				}
				quota = createData('覆盖率' ,'vertical',name,ax,'覆盖率(%)',series ,false,'line',-45);
				require(
				        [
				            'echarts',
				            'echarts/chart/line',
				        ],
				        function (ec) {
				        	var ecConfig = require('echarts/config');
				        	//无线宽带覆盖率
				        	var quotaChart = ec.init(document.getElementById('wirelessCover'), 'macarons');
				        	quotaChart.setOption(quota);
				            window.onresize = quotaChart.resize;
				        }
				);
				pageSevenCharts(cover.prev,cover.next,x[0],x[x.length-1],'wirelessCoverCheck','wirelessCoverButton');
				$("#modal-backdrop").hide();
			}	
		});
	});
	
	/**
	 * 下行链路带宽分页
	 */
	$('.broadbandCoverCheck').live('click',function(){
		var quota = 'broadband';
		var time = $(this).attr('time');
		var pageType = $(this).attr('pagetype');
		$("#modal-backdrop").show();
		$.ajax({
			type:"post",
			url:contextPath + "/home/queryChartsInfo",
			data:{time:time,pageType:pageType,quota:quota},
			async: false,
			success:function(data){
				//无线宽带覆盖率
				var cover = data.cover;
				var name = cover.name;
				var coverData = cover.data;
				var x = cover.x;
				var ax = cover.ax;
				var series = [];
				for(var i=0;i<name.length;i++){
					var t = {
					name : name[i],
					type : 'line',
		            data : coverData[i]
					};
					series[i] = t;
				}
				quota = createData('下行链路带宽' ,'vertical',name,ax,'速率(Mbps)',series ,false,'line',-45);
				
				require(
				        [
				            'echarts',
				            'echarts/chart/line',
				        ],
				        function (ec) {
				        	var ecConfig = require('echarts/config');
				        	//无线宽带覆盖率
				        	var quotaChart = ec.init(document.getElementById('broadbandCover'), 'macarons');
				        	quotaChart.setOption(quota);
				            window.onresize = quotaChart.resize;
				        }
				);
				pageSevenCharts(cover.prev,cover.next,x[0],x[x.length-1],'broadbandCoverCheck','broadbandCoverButton');
				$("#modal-backdrop").hide();
			}	
		});
	});
});