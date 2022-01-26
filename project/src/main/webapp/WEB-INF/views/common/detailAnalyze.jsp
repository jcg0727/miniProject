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
                <h3 class="card-title" style="text-align: center; ">분석 현황</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped" style="text-align: center;">
                  <thead style="">
                    <tr>
                      <th>분석항목</th>
                      <th>건수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>교통사고</td>
                      <td><c:out value="${param.accident_cnt}"></c:out></td>
                      </tr>
                    <tr>
                      <td>사고다발지역</td>
                      <td><c:out value="${param.manyaccident_cnt}"></c:out></td>
                      </tr>
                    <tr>
                      <td>무인단속카메라</td>
                      <td><c:out value="${param.camera_cnt}"></c:out></td>
                      </tr>
                    <tr>
                      <td>과속방지턱</td>
                      <td><c:out value="${param.dump_cnt}"></c:out></td>
                      </tr>
                    <tr>
                      <td>도로표지판</td>
                      <td><c:out value="${param.roadsign_cnt}"></c:out></td>
                      </tr>
                    <tr>
                      <td>CCTV</td>
                      <td><c:out value="${param.cctv_cnt}"></c:out></td>
                      </tr>
                  </tbody>
                </table>
                 <table class="table table-striped" style="text-align: center;">
                  <thead>
                    <tr>
                      <th>점수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><fmt:formatNumber value="${param.score}" pattern=".0"/></td>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            
            <%@ include file="../include/js.jsp" %>
</body>
</html>