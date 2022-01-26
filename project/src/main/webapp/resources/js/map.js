	  // define epsg:5181 projection
    proj4.defs("EPSG:5181","+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs");

    ol.proj.setProj4 = proj4;
    var flag = 
	{
		camera : true,
		cctv : true,
		roadsign : true,
		standard : true,
		accident : true,
		manyaccident : true,
		sight : true,
		dump : true,
		road : true
		
	}
var map1 = '';
    var resolutions = [2048, 1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1, 0.5, 0.25];
    var extent      = [-30000, -60000, 494288, 988576];
    
    var projection = new ol.proj.Projection({
        code: 'EPSG:5181',
        extent: extent,
        units: 'm'
    });
    
    // define tile layer
    var tileLayer = new ol.layer.Tile({
        title : 'Daum Street Map',
        visible : true,
        type : 'base',
        source : new ol.source.XYZ({
            projection: projection,
            tileSize: 256,
            minZoom: 0,
            maxZoom: resolutions.length - 1,
            tileGrid: new ol.tilegrid.TileGrid({
                origin: [extent[0], extent[1]],
                resolutions: resolutions
            }),
            tileUrlFunction: function (tileCoord, pixelRatio, projection) {
                if (tileCoord == null) return undefined;

                var s = Math.floor(Math.random() * 4);  // 0 ~ 3
                var z = resolutions.length - tileCoord[0];
                var x = tileCoord[1];
                var y = tileCoord[2];
				return 'http://map' + s + '.daumcdn.net/map_2d/1912uow/L' + z + '/' + y + '/' + x + '.png';
				<!-- return 'http://map' + s + '.daumcdn.net/map_skyview/L' + z + '/' + y + '/' + x + '.jpg'; -->
            },
            attributions: [
                new ol.Attribution({ 
                    html: ['<a href="http://map.daum.net"><img src="http://i1.daumcdn.net/localimg/localimages/07/mapjsapi/m_bi.png"></a>']
                })
            ]
        })
    });
    
	function init() {
		// set map
		map1 = new ol.Map({
			controls : [
// 				new ol.control.Attribution({
// 					collapsible: true
// 				}), 
				new ol.control.Zoom(), 
				new ol.control.FullScreen(),
				new ol.control.MousePosition({
					projection: 'EPSG:5181',
					coordinateFormat: ol.coordinate.createStringXY(2)
				}),
				new ol.control.ZoomSlider(),
// 				new ol.control.ZoomToExtent({
// 					extent: extent
// 				}),
				new ol.control.ScaleLine(),
// 				new ol.control.LayerSwitcher()
			],
			layers : [
				new ol.layer.Group({
					title : 'Base Maps',
					layers : [
						tileLayer
					]
				  }),
				new ol.layer.Group({
					title: 'Tiled WMS',
					layers: [
					]
				})
			],
			target : 'map',
			renderer: 'canvas',
			interactions : ol.interaction.defaults({
				shiftDragZoom : true
			}),
			view : new ol.View({
				projection: projection,
				extent: extent,
				resolutions: resolutions,
				maxResolution: resolutions[0],
				zoomFactor: 1,
				center : [(extent[0] + extent[2]) / 2, (extent[1] + extent[3]) / 2],
				zoom : 0
			})
		});

		
		map1.getView().setCenter([161408, -12224]);
		map1.getView().setZoom(5);
		
		map1.on('click', function(event) {
       	    map1.forEachFeatureAtPixel(event.pixel, function(feature,layer) {
       	        if ( feature.get('id') != "analyzeStandardFeatures" ) return;
       	        
     			var score = feature.get('score');
     			var accident_cnt = feature.get('accident_cnt');
     			var cctv_cnt = feature.get('cctv_cnt');
     			var camera_cnt = feature.get('camera_cnt');
     			var dump_cnt = feature.get('dump_cnt');
     			var roadsign_cnt = feature.get('roadsign_cnt');
     			var manyaccident_cnt = feature.get('manyaccident_cnt');
     			
       	        OpenWindow("<%=request.getContextPath()%>/detailAnalyze?score="+score+"&accident_cnt="+accident_cnt+"&manyaccident_cnt="+manyaccident_cnt+"&cctv_cnt="+cctv_cnt+"&camera_cnt="+camera_cnt+"&dump_cnt="+dump_cnt+"&roadsign_cnt="+roadsign_cnt, "교통사고 분석",350,550);
       	    });
	   	});
	};


	//관광지
	var sight;
	$('#sight').click(function(){
	if(flag.sight){
		 $.ajax({
              url : "<%=request.getContextPath()%>/sightList",
              type : "POST",
              success : function(data){
            	  var features = new Array(87);
            	  for (var i = 0; i < 87; ++i) {
            		  features[i] = new ol.Feature({
//             		    'geometry': new ol.geom.Point([data[i].x, data[i].y ]),
            		    'geometry': new ol.format.WKT().readGeometry(data[i].point),
            		    'name': data[i].name,
            		    'i':i
            		  });
            		}
					
            	              	   
            	   var source = new ol.source.Vector({
                       features : features
                    });
					
            	   var clusterSource = new ol.source.Cluster({
            		   distance: 40,
            		   source: source
            		 });
            	   var styleCache = {};
            	   
            	  sight = new ol.layer.Vector({
            	     source: clusterSource,
            	     style: function(feature, resolution) {
            	       var size = feature.get('features').length;
            	       var name = feature.get('features')[0].get('name');
            	       var style = styleCache[size];
            	       
            	       if (!style) {
            	         style = [new ol.style.Style({
            	           image: new ol.style.Circle({
            	             radius: 10,
            	             stroke: new ol.style.Stroke({
            	               color: '#fff'
            	             }),
            	             fill: new ol.style.Fill({
            	               color: '#1B5E20'
            	             })
            	           }),
            	           
            	           text: new ol.style.Text({
            	             text: name,
            	             font: 'Bold 10px Arial',
            	             fill: new ol.style.Fill({
            	               color: 'black'
            	             }),
            	             stroke: new ol.style.Stroke({ color: 'yellow', width: 3 })
            	           })
            	           
            	         })];
            	         styleCache[0] = style;
            	       }
            	       return style;
            	     }
            	   });
            			$('#sight').css("background","#bf360c");
            			map1.addLayer(sight);
            			flag.sight = false;
              },//success
              error : function(error){
                 alert("error");
              }
           });
		 }else{
       		$('#sight').css("background","none");
    		map1.removeLayer(sight);
    		flag.sight = true;
    	}

	});
	//교통사고
	var accident;
	$('#accident').click(function(){
		if(flag.accident){
		 $.ajax({
              url : "<%=request.getContextPath()%>/accidentList",
              type : "POST",
              success : function(data){
            	  var features = new Array(1772);
            	  for (var i = 0; i < 1772; ++i) {
            		  features[i] = new ol.Feature({
//             		    'geometry': new ol.geom.Point([data[i].x, data[i].y ]),
            		    'geometry': new ol.format.WKT().readGeometry(data[i].point)
            		  });
            		}

            	   var source = new ol.source.Vector({
                       features : features
                    });
            	   
            	   var clusterSource = new ol.source.Cluster({
            		   distance: 40,
            		   source: source
            		 });
            	   
            	   var styleCache = {};
            	   
            	    accident = new ol.layer.Vector({
            	     source: clusterSource,
            	     style: function(feature, resolution) {
            	       var size = feature.get('features').length;
            	       var style = styleCache[size];
            	       if (!style) {
            	         style = [new ol.style.Style({
            	           image: new ol.style.Circle({
            	             radius: 10,
            	             stroke: new ol.style.Stroke({
            	               color: '#fff'
            	             }),
            	             fill: new ol.style.Fill({
            	               color: '#d50000'
            	             })
            	           }),
            	           text: new ol.style.Text({
            	             text: size.toString(),
            	             fill: new ol.style.Fill({
            	               color: '#fff'
            	             })
            	           })
            	         })];
            	         styleCache[size] = style;
            	       }
            	       return style;
            	     }
            	   });
				
					$('#accident').css("background","#ffe0b2");
					map1.addLayer(accident);
					flag.accident = false;
				
              },//success
              error : function(error){
                 alert("error");
              }
           });
			}else{
				$('#accident').css("background","none");
				map1.removeLayer(accident);
				flag.accident = true;
			}

	});
	
	//camera
	var camera;
	$('#camera').click(function(){
		 if(flag.camera){
		 $.ajax({
              url : "<%=request.getContextPath()%>/cameraList",
              type : "POST",
              success : function(data){
            	  var features = new Array(244);
            	  for (var i = 0; i < 244; ++i) {
            		  features[i] = new ol.Feature({
//             		    'geometry': new ol.geom.Point([data[i].x, data[i].y ]),
            		    'geometry': new ol.format.WKT().readGeometry(data[i].point)
            		  });
            		}
            	   var source = new ol.source.Vector({
                       features : features
                    });
            	   
            	   var clusterSource = new ol.source.Cluster({
            		   distance: 40,
            		   source: source
            		 });
            	   
            	   var styleCache = {};
            	   
            	    camera = new ol.layer.Vector({
            	     source: clusterSource,
            	     style: function(feature, resolution) {
            	       var size = feature.get('features').length;
            	       var style = styleCache[size];
            	       if (!style) {
            	         style = [new ol.style.Style({
            	           image: new ol.style.Circle({
            	             radius: 10,
            	             stroke: new ol.style.Stroke({
            	               color: '#fff'
            	             }),
            	             fill: new ol.style.Fill({
            	               color: '#ff6d00'
            	             })
            	           }),
            	           text: new ol.style.Text({
            	             text: size.toString(),
            	             fill: new ol.style.Fill({
            	               color: '#fff'
            	             })
            	           })
            	         })];
            	         styleCache[size] = style;
            	       }
            	       return style;
            	     }
            	   });
            	  
   					$('#camera').css("background","#ffe0b2");
   					map1.addLayer(camera);
   					flag.camera = false;
   				
              },//success
              error : function(error){
                 alert("error");
              }
           });
		 }else{
				$('#camera').css("background","none");
				map1.removeLayer(camera);
				flag.camera = true;
			}

	});
	//cctv
	var cctv;
	$('#cctv').click(function(){
		 if(flag.cctv){
		 $.ajax({
              url : "<%=request.getContextPath()%>/cctvList",
              type : "POST",
              success : function(data){
            	  var features = new Array(470);
            	  for (var i = 0; i < 470; ++i) {
            		  features[i] = new ol.Feature({
//             		    'geometry': new ol.geom.Point([data[i].x, data[i].y ]),
            		    'geometry': new ol.format.WKT().readGeometry(data[i].point)
            		  });
            		}
            	   var source = new ol.source.Vector({
                       features : features
                    });
            	   
            	   var clusterSource = new ol.source.Cluster({
            		   distance: 40,
            		   source: source
            		 });
            	   
            	   var styleCache = {};
            	   
            	    cctv = new ol.layer.Vector({
            	     source: clusterSource,
            	     style: function(feature, resolution) {
            	       var size = feature.get('features').length;
            	       var style = styleCache[size];
            	       if (!style) {
            	         style = [new ol.style.Style({
            	           image: new ol.style.Circle({
            	             radius: 10,
            	             stroke: new ol.style.Stroke({
            	               color: '#fff'
            	             }),
            	             fill: new ol.style.Fill({
            	               color: '#0D47A1'
            	             })
            	           }),
            	           text: new ol.style.Text({
            	             text: size.toString(),
            	             fill: new ol.style.Fill({
            	               color: '#fff'
            	             })
            	           })
            	         })];
            	         styleCache[size] = style;
            	       }
            	       return style;
            	     }
            	   });
            	  
     					$('#cctv').css("background","#ffe0b2");
     					map1.addLayer(cctv);
     					flag.cctv = false;
     				
              },//success
              error : function(error){
                 alert("error");
              }
           });
		 }else{
				$('#cctv').css("background","none");
				map1.removeLayer(cctv);
				flag.cctv = true;
			}

	});
	
	//roadsign
	var roadsign;
	$('#roadsign').click(function(){
		if(flag.roadsign){
		 $.ajax({
              url : "<%=request.getContextPath()%>/roadsignList",
              type : "POST",
              success : function(data){
            	  var features = new Array(543);
            	  for (var i = 0; i < 543; ++i) {
            		  features[i] = new ol.Feature({
//             		    'geometry': new ol.geom.Point([data[i].x, data[i].y ]),
            		    'geometry': new ol.format.WKT().readGeometry(data[i].point)
            		  });
            		}
            	   var source = new ol.source.Vector({
                       features : features
                    });
            	   
            	   var clusterSource = new ol.source.Cluster({
            		   distance: 40,
            		   source: source
            		 });
            	   
            	   var styleCache = {};
            	   
            	   roadsign = new ol.layer.Vector({
            	     source: clusterSource,
            	     style: function(feature, resolution) {
            	       var size = feature.get('features').length;
            	       var style = styleCache[size];
            	       if (!style) {
            	         style = [new ol.style.Style({
            	           image: new ol.style.Circle({
            	             radius: 10,
            	             stroke: new ol.style.Stroke({
            	               color: '#fff'
            	             }),
            	             fill: new ol.style.Fill({
            	               color: '#000000'
            	             })
            	           }),
            	           text: new ol.style.Text({
            	             text: size.toString(),
            	             fill: new ol.style.Fill({
            	               color: '#fff'
            	             })
            	           })
            	         })];
            	         styleCache[size] = style;
            	       }
            	       return style;
            	     }
            	   });
            	   
      					$('#roadsign').css("background","#ffe0b2");
      					map1.addLayer(roadsign);
      					flag.roadsign = false;
      				
              },//success
              error : function(error){
                 alert("error");
              }
           });
		}else{
				$('#roadsign').css("background","none");
				map1.removeLayer(roadsign);
				flag.roadsign = true;
			}
	});
	
	//dump
	var dump;
	$('#dump').click(function(){
		 if(flag.dump){
		 $.ajax({
              url : "<%=request.getContextPath()%>/dumpList",
              type : "POST",
              success : function(data){
            	  var features = new Array(772);
            	  for (var i = 0; i < 772; ++i) {
            		  features[i] = new ol.Feature({
//             		    'geometry': new ol.geom.Point([data[i].x, data[i].y ]),
            		    'geometry': new ol.format.WKT().readGeometry(data[i].point)
            		  });
            		}
            	   var source = new ol.source.Vector({
                       features : features
                    });
            	   
            	   var clusterSource = new ol.source.Cluster({
            		   distance: 40,
            		   source: source
            		 });
            	   
            	   var styleCache = {};
            	   
            	    dump = new ol.layer.Vector({
            	     source: clusterSource,
            	     style: function(feature, resolution) {
            	       var size = feature.get('features').length;
            	       var style = styleCache[size];
            	       if (!style) {
            	         style = [new ol.style.Style({
            	           image: new ol.style.Circle({
            	             radius: 10,
            	             stroke: new ol.style.Stroke({
            	               color: '#fff'
            	             }),
            	             fill: new ol.style.Fill({
            	               color: '#8d6e63'
            	             })
            	           }),
            	           text: new ol.style.Text({
            	             text: size.toString(),
            	             fill: new ol.style.Fill({
            	               color: '#fff'
            	             })
            	           })
            	         })];
            	         styleCache[size] = style;
            	       }
            	       return style;
            	     }
            	   });
            	  
      					$('#dump').css("background","#ffe0b2");
      					map1.addLayer(dump);
      					flag.dump = false;
      				
              },//success
              error : function(error){
                 alert("error");
              }
           });
		 }else{
				$('#dump').css("background","none");
				map1.removeLayer(dump);
				flag.dump = true;
			}
	});
	
	
	
	$('#reset').click(function(){
		$('#camera').css("background","none");
		$('#cctv').css("background","none");
		$('#roadsign').css("background","none");
		$('#accident').css("background","none");
		$('#standard').css("background","none");
		$('#manyaccident').css("background","none");
		$('#sight').css("background","none");
		$('#road').css("background","none");
		$('#dump').css("background","none");
		map1.removeLayer(accident);
		map1.removeLayer(camera);
		map1.removeLayer(cctv);
		map1.removeLayer(roadsign);
		map1.removeLayer(manyaccident);
		map1.removeLayer(sight);
		map1.removeLayer(dump);
		map1.removeLayer(road);
	});
	

	
	
	
	
	