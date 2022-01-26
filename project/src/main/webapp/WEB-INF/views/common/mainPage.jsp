<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JEJU</title>

    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
	<style>
	.topbar{
		height: 3.5rem;
	}	
	.sidebar .nav-item .nav-link {
		width : 20rem;
	}
	a:hover{
		background-color: #f57c00;
		font-size: 15px;
	}
	
	</style>
	
	<!-- table -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/js/table/ol2.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/js/table/ol.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/table/common.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/table/common2.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/table/common3.js"></script>
	
	<!-- 오픈레이어스 -->
	<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.11.0/build/ol.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.11.0/css/ol.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/js/lib2/ol.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/lib2/ol.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/js/lib2/ol3-layerswitcher.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/lib2/ol3-layerswitcher.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/lib2/proj4.js"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<!-- Bootstrap core JavaScript-->
<%--     <script src="<%=request.getContextPath() %>/resources/bootstrap/vendor/jquery/jquery.min.js"></script> --%>
    <style>
    	#mapping{
    		background-color: rgba(0,255,255,0.1);width: 160px;height: 210px; position: absolute; z-index: 2; margin-left: 1410px; margin-top: 420px;
    	}
    	#mapping ul li span{
    	    display: block;
		    float: left;
		    height: 15px;
		    width: 15px;
		    margin-right: 5px;
		    margin-left: 0;
		    border: 1px solid #999;
		    border-radius: 50%;
		    }
    	
    	#analyzeMapping{
    		background-color: rgba(0,0,0,0.1);width: 140px;height: 170px; position: absolute; z-index: 2; margin-left: 1425px; margin-top: 250px;
    	}
    	#analyzeMapping ul li span{
    	    display: block;
		    float: left;
		    height: 15px;
		    width: 15px;
		    margin-right: 5px;
		    margin-left: 0;
		    border: 1px solid #999;
		    }
    	}

    </style>
</head>

<body id="page-top" onload="init()">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath() %>/mainPage">
                <div class="sidebar-brand-text mx-3">관광지 기반<br/>제주도 교통사고</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
			
			  <li class="nav-item">
                <a class="nav-link" id="standard">
                    <i class="fas fa-fw fa-border-all" ></i>
                    <span>격자</span></a>
            </li>
            <hr class="sidebar-divider my-0">
            
            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link" id="sight">
                    <i class="fas fa-map-pin"></i>
                    <span>관광지</span></a>
            </li>
             <li class="nav-item">
                <a class="nav-link" id="road">
                    <i class="fas fa-road"></i>
                    <span>도로</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-car-crash"></i>
                    <span>교통사고 다발지역</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" id="accident">교통사고</a>
                        <a class="collapse-item" id="manyaccident">교통사고다발지역</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
              <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-video"></i>
                    <span>교통시설물</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" id="camera">무인단속카메라</a>
                        <a class="collapse-item" id="cctv">CCTV</a>
                        <a class="collapse-item" id="roadsign">도로표지판</a>
                        <a class="collapse-item" id="dump">과속방지턱</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
			
			
            <!-- Nav Item - Pages Collapse Menu -->
<!-- 			<li class="nav-item"> -->
<!--                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" -->
<!--                     aria-expanded="true" aria-controls="collapseTwo"> -->
<!--                     <i class="fas fa-fw fa-chart-area"></i> -->
<!--                     <span>분석</span> -->
<!--                 </a> -->
<!--                 <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"> -->
<!--                     <div class="bg-white py-2 collapse-inner rounded"> -->
<!--                         <a class="collapse-item" href="">교통시설물 설치 위치 추천</a> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </li> -->
            
            

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="btn btn-danger btn-circle" id="reset" style="width: 65px;">reset</button>
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid" style="padding-left: 0px;padding-right: 0px;">
		               <div id="mapping">
		               <div style="text-align: center; font: bold; font-size: 25px">레이어 범례</div>
		                <div>
									<ul style="list-style: none; text-align: left; padding-left: 10px;">
										   <li><span style='background:green;'></span>관광지</li>
										   <li><span style='background:red;'></span>교통사고</li>
										    <li><span style='background:purple;'></span>교통사고다발지역</li>
										    <li><span style='background:#ff6d00;'></span>무인단속카메라</li>
										    <li><span style='background:blue;'></span>CCTV</li>
		    								<li><span style='background:black;'></span>도로표지판</li>
		    								<li><span style='background:#8d6e63;'></span>과속방지턱</li>
									</ul>
										 
						</div>
						</div>
		               <div id="analyzeMapping" style="display: none;">
		               <div style="text-align: center; font: bold; font-size: 25px">분석 범례</div>
		                <div>
									<ul style="list-style: none; text-align: left; padding-left: 10px;">
										   <li><span style='background:blue;'></span>안전</li>
										   <li><span style='background:green;'></span>양호</li>
										    <li><span style='background:yellow;'></span>보통</li>
										    <li><span style='background:red;'></span>심각</li>
										    <input type="button" value="분석리셋" id="analyzeReset"/>
									</ul>
										 
						</div>
						</div>
						<div id="map" style="height: 630px;"></div>
						<div class="loadingImg"></div>
						<div class="row">
							<div class="col-9" style="padding-right: 0px;">
					            <div class="card">
