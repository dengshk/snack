$(function(){
	loadChart();
	handleCounterup(); // handle counterup instances
});

// Handles counterup plugin wrapper
var handleCounterup = function() {
    if (!$().counterUp) {
        return;
    }

    $("[data-counter='counterup']").counterUp({
        delay: 10,
        time: 1000
    });
};

/**
 * 加载首页数据
 */
 var pieDayExpend;
function loadChart(){
	$("#modal-backdrop").show();
	var xAxisData,serDayIncome,serDayProfit,serDayExpend;
	$.ajax({
		type:"post",
		url:contextPath + "/home/getChartsInfo",
		async: false,
		success:function(data){
			xAxisData = data.xAxisData;
			serDayIncome = data.serDayIncome;
			serDayProfit = data.serDayProfit;
			serDayExpend = data.serDayExpend;
			pieDayExpend = data.pieDayExpend;
			saleTop = data.saleTop;
			//加载折线图
			loadChart4Line(xAxisData,serDayIncome,serDayProfit,serDayExpend);
			//加载饼图
			loadChart4Pie('最近一天',6,pieDayExpend);
			//加载柱状图
			loadChart4Bar(saleTop);
		}
	});
	$("#modal-backdrop").hide();
}

//加载折线图
function loadChart4Line(xAxisData,serDayIncome,serDayProfit,serDayExpend){
	var quota = {
	    title: {
	        text: '收支趋势情况',
	        x: 'center',
	        textStyle : {
	            color : 'rgba(30,144,255,0.8)',
	            fontFamily : '微软雅黑',
	            fontSize : 17,
	            fontWeight : 'bolder'
	        }
	        //subtext: '支出:<邮费+自销+进货>\n盈利:<实收款-支出>'
	    },
	    legend: {
	    	show:true,
	    	orient:'horizontal',
	    	x: 'right',
	        y: 'top',
	        padding: [40,40],
	        textStyle:{
                    fontSize: 12,
                    color: '#444'
           	},
	        data:['收入','支出','利润']
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
                    fontSize: 12,
                    color: '#444'
            	},
            	rotate:0
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
	            name: '收入',
	            type: 'line',
	            stack: '总量',
	            data: serDayIncome
	        },
	        {
	            name: '利润',
	            type: 'line',
	            stack: '总量',
	            data: serDayProfit
	        },
	        {
	            name: '支出',
	            type: 'line',
	            stack: '总量',
	            data: serDayExpend
	        }
	    ]
	};

	var quotaChart = echarts.init(document.getElementById('chart4Line'), 'macarons');
	quotaChart.setOption(quota);
	window.onresize = quotaChart.resize;
	
	// 处理鼠标事件
	quotaChart.on('mouseover', function (params) {
		loadChart4Pie(params.name,params.dataIndex,pieDayExpend);
	});
}

//加载饼图
function loadChart4Pie(qryData,qryIndex,pieDayExpend){
	var varCost=0;
	var varSelf=0;
	var varExpress=0;
	//当天数据
	if(typeof(pieDayExpend) != "undefined"){
		var currentData = pieDayExpend[qryIndex];
		varCost = currentData.cost;
		varSelf = currentData.self;
		varExpress = currentData.express;
	}
	
	var quota = {
	    title: {
	        text: '钱花哪儿了?',
	        x: 'center',
	        y: 'center',
	        textStyle : {
	            color : 'rgba(30,144,255,0.8)',
	            fontFamily : '微软雅黑',
	            fontSize : 17,
	            fontWeight : 'bolder'
	        },
	        subtext: qryData+'\n支出: '+(Number(varCost)+Number(varSelf)+Number(varExpress)) + ' 元'
	    },
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	    	show:true,
	    	orient:'vertical',
	    	x: 'right',
	        y: 'top',
	        padding: [25,20],
	        textStyle:{
                    fontSize: 12,
                    color: '#444'
           	},
	        data:['进货','邮费','自销']
	    },
	    backgroundColor:'rgba(255,255,255,1)',
		calculable: false,//禁止拖拽
	    series: [
	        {
	            name:'支出分布',
	            type:'pie',
	            radius: ['50%', '70%'],
	            avoidLabelOverlap: true,
	            itemStyle: {
				    normal: {
				        label: {show:true},
				        labelLine: {show:true}
				    }
				},
	            data:[
	                {value: varCost, name:'进货'},
	                {value: varExpress, name:'邮费'},
	                {value: varSelf, name:'自销'}
	            ]
	        }
	    ]
	};
	var quotaChart = echarts.init(document.getElementById('chart4Pie'), 'macarons');
	quotaChart.setOption(quota);
	window.onresize = quotaChart.resize;
}

//加载柱状图
function loadChart4Bar(saleTop){
	var varProductName = [];
	var varSaleNum = [];
	
	if(typeof(pieDayExpend) != "undefined"){
		varProductName = saleTop.productName;
		varSaleNum = saleTop.saleNum;
	}
	
	var quota = {
	    title : {
	        text: '近七日热销产品',
	        x: 'center',
	        textStyle : {
	            color : 'rgba(30,144,255,0.8)',
	            fontFamily : '微软雅黑',
	            fontSize : 17,
	            fontWeight : 'bolder'
	        }
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '5%',
	        y:80,
	        containLabel: true
	    },
	    backgroundColor:'rgba(255,255,255,1)',
		calculable: false,//禁止拖拽
	    xAxis : [
	        {
	            type : 'category',
	            data : varProductName
	        }
	    ],
	    yAxis : [
	        {
	            type: 'value',
	            nameTextStyle:{
	            	fontSize: 12,
		            color: '#939393'
	            },
	            'name': '销售数量'
	        }
	    ],
	    series : [
	        {
	            name:'销售数量',
	            type:'bar',
	            data: varSaleNum
	        }
	    ]
	};
                    
	var quotaChart = echarts.init(document.getElementById('chart4Bar'), 'macarons');
	quotaChart.setOption(quota);
	window.onresize = quotaChart.resize;
}