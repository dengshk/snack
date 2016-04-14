function ChildPoint(object){
	  this.method = BMap.Point; 
	  this.method(object.lng,object.lat);//最关键的一行 
	  delete this.method; 
	  this.object = object; 
}

var pointColles = new Map();//图层键值对,键－采样点单一敬意状态，值－单一的图层
var shapes=[BMAP_POINT_SHAPE_CIRCLE,BMAP_POINT_SHAPE_STAR,BMAP_POINT_SHAPE_SQUARE,BMAP_POINT_SHAPE_RHOMBUS];
/**
 * 查询数据
 * @param vo
 */
function queyDate(vo){
	$.ajax({
		  url:contextPath + "/map/mapPoint",
		  type:"post",
		  data: {"vo":JSON.stringify(vo)},  
		  success:function(data){
			  $("#modal-backdrop").hide();
			  if(data.list.length>0){
				  addMarker(data.list,vo);
				  $("#uuid").val(data.uuid);
				  setTimeout(function(){ $("svg").insertAfter($("canvas").last()); }, 300); 
			  }else{
				  $.messager.alert('提示','没有数据！',"warn");
			  }
		  },
			error:function(data){
 				$("#modal-backdrop").hide();
 				$.messager.alert('提示','数据查询失败！',"error");
 			}
		  });
}

/***
 * 增加轨迹点
 * @param vo
 */
	
	function addMarker(list,vo){
		
		var xxMap={};
		//根据颜色分组
		for(var i=0;i<list.length;i++){
			 if(xxMap[list[i].state] == undefined){  
				 var pots=[]; 
				 pots.push(list[i]);  
		            xxMap[list[i].state] = pots;  
		        }else{  
		        	xxMap[list[i].state].push(list[i]);  
		        }  
		}
		var i_s=0;
		for (ss in xxMap) {
		var pots = [];
		var st = xxMap[ss];
		for (var t = 0; t < st.length; t++) {
			pots.push(new ChildPoint(st[t]));
		}
		var options = {
			shape : shapes[0].shape,
			size : BMAP_POINT_SIZE_SMALL,
			color : ss
		};
		var pointCollection = new BMap.PointCollection(pots, options);
		map.addOverlay(pointCollection);
		//如果包含些颜色区间则显示
		if(vo.kpiInterv.indexOf(st[0].inter)==-1){
			pointCollection.hide();
		}
		pointCollection.addEventListener('click', function(e) {
			var kpiInterv_ss="";
			$("input[name='kpiInterv']:checkbox").each(function(){ 
		         if($(this).attr("checked")){
		        	 kpiInterv_ss += $(this).val()+",";
		         }
		     });
			if(kpiInterv_ss.indexOf(e.point.object.inter)!=-1){
			pointinfo(map,0,e.point);}
		});
		pointColles.put(st[0].inter,pointCollection);
	 	
		//在第一图层设置视野
        if(i_s==0){
        	 map.setViewport(pots);
		}
		i_s++;
	}
		
	}
	
/**
 * 
 * @param kpiInterv区间值,flag 1-选中，2－取消
 */	
function showColorsPoint(kpiInterv,flag){
	map.closeInfoWindow() ;
	var polc=pointColles.get(parseInt(kpiInterv));
	if(!pointColles.isEmpty()&&polc!=null){
		//判断选中
		if(flag==1){
			polc.show();
		}else{
			polc.hide();
		}
		
	}
}
/**
 * 点事件上的弹出信息
 * @param map
 * flag是否叠加1－叠加，0－不叠加
 * point
 */	
function pointinfo(map,flag,point){
	var html ="";
	if(point.object.inter!='7')
	html  = new EJS({url: contextPath+'/js/mapManager/point_info.ejs'}).render(point.object);
	if(point.object.inter=='7')html="<div class='no_service_box'><div class='no_service'><img src='"+contextPath+"/images/question.png' width='23' height='23' /><span>无服务</span></div></div>";
	var opts = {enableMessage:false};
    var infoWindow = new BMap.InfoWindow(html,opts);  // 创建信息窗口对象 
    setTimeout(function(){map.openInfoWindow(infoWindow,new  BMap.Point(point.lng,point.lat)); }, 1000); 
	
}	
/**
 * 删除所有轨迹图层
 * @param vo
 */
function deleteOverlays(){
	map.clearOverlays();
}

/**
 *区间数据
 * @param vo
 */
