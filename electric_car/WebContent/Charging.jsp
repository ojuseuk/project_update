<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: "Lato", sans-serif
}

.mySlides {
	display: none
}
</style>
<body>

	<!-- Navbar -->
	<jsp:include page="nav.jsp" />
	
	<div
		style="width: 350px; height: 270px; float: left; display: inline-block;">
		<div style="margin-top: 80px; padding-bottom: 10px;">
			<form action="${pageContext.request.contextPath}/loc" method="post">
				<input type="hidden" name="command" value="sido"> <span
					style="font-weight: bolder; font: 14px; float: left; padding-left: 5px;">지역
					선택</span> <br style="line-height: 1.5;"> <select id="SI_DO"
					style="margin-left: 5px;" title="시도 선택" name="SI_DO">
					<option value="">시도</option>
					<option value="강원도">강원도</option>
					<option value="경기">경기</option>
					<option value="경상">경상도</option>
					<option value="광주광역시">광주광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="서울특별시">서울특별시</option>
					<option value="울산광역시">울산광역시</option>
					<option value="전라도">전라도</option>
					<option value="제주도">제주도</option>
					<option value="충청남도">충청남도</option>
					<option value="충청북도">충청북도</option>
				</select>
				<button type="submit" id="word_btn"
					style="width: 10px; height: 10px; margin-top: 11px;">
					<img src="./images/reading_glass.gif" alt="조회 버튼">
				</button>
			</form>
		</div>

		<div class="search_box" style="float: left;">
			<span style="font-weight: bolder; font: 14px; float: left; padding-left: 5px;">충전소 분류</span>
			<form action="${pageContext.request.contextPath}/loc" method="post">
				<input type="hidden" name="command" value="csNm">
				<input type="text" name="key_search" id="STAT_NAME" placeholder="검색어 입력해주세요." title="검색어를 입력바랍니다."
					style="width: 150px; margin-top: 20px; margin-left: 5px; border: 1px solid #c0c0be; ime-mode: active;">
				<input type="submit" value="조회">
			</form>
			<br style="line-height: 20px;"> 
			<a href="#" class="bt_spot_detail"
				style="background-color: #4C4C4C; color: white; top: 3px; left: 95px; margin-left: 5px;"
				onclick="window.location.reload(true);">초기화</a>
		</div>
	</div>
	<div
		style="margin-top: 50px; width: 900px; height: 200px; float: right; display: inline-block;">
		<img src="./images/car3.PNG" width="800px" height="250px">
	</div>

	<div class="w3-bar w3-indigo w3-card-2"></div>

	<!-- Add Google Maps -->
	<div style="margin-left: 5px; padding-top: 30px;">
		<h1>MAP</h1>
	</div>

	<div id="map"
		style="width: 100%; height: 400px; margin-left: 5px; margin-right: 5px"></div>

	<!-- 구글 지도 -->
	<script>
		function myMap() {
			var mapProp = {
				center : new google.maps.LatLng(37.48560466, 127.028077),
				zoom : 18,
			};
			var map = new google.maps.Map(document.getElementById("map"),
					mapProp);

		}
	</script>
	<!-- 구글 지도 -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>
	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

	<!-- Footer -->
	<footer
		class="w3-container w3-padding-64 w3-center w3-opacity w3-light-grey w3-xlarge">
		<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
			class="fa fa-instagram w3-hover-opacity"></i> <i
			class="fa fa-snapchat w3-hover-opacity"></i> <i
			class="fa fa-pinterest-p w3-hover-opacity"></i> <i
			class="fa fa-twitter w3-hover-opacity"></i> <i
			class="fa fa-linkedin w3-hover-opacity"></i>
		<p class="w3-medium">
			Powered by <a href="https://www.w3schools.com/w3css/default.asp"
				target="_blank">team 4</a>
		</p>
	</footer>

	<script>
		// Automatic Slideshow - change image every 4 seconds
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 4000);
		}

		// Used to toggle the menu on small screens when clicking on the menu button
		function myFunction() {
			var x = document.getElementById("navDemo");
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
	</script>

</body>
</html>
