<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>
	<form action="${root}/loc" method="post">
		<table>
			<tr>
				<td>충전소 번호</td>
				<td><input type="text" value="${requestScope.stationVO.id}" disabled="disabled"></td>
				<td><input type="hidden" name="station_num" value="${requestScope.stationVO.id}"></td>
			</tr>
			<tr>
				<td>충전소명</td>
				<td><input type="text" name="station_csnm" value="${requestScope.stationVO.csnm}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="station_addr" id="station_addr" value="${requestScope.stationVO.addr}" onchange="change();"></td>
			</tr>
			<tr>
				<td>충천기 종류</td>
				<td><input type="text" name="station_cpnm" value="${requestScope.stationVO.cpnm}"></td>
			</tr>
			<tr>
				<td>위도</td>
				<td><input type="text" name="station_lat" id="station_lat" readonly="readonly" value="${requestScope.stationVO.lat}"></td>
			</tr>
			<tr>
				<td>경도</td>
				<td><input type="text" name="station_longi" id="station_longi" readonly="readonly" value="${requestScope.stationVO.longi}"></td>
			</tr>
		</table>
		<input type="hidden" name="command" value="update">
		<input type="submit" value="추가">
	</form>
	<script src="${root}/js/location.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAt7QvTZpfChoMvfXoB4MYDvIKfeyxZX8s&callback=change"></script>
</body>
</html>