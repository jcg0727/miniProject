//격자 레이어
			var standard = new ol.layer.Image({
		               source: new ol.source.ImageWMS({
		               projection: projection,
		                 ratio: 1,
		                 url: 'http://localhost:9090/geoserver/project/wms',
		                 params: {
		                 'FORMAT': 'image/png',
		                        'VERSION': '1.1.1',  
		                     "LAYERS": 'project:nlsp_021001001_JEJU',
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
	                     "LAYERS": 'project:nlsp_021001001_SEO',
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
			
			
			
			
			var road = new ol.layer.Image({
				source: new ol.source.ImageWMS({
					projection: projection,
					ratio: 1,
					url: 'http://localhost:9090/geoserver/project/wms',
					params: {
						'FORMAT': 'image/png',
						'VERSION': '1.1.1',  
						"LAYERS": 'project:road',
						"exceptions": 'application/vnd.ogc.se_inimage',
					}
				})
			});

			//격자레이어 조작
			$('#road').click(function(){
				if(flag.road){
					$('#road').css("background","#bf360c");
					map1.addLayer(road);
					flag.road = false;
				}else{
					$('#road').css("background","none");
					map1.removeLayer(road);
					flag.road = true;
				}
			});

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

