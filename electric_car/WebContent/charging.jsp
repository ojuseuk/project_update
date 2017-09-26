<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@page import="car.dto.MemberVO,java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>W3.CSS Template</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/location2.js"></script>
<style>
body {
	font-family: "Lato", sans-serif
}

.mySlides {
	display: none
}

.stl td {hover
	
}
</style>
<!-- <script type="text/javascript">
function noEvent() { // 새로 고침 방지
    if (event.keyCode == 116) {
        alert("새로고침을 할 수 없습니다.");
        event.keyCode = 2;
        return false;
    } else if (event.ctrlKey
            && (event.keyCode == 78 || event.keyCode == 82)) {
        return false;
    }
}
document.onkeydown = noEvent;
</script> -->
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="w3-row-padding w3-content" style="max-width: 1400px; margin-top: 75px;" id="ab">
		<div class="w3-twothird" style="margin-top: -30px;">
			<h1 align="center">Map</h1>
			<div align="center">
				<div id="map" style="width: 85%; height: 900px;"></div>
			</div>
		</div>
		<div class="w3-third" >
			<div class="w3-container w3-light-grey">
				<h2>충전소 검색</h2>
				<div >
					<div>
						<form name="f"
							method="post">
							<span style="font-weight: bolder; font: 14px; float: left; padding-left: 5px;">지역 선택</span> <br style="line-height: 1.5;"> 
							<input type="hidden" name="command" value="sido">
							<select id="SI_DO" style="margin-left: 5px;" title="시도 선택" name="SI_DO">
								<option value="">시도</option>
								<option value="강원도">강원도</option>
								<option value="경기">경기</option>
								<option value="경상남도">경상남도</option>
								<option value="경상북도">경상북도</option>
								<option value="광주광역시">광주광역시</option>
								<option value="인천광역시">인천광역시</option>
								<option value="대구광역시">대구광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="서울특별시">서울특별시</option>
								<option value="울산광역시">울산광역시</option>
								<option value="전라남도">전라남도</option>
								<option value="전라북도">전라북도</option>
								<option value="제주특별자치도">제주도</option>
								<option value="충청남도">충청남도</option>
								<option value="충청북도">충청북도</option>
							</select>
								<img src="./images/reading_glass.gif" alt="조회 버튼" onclick="sidoSearch('${root}')">
						</form>
					</div>
					<div class="search_box" style="float: left;">
						<span
							style="font-weight: bolder; font: 14px; float: left; padding-left: 5px;">충전소
							분류</span>
						<form action="${pageContext.request.contextPath}/loc"
							method="post">
							<input type="hidden" name="command" value="csNm"> <input
								type="text" name=key_search id="STAT_NAME"
								placeholder="검색어 입력해주세요." title="검색어를 입력바랍니다."
								style="width: 150px; margin-top: 20px; margin-left: 5px; border: 1px solid #c0c0be;">
							<input type="submit" value="조회">
						</form>
						<br style="line-height: 20px;"> <a href="#"
							class="bt_spot_detail"
							style="background-color: #4C4C4C; color: white; top: 3px; left: 95px; margin-left: 5px;"
							onclick="window.location.reload(true);">초기화</a>
					</div>
				</div>
			</div>
			<br>
			<div class="w3-container w3-light-grey w3-justify">
				<h2>충전소</h2>
				<div id = "a">
				<div style="overflow: scroll;  height: 550px;">
					<table class="table table-hover">
						<thead>
							<tr>
								<td>충전소명</td>
								<td>주소</td>
								<td>충전기종류</td>
							</tr>
						</thead>
						<c:forEach items="${list}" var="data" varStatus="i">
							<tbody>
								<tr>
									<td>${data.csnm}</td>
									<td>${data.addr}</td>
									<td>${data.cpnm}</td>
								</tr>
							</tbody>
							<input type="hidden" id="location_${i.count}"
								value="${data.addr}">
							<input type="hidden" id="lat_${i.count}"
								value="${data.lat}">
							<input type="hidden" id="longi_${i.count}"
								value="${data.longi}">
						</c:forEach>
					</table>
					<input type="hidden" id="cnt" value="${requestScope.list.size()}">
				</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<script type="text/javascript" src="${root}/script/httpRequest.js"></script>
	<script type="text/javascript" src="${root}/js/mapAjax.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAt7QvTZpfChoMvfXoB4MYDvIKfeyxZX8s&callback=myMap"></script>

</body>
</html>
