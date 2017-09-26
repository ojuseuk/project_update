<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="overflow: scroll;  height: 550px;">
	<table class="table table-hover">
		<thead>
			<tr>
				<td>충전소명</td>
				<td>주소</td>
				<td>충전기종류</td>
			</tr>
		</thead>
		<c:forEach items="${staList}" var="data" varStatus="i">
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
	<input type="hidden" id="sido" value="${requestScope.map}">
	<input type="hidden" id="cnt" value="${requestScope.list.size()}">
</div>
</body>
</html>