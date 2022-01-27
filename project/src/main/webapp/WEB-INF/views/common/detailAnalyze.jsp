<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <!-- Custom fonts for this template-->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<div class="card">
              <div class="card-header" style="background-color: #ffe0b2">
                <h3 class="card-title" style="text-align: center; margin-bottom: 0px;">교통사고 분석 현황</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped" style="text-align: center; border: 1;" id="table">
                  <thead style="">
                    <tr>
                      <th>격자번호</th>
                      <th>교통평가 점수</th>
                      <th>교통사고 건수</th>
                      <th>사고다발 건수</th>
                      <th>무인단속 카메라 수</th>
                      <th>과속방지턱 수</th>
                      <th>도로표지판 수</th>
                      <th>cctv 수</th>
                      <th>지도확인</th>
                    </tr>
                  </thead>
                </table>

              </div>
              <!-- /.card-body -->
            </div>
                <button type="button" class="btn btn-block btn-secondary btn-sm" style="width: 50px; margin-left: 485px;" id="close">닫기</button>
            <%@ include file="../include/js2.jsp" %>
            <script>
        	var table;
        	var html;
        	var allFeature = window.opener.allFeature;
       

        	function createTable(){
        		
	        	for(var i=0; i < allFeature.length; ++i){
					$('#table').append("<tr>")
					$('#table').append("<td>" + allFeature[i].gid + "</td>")
					$('#table').append("<td style='background:lightgray; font-size : 20px;'>" + allFeature[i].sco+ "</td>")
					$('#table').append("<td>" + allFeature[i].accident_cnt+ "</td>")
					$('#table').append("<td>" + allFeature[i].manyaccident_cnt+ "</td>")
					$('#table').append("<td>" + allFeature[i].camera_cnt + "</td>")
					$('#table').append("<td>" + allFeature[i].dump_cnt+ "</td>")
					$('#table').append("<td>" + allFeature[i].roadsign_cnt+ "</td>")
					$('#table').append("<td>" + allFeature[i].cctv_cnt + "</td>")
					$('#table').append('<td><input type="button" value="지도확인" onclick="sendChildValue(\''+allFeature[i].gid+'\')"/></td>')
					$('#table').append("</tr>")
				}
        	};
        	window.onload= function(){
        		createTable();
        	};
        	
        	function sendChildValue(gid){
        		window.opener.childValue(gid);
        	}
        	
        	
            
            	$('#close').on('click',function(){
            		window.close();
            	})
            </script>
</body>
</html>