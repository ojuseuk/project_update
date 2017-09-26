<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h3>충전소 정보 추가</h3>
	<form action="${pageContext.request.contextPath}/loc" method="post">
		<table>
			<tr>
				<td>충전소명</td>
				<td><input type="text" name="station_csnm"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="station_addr" id="station_addr" value="" onchange="change();"></td>
			</tr>
			<tr>
				<td>충천기 종류</td>
				<td><input type="text" name="station_cpnm"></td>
			</tr>
			<tr>
				<td>위도</td>
				<td><input type="text" name="station_lat" id="station_lat" readonly="readonly"></td>
			</tr>
			<tr>
				<td>경도</td>
				<td><input type="text" name="station_longi" id="station_longi" readonly="readonly"></td>
			</tr>
		</table>
		<input type="hidden" name="command" value="add">
		<input type="submit" value="추가">
	</form>
	<script src="${pageContext.request.contextPath}/js/location.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAt7QvTZpfChoMvfXoB4MYDvIKfeyxZX8s&callback=change"></script>
</body>
</html>