
	var selectStandardLayer;
	function selectStandard(param){
		removeAnalyzeLayers();
		  var features = new Array(param.length);		  
		  
		  var score;
          for (var i = 0; i < param.length; ++i) {
        	 
			switch(param[i].accident_cnt){
				case 0:
					score = 10;
					break;
				case 1:
					score = 8;
					break;
				case 2:
					score = 6;
					break;
				case 3:
					score = 4;
					break;
				case 4:
					score = 3;
					break;
				case 5:
					score = 2;
					break;
				default :
					score = 1;
				}
			if(param[i].manyaccident_cnt != 0){
				score = score*0.7;
			}
			if(param[i].camera_cnt != 0){
				score = score*1.2;
			}
			if(param[i].dump_cnt != 0){
				score = score*1.15;
			}
			if(param[i].roadsign_cnt != 0){
				score = score*1.1;
			}
			if(param[i].camera_cnt == 0 && param[i].dump_cnt ==0 && param[i].roadsign_cnt ==0 && param[i].cctv_cnt == 0){
				score= score*0.8;
			}
			 param[i].sco = score;
          	console.log(param[i].sco);
           }
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
            	 'id': 'analyzeStandardFeatures',
             'geometry':new ol.format.WKT().readGeometry(param[i].geom_inter),
               'score': param[i].sco,
               'accident_cnt' : param[i].accident_cnt,
               'cctv_cnt' : param[i].cctv_cnt,
               'camera_cnt' : param[i].camera_cnt,
               'dump_cnt' : param[i].dump_cnt,
              'roadsign_cnt': param[i].roadsign_cnt,
               'manyaccident_cnt' : param[i].manyaccident_cnt
             });
          }//for

          var vectorSource = new ol.source.Vector({
             features : features
          });
          
        selectStandardLayer = new ol.layer.Vector({
        	  id: 'analyzeStandardLayer',
             source : vectorSource,
             style : function(feature) {
					var color_st = feature.get('score');
					var color;
					if(color_st >= 10){
						color = 'rgba(0,0,255,0.5)';
					}else if(color_st >= 8){
						color = 'rgba(0,128,0,0.5)';
					}else if(color_st >=6){
						color = 'rgba(255,255,0,0.5)';
					}else{
						color = 'rgba(255,0,0,0.5)';
					}
                 var styles = new ol.style.Style({
                       color: color,
                       fill: new ol.style.Fill({color: color}),
                       stroke: new ol.style.Stroke({color: '#eceff1', width: 1})
                 });
                 return styles;
             },
          });
          analyzeLayers.selectStandardLayer = false;
          map1.addLayer(selectStandardLayer);  
        	
	};
	var accident_pointLayer;
	function accident_point(param){
		  var features = new Array(param.length);
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
             'geometry': new ol.format.WKT().readGeometry(param[i].accident_point),
              'size': 10
             });
          }//for
          
            var styles = {
                     '10': new ol.style.Style({
                       image: new ol.style.Circle({
                         radius: 10,
                         fill: new ol.style.Fill({color: '#d50000'}),
                         stroke: new ol.style.Stroke({color: '#ffffff', width: 1})
                       })
                     }),

           };
          
          var vectorSource = new ol.source.Vector({
             features : features
          });
          
           accident_pointLayer = new ol.layer.Vector({
        	  id: 'testLayer1',
             source : vectorSource,
             style : function(feature) {
                return styles[feature.get('size')];
             },
          });
          analyzeLayers.accident_pointLayer = false;
          map1.addLayer(accident_pointLayer);  
	};
	
	var cctv_pointLayer;
	function cctv_point(param){
		if(analyzeLayers.cctv_point != null){
			map1.removeLayer(cctv_point);
			analyzeLayers.cctv_point = null;
		}
		  var features = new Array(param.length);
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
             'geometry':new ol.format.WKT().readGeometry(param[i].cctv_point),
              'size': 10
             });
          }//for
          
            var styles = {
                     '10': new ol.style.Style({
                       image: new ol.style.Circle({
                         radius: 10,
                         fill: new ol.style.Fill({color: '#0D47A1'}),
                         stroke: new ol.style.Stroke({color: '#ffffff', width: 1})
                       })
                     }),

           };
          
          var vectorSource = new ol.source.Vector({
             features : features
          });
          
          cctv_pointLayer = new ol.layer.Vector({
        	  id: 'testLayer',
             source : vectorSource,
             style : function(feature) {
                return styles[feature.get('size')];
             },
          });
          analyzeLayers.cctv_pointLayer = false;
          map1.addLayer(cctv_pointLayer);  
	};
	
	
	var camera_pointLayer;
	function camera_point(param){
		if(analyzeLayers.camera_point != null){
			map1.removeLayer(camera_point);
			analyzeLayers.camera_point = null;
		}
		  var features = new Array(param.length);
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
             'geometry':new ol.format.WKT().readGeometry(param[i].camera_point),
              'size': 10
             });
          }//for
          
            var styles = {
                     '10': new ol.style.Style({
                       image: new ol.style.Circle({
                         radius: 10,
                         fill: new ol.style.Fill({color: '#ff6d00'}),
                         stroke: new ol.style.Stroke({color: '#ffffff', width: 1})
                       })
                     }),

           };
          
          var vectorSource = new ol.source.Vector({
             features : features
          });
          
          camera_pointLayer = new ol.layer.Vector({
        	  id: 'testLayer',
             source : vectorSource,
             style : function(feature) {
                return styles[feature.get('size')];
             },
          });
          analyzeLayers.camera_pointLayer = false;
          map1.addLayer(camera_pointLayer);  
	};
	
	
	var dump_pointLayer;
	function dump_point(param){
		if(analyzeLayers.dump_point != null){
			map1.removeLayer(dump_point);
			analyzeLayers.dump_point = null;
		}
		  var features = new Array(param.length);
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
             'geometry':new ol.format.WKT().readGeometry(param[i].dump_point),
              'size': 10
             });
          }//for
          
            var styles = {
                     '10': new ol.style.Style({
                       image: new ol.style.Circle({
                         radius: 10,
                         fill: new ol.style.Fill({color: '#8d6e63'}),
                         stroke: new ol.style.Stroke({color: '#ffffff', width: 1})
                       })
                     }),

           };
          
          var vectorSource = new ol.source.Vector({
             features : features
          });
          
           dump_pointLayer = new ol.layer.Vector({
        	  id: 'testLayer',
             source : vectorSource,
             style : function(feature) {
                return styles[feature.get('size')];
             },
          });
          analyzeLayers.dump_pointLayer = false;
          map1.addLayer(dump_pointLayer);  
	};
	
	var roadsign_pointLayer;
	function roadsign_point(param){
		if(analyzeLayers.roadsign_point != null){
			map1.removeLayer(roadsign_point);
			analyzeLayers.roadsign_point = null;
		}
		  var features = new Array(param.length);
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
             'geometry':new ol.format.WKT().readGeometry(param[i].roadsign_point),
              'size': 10
             });
          }//for
          
            var styles = {
                     '10': new ol.style.Style({
                       image: new ol.style.Circle({
                         radius: 10,
                         fill: new ol.style.Fill({color: '#000000'}),
                         stroke: new ol.style.Stroke({color: '#ffffff', width: 1})
                       })
                     }),

           };
          
          var vectorSource = new ol.source.Vector({
             features : features
          });
          
          roadsign_pointLayer = new ol.layer.Vector({
        	  id: 'testLayer',
             source : vectorSource,
             style : function(feature) {
                return styles[feature.get('size')];
             },
          });
          analyzeLayers.roadsign_pointLayer = false;
          map1.addLayer(roadsign_pointLayer);  
	};
	var manyaccident_pointLayer;
	function manyaccident_point(param){
		if(analyzeLayers.manyaccident_point != null){
			map1.removeLayer(manyaccident_point);
			analyzeLayers.manyaccident_point = null;
		}
		  var features = new Array(param.length);
          
          for (var i = 0; i < param.length; ++i) {
             features[i] = new ol.Feature({
             'geometry':new ol.format.WKT().readGeometry(param[i].manyaccident_point),
              'size': 10
             });
          }//for
          
            var styles = {
                     '10': new ol.style.Style({
                       image: new ol.style.Circle({
                         radius: 10,
                         fill: new ol.style.Fill({color: 'purple'}),
                         stroke: new ol.style.Stroke({color: '#ffffff', width: 1})
                       })
                     }),

           };
          
          var vectorSource = new ol.source.Vector({
             features : features
          });
          
           manyaccident_pointLayer = new ol.layer.Vector({
        	  id: 'testLayer',
             source : vectorSource,
             style : function(feature) {
                return styles[feature.get('size')];
             },
          });
          analyzeLayers.manyaccident_pointLayer = false;
          map1.addLayer(manyaccident_pointLayer);  
	};
