//격자 레이어
			var standard = new ol.layer.Image({
		               source: new ol.source.ImageWMS({
		               projection: projection,
		                 ratio: 1,
		                 url: 'http://localhost:9090/geoserver/project/wms',
		                 params: {
		                 'FORMAT': 'image/png',
		                        'VERSION': '1.1.1',  
		                     "LAYERS": 'project:nlsp_030001001',
		                     "exceptions": 'application/vnd.ogc.se_inimage',
		                  }
		               })
		            });
			var standard2 = new ol.layer.Image({
	               source: new ol.source.ImageWMS({
	               projection: projection,
	                 ratio: 1,
	                 url: 'http://localhost:9090/geoserver/project/wms',
	                 params: {
	                 'FORMAT': 'image/png',
	                        'VERSION': '1.1.1',  
	                     "LAYERS": 'project:nlsp_030001002',
	                     "exceptions": 'application/vnd.ogc.se_inimage',
	                  }
	               })
	            });
			//격자레이어 조작
			$('#standard').click(function(){
				if(flag.standard){
					$('#standard').css("background","#bf360c");
					map1.addLayer(standard);
					map1.addLayer(standard2);
					flag.standard = false;
				}else{
					$('#standard').css("background","none");
					map1.removeLayer(standard);
					map1.removeLayer(standard2);
					flag.standard = true;
				}
			});
			
//			//관광지 레이어
//			var sight = new ol.layer.Image({
//		               source: new ol.source.ImageWMS({
//		               projection: projection,
//		                 ratio: 1,
//		                 url: 'http://localhost:9090/geoserver/project/wms',
//		                 params: {
//		                 'FORMAT': 'image/png',
//		                        'VERSION': '1.1.1',  
//		                     "LAYERS": 'project:sight',
//		                     "exceptions": 'application/vnd.ogc.se_inimage',
//		                  }
//		               })
//		            });
//			
//			//관장지 레이어 조작
//			$('#sight').click(function(){
//				if(flag.sight){
//					$('#sight').css("background","#bf360c");
//					map1.addLayer(sight);
//					flag.sight = false;
//				}else{
//					$('#sight').css("background","none");
//					map1.removeLayer(sight);
//					flag.sight = true;
//				}
//			});
			
//			//교통사고 레이어
//				var accident = new ol.layer.Image({
//		               source: new ol.source.ImageWMS({
//		               projection: projection,
//		                 ratio: 1,
//		                 url: 'http://localhost:9090/geoserver/project/wms',
//		                 params: {
//		                 'FORMAT': 'image/png',
//		                        'VERSION': '1.1.1',  
//		                     "LAYERS": 'project:accident',
//		                     "exceptions": 'application/vnd.ogc.se_inimage',
//		                  }
//		               })
//		            });
//				 
//			//교통사고 레이어 조작
//				$('#accident').click(function(){
//					if(flag.accident){
//						$('#accident').css("background","#ffe0b2");
//						map1.addLayer(accident);
//						flag.accident = false;
//					}else{
//						$('#accident').css("background","none");
//						map1.removeLayer(accident);
//						flag.accident = true;
//					}
//				});
			
			
			//다발지역 레이어
			var manyaccident = new ol.layer.Image({
		               source: new ol.source.ImageWMS({
		               projection: projection,
		                 ratio: 1,
		                 url: 'http://localhost:9090/geoserver/project/wms',
		                 params: {
		                 'FORMAT': 'image/png',
		                        'VERSION': '1.1.1',  
		                     "LAYERS": 'project:manyaccident',
		                     "exceptions": 'application/vnd.ogc.se_inimage',
		                  }
		               })
		            });
			$('#manyaccident').click(function(){
				if(flag.manyaccident){
					$('#manyaccident').css("background","#ffe0b2");
					map1.addLayer(manyaccident);
					flag.manyaccident = false;
				}else{
					$('#manyaccident').css("background","none");
					map1.removeLayer(manyaccident);
					flag.manyaccident = true;
				}
			
			});
			
			//cameraPoint 레이어
			var cameraPoint = new ol.layer.Image({
	               source: new ol.source.ImageWMS({
	               projection: projection,
	                 ratio: 1,
	                 url: 'http://localhost:9090/geoserver/project/wms',
	                 params: {
	                 'FORMAT': 'image/png',
	                        'VERSION': '1.1.1',  
	                     "LAYERS": 'project:camera',
	                     "exceptions": 'application/vnd.ogc.se_inimage',
	                  }
	               })
	            });
			
		
			
			//camera 레이어 조작
			function camera(){
				if(flag.camera){
					$('#camera').css("background","#ffe0b2");
					map1.addLayer(cameraPoint);
					flag.camera = false;
				}else{
					$('#camera').css("background","none");
					map1.removeLayer(cameraPoint);
					flag.camera = true;
				}
				
				
			}
			
			//cctv레이어
			var cctvPoint = new ol.layer.Image({
	               source: new ol.source.ImageWMS({
	               projection: projection,
	                 ratio: 1,
	                 url: 'http://localhost:9090/geoserver/project/wms',
	                 params: {
	                 'FORMAT': 'image/png',
	                        'VERSION': '1.1.1',  
	                     "LAYERS": 'project:cctv',
	                     "exceptions": 'application/vnd.ogc.se_inimage',
	                  }
	               })
	            });
			
			//cctv레이어조작
			function cctv(){
				if(flag.cctv){
					$('#cctv').css("background","#ffe0b2");
					map1.addLayer(cctvPoint);
					flag.cctv = false;
				}else{
					$('#cctv').css("background","none");
					map1.removeLayer(cctvPoint);
					flag.cctv = true;
				}
			}
			
			//도로표지판 레이어
			var roadsign = new ol.layer.Image({
	               source: new ol.source.ImageWMS({
	               projection: projection,
	                 ratio: 1,
	                 url: 'http://localhost:9090/geoserver/project/wms',
	                 params: {
	                 'FORMAT': 'image/png',
	                        'VERSION': '1.1.1',  
	                     "LAYERS": 'project:roadsign',
	                     "exceptions": 'application/vnd.ogc.se_inimage',
	                  }
	               })
	            });
			
			//표지판 조작
			$('#roadsign').click(function(){
				if(flag.roadsign){
					$('#roadsign').css("background","#ffe0b2");
					map1.addLayer(roadsign);
					flag.roadsign = false;
				}else{
					$('#roadsign').css("background","none");
					map1.removeLayer(roadsign);
					flag.roadsign = true;
				}
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
				map1.removeLayer(cameraPoint);
				map1.removeLayer(cctvPoint);
				map1.removeLayer(roadsign);
				map1.removeLayer(standard);
				map1.removeLayer(standard2);
				map1.removeLayer(manyaccident);
				map1.removeLayer(sight);
			}
