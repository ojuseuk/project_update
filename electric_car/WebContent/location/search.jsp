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
</head>
<body>
	<h2>충전소</h2>
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
					<tr onclick="keySearch2('${root}', '${data.csnm}')">
						<td>${data.csnm}</td>
						<td>${data.addr}</td>
						<td>${data.cpnm}</td>
					</tr>
				</tbody>
				<input type="hidden" id="location_${i.count}" value="${data.addr}">
				<input type="hidden" id="lat_${i.count}"
					value="${data.lat}">
				<input type="hidden" id="longi_${i.count}"
					value="${data.longi}">
				<input type="hidden" id="sido" value="${requestScope.map}">
				<input type="hidden" id="si" value="${requestScope.sido}">
				<input type="hidden" id="cnt"
					value="${requestScope.staList.size()}">
			</c:forEach>
		</table>
	</div>
</body>
</html>