<!-- 					              <div class="card-header"> -->
<!-- 					                	<h4 style="float: left;">주요 관광지</h4> -->
<!-- 					              </div> -->
					              <!-- /.card-header -->
					              <div class="card-body table-responsive p-0">
										<h4>주요 관광지 분석</h4>
										<table id="table" class="table table-striped table-bordered">
									        <thead>
									            <tr>
									                <th>이름</th>
									                <th>주소</th>
									            </tr>
									        </thead>
									    </table>
					              </div>
					              <!-- /.card-body -->
					            </div>
					            <!-- /.card -->
					         </div>
							<div class="col-3">
								<div class="card shadow mb-4" style="height: 435px;">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">교통사고현황</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                    	<div class="chartjs-size-monitor">
                                    		<div class="chartjs-size-monitor-expand">
                                    			<div class="">
                                    			</div>
                                    		</div>
	                                    	<div class="chartjs-size-monitor-shrink">
	                                    		<div class="">
	                                    		</div>
	                                    	</div>
                                   		 </div>
                                        <canvas id="myPieChart" width="447" height="316" style="display: block; width: 358px; height: 300px;" class="chartjs-render-monitor"></canvas>
                                    </div>
                                </div>
                            </div>
					            <!-- /.card -->
					         </div>
						</div>					        
						</div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
	<script type="text/javascript">
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
	
	</script>		
	
	<script>

	//관광지 레이어
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
	
	//교통사고 레이어
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
	
	//camera 레이어
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
	
	//cctv 레이어
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
	
	//roadsign 레이어
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
	
	//dump 레이어
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
	
	
	//레이어 리셋
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
	
	//테이블 생성
	var table;
	var html;
	$(document).ready(function() {
	  $('#table').DataTable({
			info : false,
			lengthChange : false,
	    	 "pageLength": 5,
	         ajax:{
	         	url:"<%=request.getContextPath()%>/sightList",
	         	type:"POST",
	         	dataSrc :''
	         },
	         columns:[
	         	{data:"name"},
	         	{data:"new_addr"}
	         ]
	    });
	} );
	
	//분석 레이어 flag
	var analyzeLayers = {
		accident_pointLayer: true,
		cctv_point : true,
		camera_point : true,
		dump_point : true,
		roadsign_point : true,
		manyaccident_point : true,
		selectStandardLayer: true
	};
	
	function removeAnalyzeLayers(){
		if(!analyzeLayers.selectStandardLayer){
			map1.removeLayer(selectStandardLayer);
			analyzeLayers.selectStandardLayer = true;
		}
		
		if(!analyzeLayers.accident_pointLayer){
			map1.removeLayer(accident_pointLayer);
			analyzeLayers.accident_pointLayer = true;
		}
		
		if(!analyzeLayers.cctv_pointLayer){
			map1.removeLayer(cctv_pointLayer);
			analyzeLayers.cctv_pointLayer = true;
		}
		
		if(!analyzeLayers.camera_pointLayer){
			map1.removeLayer(camera_pointLayer);
			analyzeLayers.camera_pointLayer = true;
		}
		
		if(!analyzeLayers.dump_pointLayer){
			map1.removeLayer(dump_pointLayer);
			analyzeLayers.dump_pointLayer = true;
		}
		
		if(!analyzeLayers.roadsign_pointLayer){
			map1.removeLayer(roadsign_pointLayer);
			analyzeLayers.roadsign_pointLayer = true;
		}
		
		if(!analyzeLayers.manyaccident_pointLayer){
			map1.removeLayer(manyaccident_pointLayer);
			analyzeLayers.manyaccident_pointLayer = true;
		}
		
		
		
	}
	//테이블 클릭 이벤트
	$(document).on('click', '#table tbody tr', function() {
		time();
		$('#analyzeMapping').css('display','block');
       var name = $('#table').DataTable().row($(this)).data().name;
       var point = $('#table').DataTable().row($(this)).data().point;
       var realCenterXY =point.replace("POINT", "").replace("(", "[").replace(" ", ",").replace( ")", "]");
       var extent = JSON.parse(realCenterXY);	
      	map1.getView().setCenter(extent);
      	map1.getView().setZoom(10);
      	$.ajax({
      		url : "<%=request.getContextPath()%>/allPoint",
      		type : "post",
      		data : {"name" : name},
      		success : function(data){
      			console.log(data);
      			selectStandard(data.selectStandard);				
      			accident_point(data.selectAccidentPoint);				
      			cctv_point(data.selectCctvPoint);
      			camera_point(data.selectCameraPoint);
      			dump_point(data.selectDumpPoint);
      			roadsign_point(data.selectRoadsignPoint);
      			manyaccident_point(data.selectManyAccidentPoint);
      		
      			// Set new default font family and font color to mimic Bootstrap's default styling
      			Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
      			Chart.defaults.global.defaultFontColor = '#858796';

      			// Pie Chart Example
      			var ctx = document.getElementById("myPieChart");
      			var myPieChart = new Chart(ctx, {
      			  type: 'doughnut',
      			  data: {
      			    labels: ["사망사고", "중상사고", "경미한사고", "부상신고"],
      			    datasets: [{
      			      data: [55, 30, 15, 20],
      			      backgroundColor: ['red', 'orange', 'yellow','green'],
      			      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf' ,'#36b9cc'],
      			      hoverBorderColor: "rgba(234, 236, 244, 1)",
      			    }],
      			  },
      			  options: {
      			    maintainAspectRatio: false,
      			    tooltips: {
      			      backgroundColor: "rgb(255,255,255)",
      			      bodyFontColor: "#858796",
      			      borderColor: '#dddfeb',
      			      borderWidth: 1,
      			      xPadding: 15,
      			      yPadding: 15,
      			      displayColors: false,
      			      caretPadding: 10,
      			    },
      			    legend: {
      			      display: true
      			    },
      			    cutoutPercentage: 80,
      			  },
      			});

      		},
      		error : function(error){
      			console.log(error);
      		}
      		
      	})
    });
	
	$('#analyzeReset').on('click',function(){
				map1.removeLayer(selectStandardLayer);
				map1.removeLayer(accident_pointLayer);
				map1.removeLayer(cctv_pointLayer);
				map1.removeLayer(camera_pointLayer);
				map1.removeLayer(dump_pointLayer);
				map1.removeLayer(roadsign_pointLayer);
				map1.removeLayer(manyaccident_pointLayer);
	})
	
	
	</script>
	<script>
