<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="id01" class="w3-modal">
	<form action="${pageContext.request.contextPath}/loc" method="post"
		class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">

		<h2 class="w3-center">충전소 정보 추가</h2>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-car"></i>
			</div>
			<div class="w3-rest">
				<input class="w3-input w3-border" type="text" name="station_csnm"
					placeholder="충전소 이름">
			</div>
		</div>


		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-plug"></i>
			</div>
			<div class="w3-rest">
				<input class="w3-input w3-border" type="text" name="station_cpnm"
					placeholder="충전기 종류">
			</div>
		</div>
		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-address-book-o"></i>
			</div>
			<div class="w3-rest">
				<input class="w3-input w3-border" type="text" name="station_addr"
					id="station_addr" value="" onchange="change();"
					placeholder="충전소 주소">
			</div>
		</div>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-map"></i>
			</div>
			<div class="w3-rest">
				<input class="w3-input w3-border" type="text" name="station_lat"
					id="station_lat" readonly="readonly" placeholder="위도">
			</div>
		</div>

		<div class="w3-row w3-section">
			<div class="w3-col" style="width: 50px">
				<i class="w3-xxlarge fa fa-map-o"></i>
			</div>
			<div class="w3-rest">
				<input class="w3-input w3-border" type="text" name="station_longi"
					id="station_longi" readonly="readonly" placeholder="경도">
			</div>
		</div>

		<p class="w3-center">
			<input type="hidden" name="command" value="add"> <input
				type="submit" class="w3-button w3-section w3-blue w3-ripple"
				value="추가"></input>
		</p>
	</form>
</div>
	<script src="${pageContext.request.contextPath}/js/location.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAt7QvTZpfChoMvfXoB4MYDvIKfeyxZX8s&callback=change"></script>
</body>
</html>