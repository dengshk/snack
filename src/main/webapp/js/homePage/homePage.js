$(function(){
	loadChart();
	//loadChart4IO();
});

/**
 * 		reMap.put("xAxisData", xAxisData);
		reMap.put("serAUX", serAUX);
		reMap.put("serIncome", serIncome);
		reMap.put("serExpend", serExpend);
 * 加载首页数据
 */
function loadChart(){
	$("#modal-backdrop").show();
	var xAxisData,serTotalProfit,serDayProfit,serDayExpend;
	$.ajax({
		type:"post",
		url:contextPath + "/home/getChartsInfo",
		async: false,
		success:function(data){
			xAxisData = data.xAxisData;
			serTotalProfit = data.serTotalProfit;
			serDayProfit = data.serDayProfit;
			serDayExpend = data.serDayExpend;
			//加载图表
			loadChart4profit(xAxisData,serTotalProfit,serDayProfit,serDayExpend);
		}
	});
	$("#modal-backdrop").hide();
}

//加载累计利益图
function loadChart4profit(xAxisData,serTotalProfit,serDayProfit,serDayExpend){
	var quota = {
	    title: {
	        text: '收支趋势分析',
	        x: 'center',
	        textStyle:{
	        	fontSize: 20,
	            fontFamily:'微软雅黑',
	        },
	        subtext: '支出:<邮费+自销+进货>\n盈利:<实收款-支出>'
	    },
	    legend: {
	    	show:true,
	    	orient:'horizontal',
	    	x: 'right',
	        y: 'top',
	        padding: [25,60],
	        data:['累计盈利','当天盈利','当天支出']
	    },
	    backgroundColor:'rgba(255,255,255,1)',
		calculable: false,//禁止拖拽
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '5%',
	        y:80,
	        containLabel: true
	    },
	    xAxis: {
	        type : 'category',
	        splitLine: {show:false},
	        data : xAxisData,
	        axisLabel: { 
            	textStyle:{
                    fontSize: 10,
                    color: '#444'
            	},
            	rotate:-45
            }
	    },
	    yAxis: {
            type: 'value',
            nameTextStyle:{
            	fontSize: 12,
	            color: '#939393'
            },
            'name': '单位(元)'
	    },
	    series: [
	        {
	            name: '累计盈利',
	            type: 'line',
	            stack: '总量',
	            data: serTotalProfit
	        },
	        {
	            name: '当天盈利',
	            type: 'line',
	            stack: '总量',
	            data: serDayProfit
	        },
	        {
	            name: '当天支出',
	            type: 'line',
	            stack: '总量',
	            data: serDayExpend
	        }
	    ]
	};

	var quotaChart = echarts.init(document.getElementById('chart4profit'), 'macarons');
	quotaChart.setOption(quota);
	window.onresize = quotaChart.resize;
}

//加载收支图表
function loadChart4IO(){
	var quota = option = {
	    title: {
	        text: '近期收支图',
	        subtext: '近期收入与支出情况'
	    },
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
	    backgroundColor:'rgba(255,255,255,1)',
		calculable: false,//禁止拖拽
	    xAxis : [
	        {
	            type : 'value',
	            areaStyle:{
	        	color: [
	        	        'rgba(250,250,250,1)'
	        	    ]
	        	}
	        }
	    ],
	    yAxis : [
	        {
	            type : 'category',
	            axisTick : {show: false},
	            data : ['05/07','05/07','05/07','05/07','05/07','05/07','05/07']
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
	var quotaChart = echarts.init(document.getElementById('chart4IO'), 'macarons');
	quotaChart.setOption(quota);
	window.onresize = quotaChart.resize;
}