function time(imageName) {
    LoadingWithMask('<%=request.getContextPath()%>/resources/time.gif');
    setTimeout("closeLoadingWithMask()", 7000);
}
 
function LoadingWithMask(gif) {
    //화면의 높이와 너비를 구합니다.
    var maskHeight = $(document).height();
    var maskWidth  = window.document.body.clientWidth;
     
    //화면에 출력할 마스크를 설정해줍니다.
    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
    var loadingImg ='';
    loadingImg += " <div id='loadingImg'>";
    loadingImg +=" <img src='"+ gif +"' style='position: absolute; display: block; margin: 0px auto; z-index:9500; top:50%; left:50%'/>";
    loadingImg += " </div>";
    //화면에 레이어 추가
    $('body')
        .append(mask)
 
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
    $('#mask').css({
            'width' : maskWidth,
            'height': maskHeight,
            'opacity' :'0.3'
    });
  
    //마스크 표시
    $('#mask').show();
  
    //로딩중 이미지 표시
    $('.loadingImg').append(loadingImg);
    $('#loadingImg').show();
}
function closeLoadingWithMask() {
    $('#mask, #loadingImg').hide();
    $('#mask, #loadingImg').empty(); 
}

</script>
	<%@ include file="../include/js.jsp" %>
</body>

</html>