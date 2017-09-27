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
	<div >
		<table class="table table-hover">
				<tr>
					<td>충전소명</td>
					<td>${st.csnm}</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>${st.addr}</td>
				</tr>
				<tr>
					<td>충전기 종류</td>
					<td>${st.cpnm}</td>
				</tr>
		</table>
		<input type="hidden" id="location_1" value="${st.addr}">
		<input type="hidden" id="lat_1" value="${st.lat}">
		<input type="hidden" id="longi_1" value="${st.longi}" >
		<input type="hidden" id="cnt" value="1">
	</div>
</body>
</html>
