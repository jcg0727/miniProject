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
	</style>
	
	<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.11.0/build/ol.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.11.0/css/ol.css">
	
	   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/js/lib2/ol.css" />
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/lib2/ol.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/js/lib2/ol3-layerswitcher.css" />
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/lib2/ol3-layerswitcher.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/lib2/proj4.js"></script>
	
</head>

<body id="page-top" onload="init()">

    <!-- Page Wrapper -->

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath() %>/resources/bootstrap/index.html">
                <div class="sidebar-brand-text mx-3">제주도 교통사고</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>관광지</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>교통사고 다발지역</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>무인단속카메라</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>분석</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->

            <!-- Main Content -->

                <!-- Topbar -->
<!--                 <nav class="navbar navbar-expand navbar-light topbar static-top shadow" style="background-color: #42a5f5 "> -->
					
<!-- <!--                     Sidebar Toggle (Topbar) !--> 
<!--                   <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">  -->
<!--                          <i class="fa fa-bars"></i>  -->
<!--                      </button>  -->


<!--                    Topbar Navbar ! -->
<!--                     <ul class="navbar-nav ml-auto"> -->
                       
<!--                     </ul> -->

<!--                 </nav> -->
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
							<div id="map"></div>
                <!-- /.container-fluid -->

            <!-- End of Main Content -->

        <!-- End of Content Wrapper -->

    <!-- End of Page Wrapper -->


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bad625fa1db195394d841cb21b3a322d"></script>
	<script type="text/javascript">
            // define epsg:5181 projection
            proj4.defs("EPSG:5181","+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs");

            ol.proj.setProj4 = proj4;
            
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
				var map = new ol.Map({
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
				
				
							
				// add gwc layer to map
				<!-- var layer = 'foss:korea_sgg'; -->
				<!-- map.addLayer(createGWCLayer(layer, layer, '', false, false)); -->
			};
						
			/**
			* Helper method for gwc layer.
			*/
			<!-- var createGWCLayer = function(layer, title, styles, isBaseLayer, isVisible) { -->
				<!-- var gwcLayer = new ol.layer.Tile({ -->
					<!-- title : title, -->
					<!-- type: isBaseLayer ? 'base' : '', -->
					<!-- visible : isVisible, -->
					<!-- source: new ol.source.TileWMS({ -->
						<!-- url: 'http://localhost:8080/geoserver/gwc/service/wms', -->
						<!-- serverType: 'geoserver', -->
						<!-- params: { -->
							<!-- 'TILED': true, -->
							<!-- 'VERSION': '1.1.0',  // must be 1.1.0, not 1.3.0 -->
							<!-- 'STYLES': styles, -->
							<!-- 'LAYERS': layer, -->
							<!-- 'FORMAT': 'image/png', -->
							<!-- 'TRANSPARENT': 'true' -->
						<!-- } -->
					<!-- }) -->
				<!-- }); -->
				<!-- return gwcLayer; -->
			<!-- }; -->
        </script>

    <!-- Bootstrap core JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/demo/chart-area-demo.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>

</html>