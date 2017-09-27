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
	<div class="w3-container">
		<table class="w3-table-all w3-hoverable">
			<tr id="list">
				<th>제목</th>
				<th>내용</th>
				<th>관리자아이디</th>
			</tr>
			<tr>
				<td><a id="list">${faq.adminName}</a></td>
				<td><a id="list">${faq.adminContext}</a></td>
				<td><a id="list">${faq.adminId}</a></td>
			</tr>
		</table>
	</div>
</body>
</html>