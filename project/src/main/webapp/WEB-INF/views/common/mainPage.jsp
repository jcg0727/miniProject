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
       
	<!-- Bootstrap core JavaScript-->
<%--     <script src="<%=request.getContextPath() %>/resources/bootstrap/vendor/jquery/jquery.min.js"></script> --%>
    
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
                    <i class="fas fa-fw fa-border-all" ></i>
                    <span>관광지</span></a>
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
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
              <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>분석</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="btn btn-danger btn-circle"  id="reset" onclick="reset();">reset</button>
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
						<div id="map" style="height: 600px;"></div>
							<div class="col-12" style="padding-left: 0px; padding-right: 0px;">
					            <div class="card">
<!-- 					              <div class="card-header"> -->
<!-- 					                	<h4 style="float: left;">주요 관광지</h4> -->
<!-- 					              </div> -->
					              <!-- /.card-header -->
					              <div class="card-body table-responsive p-0">
										<h4>주요 관광지</h4>
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
		sight : true
		
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
				new ol.control.Attribution({
					collapsible: true
				}), 
				new ol.control.Zoom(), 
				new ol.control.FullScreen(),
				new ol.control.MousePosition({
					projection: 'EPSG:5181',
					coordinateFormat: ol.coordinate.createStringXY(2)
				}),
				new ol.control.ZoomToExtent({
					extent: extent
				}),
				new ol.control.ScaleLine(),
				new ol.control.LayerSwitcher()
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

		
		map1.getView().setCenter([161088, -14272]);
		map1.getView().setZoom(5
				);
	};
	</script>		
	
	<script>
	//관광지
	$('#sight').click(function(){
		 $.ajax({
              url : "<%=request.getContextPath()%>/sightList",
              type : "POST",
              success : function(data){
            	  var features = new Array(87);
            	  
            	  for (var i = 0; i < 87; ++i) {
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
            	   var sight = new ol.layer.Vector({
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
            	               color: '#1B5E20'
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
            		if(flag.sight){
            			$('#sight').css("background","#bf360c");
            			map1.addLayer(sight);
            			flag.cctv = false;
            		}else{
            			$('#sight').css("background","none");
            			map1.removeLayer(sight);
            			flag.cctv = true;
            		}
            	  
              },//success
              error : function(error){
                 alert("error");
              }
           });

	});

	
	
	//교통사고
	$('#accident').click(function(){
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
            	   
            	   var accident = new ol.layer.Vector({
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
				if(flag.accident){
					$('#accident').css("background","#ffe0b2");
					map1.addLayer(accident);
					flag.accident = false;
				}else{
					$('#accident').css("background","none");
					map1.removeLayer(accident);
					flag.accident = true;
				}
              },//success
              error : function(error){
                 alert("error");
              }
           });

	});
	
	//camera
	$('#camera').click(function(){
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
            	   
            	   var camera = new ol.layer.Vector({
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
            	   if(flag.camera){
   					$('#camera').css("background","#ffe0b2");
   					map1.addLayer(camera);
   					flag.camera = false;
   				}else{
   					$('#camera').css("background","none");
   					map1.removeLayer(camera);
   					flag.camera = true;
   				}
              },//success
              error : function(error){
                 alert("error");
              }
           });

	});
	//cctv
	$('#cctv').click(function(){
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
            	   
            	   var cctv = new ol.layer.Vector({
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
            	   if(flag.cctv){
     					$('#cctv').css("background","#ffe0b2");
     					map1.addLayer(cctv);
     					flag.cctv = false;
     				}else{
     					$('#cctv').css("background","none");
     					map1.removeLayer(cctv);
     					flag.cctv = true;
     				}
              },//success
              error : function(error){
                 alert("error");
              }
           });

	});
	
	//roadsign
	$('#roadsign').click(function(){
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
            	   
            	   var roadsign = new ol.layer.Vector({
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
            	   if(flag.roadsign){
      					$('#roadsign').css("background","#ffe0b2");
      					map1.addLayer(roadsign);
      					flag.roadsign = false;
      				}else{
      					$('#roadsign').css("background","none");
      					map1.removeLayer(roadsign);
      					flag.roadsign = true;
      				}
              },//success
              error : function(error){
                 alert("error");
              }
           });

	});
	
	
	
	function reset(){
		$('#camera').css("background","none");
		$('#cctv').css("background","none");
		$('#roadsign').css("background","none");
		$('#accident').css("background","none");
		$('#standard').css("background","none");
		$('#manyaccident').css("background","none");
		$('#sight').css("background","none");
		map1.removeLayer(accident);
		map1.removeLayer(camera);
		map1.removeLayer(cctv);
		map1.removeLayer(roadsign);
		map1.removeLayer(standard);
		map1.removeLayer(manyaccident);
		map1.removeLayer(sight);
	}
	

	var table;
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
	         	{data:"new_addr"},
	         ]
	    });
	} );
	
	$(document).on('click', '#table tbody tr', function() {
       var point = $('#table').DataTable().row($(this)).data().point;
       alert(point);
    });
	</script>
	
	<%@ include file="../include/js.jsp" %>

    
</body>

</html>