function getKpiInterval(vo){
		$.ajax({
			  url:contextPath + "/map/mapkpi",
			  type:"post",
			  data: {"vo":JSON.stringify(vo)},  
			  success:function(data){
				  if(data){
					 var kpis=data.kpis;
					 var shape=kpis.shape;
						var one="";
						var oneColor=kpis.range_one_color;
						switch (kpis.range_one_state) {
						case 1:
							one="("+kpis.range_one_start+","+kpis.range_one_end+")";
							break;
						case 2:
							one="["+kpis.range_one_start+","+kpis.range_one_end+"]";
							break;
						case 3:one="("+kpis.range_one_start+","+kpis.range_one_end+"]";
							break;
						case 4:
							one="["+kpis.range_one_start+","+kpis.range_one_end+")";
							break;
						default:
							break;
						}
						var two="";
						var twoColor=kpis.range_two_color;
						switch (kpis.range_two_state) {
						case 1:
							two="("+kpis.range_two_start+","+kpis.range_two_end+")";
							break;
						case 2:
							two="["+kpis.range_two_start+","+kpis.range_two_end+"]";
							break;
						case 3:two="("+kpis.range_two_start+","+kpis.range_two_end+"]";
							break;
						case 4:
							two="["+kpis.range_two_start+","+kpis.range_two_end+")";
							break;
						default:
							break;
						}
						var three="";
						var threeColor=kpis.range_three_color;
						switch (kpis.range_three_state) {
						case 1:
							three="("+kpis.range_three_start+","+kpis.range_three_end+")";
							break;
						case 2:
							three="["+kpis.range_three_start+","+kpis.range_three_end+"]";
							break;
						case 3:three="("+kpis.range_three_start+","+kpis.range_three_end+"]";
							break;
						case 4:
							three="["+kpis.range_three_start+","+kpis.range_three_end+")";
							break;
						default:
							break;
						}
						var four="";
						var fourColor=kpis.range_four_color;
						switch (kpis.range_four_state) {
						case 1:
							four="("+kpis.range_four_start+","+kpis.range_four_end+")";
							break;
						case 2:
							four="["+kpis.range_four_start+","+kpis.range_four_end+"]";
							break;
						case 3:four="("+kpis.range_four_start+","+kpis.range_four_end+"]";
							break;
						case 4:
							four="["+kpis.range_four_start+","+kpis.range_four_end+")";
							break;
						default:
							break;
						}
						var five="";
						var fiveColor=kpis.range_five_color;
						switch (kpis.range_five_state) {
						case 1:
							five="("+kpis.range_five_start+","+kpis.range_five_end+")";
							break;
						case 2:
							five="["+kpis.range_five_start+","+kpis.range_five_end+"]";
							break;
						case 3:five="("+kpis.range_five_start+","+kpis.range_five_end+"]";
							break;
						case 4:
							five="["+kpis.range_five_start+","+kpis.range_five_end+")";
							break;
						default:
							break;
						}
						var six="";
						var sixColor=kpis.range_six_color;
						switch (kpis.range_six_state) {
						case 1:
							six="("+kpis.range_six_start+","+kpis.range_six_end+")";
							break;
						case 2:
							six="["+kpis.range_six_start+","+kpis.range_six_end+"]";
							break;
						case 3:six="("+kpis.range_six_start+","+kpis.range_six_end+"]";
							break;
						case 4:
							six="["+kpis.range_six_start+","+kpis.range_six_end+")";
							break;
						default:
							break;
						}
		               //设置值
						    $("#legend").find(".heat_7").hide();
						    $("#legend").find(".heat_1>span").html(one);
							$("#legend").find(".heat_2>span").html(two);
							$("#legend").find(".heat_3>span").html(three);
							$("#legend").find(".heat_4>span").html(four);
							$("#legend").find(".heat_5>span").html(five);			
							$("#legend").find(".heat_6>span").html(six);
							$("#legend").find("font").html(shape);
							//设置颜色
							    $("#legend").find(".heat_1>font").css("color",oneColor);
								$("#legend").find(".heat_2>font").css("color",twoColor);
								$("#legend").find(".heat_3>font").css("color",threeColor);
								$("#legend").find(".heat_4>font").css("color",fourColor);
								$("#legend").find(".heat_5>font").css("color",fiveColor);			
								$("#legend").find(".heat_6>font").css("color",sixColor);
								if(vo.kpiType==1||vo.kpiType==2){
									  $("#legend").find(".heat_7").show();
								}
					 
				  }
			   }
			});
	}