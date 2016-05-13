$(function(){
	loadChart4profit();
	loadChart4IO();
});

//加载累计利益图
function loadChart4profit(){
	var quota = {
	    title: {
	        text: '累计盈亏图',
	        subtext: '累计盈利与亏损分析'
	    },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	        formatter: function (params) {
	            var p0=0;
	            var p1=0;
	            var _state;
	            if (params[0].value != '-') {
	                p0 = params[0].value;
	            }
	            if (params[1].value != '-') {
	                p1 = params[1].value;
	                _state = params[1];
	            }else{
	            	_state = params[2];
	            }
	            return params[0].name + '<br/>' + '累计盈利' + ' : ' + (Number(p0)+Number(p1)) + '<br/>' + '当天' + _state.seriesName + ' : ' + _state.value;
	        }
	    },
	    legend: {
	        data:['亏损','盈利']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis: {
	        type : 'category',
	        splitLine: {show:false},
	        data :  function (){
	            var list = [];
	            for (var i = 1; i <= 11; i++) {
	                list.push('05月' + i + '日');
	            }
	            return list;
	        }()
	    },
	    backgroundColor:'rgba(255,255,255,1)',
		calculable: false,//禁止拖拽
	    yAxis: {
	        type : 'value'
	    },
	    series: [
	        {
	            name: '辅助',
	            type: 'bar',
	            stack: '总量',
	            itemStyle: {
	                normal: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                },
	                emphasis: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                }
	            },
	            data: [0, 900, 1245, 1530, 1376, 1376, 1511, 1689, 1856, 1495, 1292]
	        },
	        {
	            name: '盈利',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'top'
	                }
	            },
	            data: [900, 345, 393, '-', '-', 135, 178, 286, '-', '-', '-']
	        },
	        {
	            name: '亏损',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'bottom'
	                }
	            },
	            data: ['-', '-', '-', 108, 154, '-', '-', '-', 119, 361, 203]
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