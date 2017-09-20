<%@page import="car.dao.LoginDAO"%>
<%@page import="car.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--     
<%
	 String id = (String)request.getParameter("id");
	 LoginDAO dao = LoginDAO.getInstance();
	 MemberVO mem= dao.getUserInfo(id);

%>
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info</title>
</head>
<body>
	<h3>개인 회원 정보 보기</h3>
	<br>

	<form action="${pageContext.request.contextPath}/logSc" method="post">
		<table border="1" cellspacing="1" width="60%">
			<tr>
				<td width=30%>사용자 아이디</td>
				<td width=70%>
					<input type="text" value="${requestScope.member.id}" disabled="disabled">
					<input type="hidden" value="${requestScope.member.id}" name="id">
<%-- 					<%=mem.getId() %> --%>
				</td>
			</tr>
			<tr>
				<td width="30%">비밀번호</td>
				<td width=70%>
<%-- 					<%=mem.getPassword() %>  --%>
					<input type="text" value="${requestScope.member.password}" name="password">
				</td>
			</tr>
			<tr>
				<td width="30%">이름</td>
				<td width=70%>
<%-- 					<%=mem.getName() %>  --%>
					<input type="text" value="${requestScope.member.name}" disabled="disabled">
					<input type="hidden" value="${requestScope.member.name}" name="name">
				</td>
			</tr>
			<tr>
				<td width="30%">이메일 주소</td>
				<td width=70%>
<%-- 					<%=mem.getEmail() %>  --%>
					<input type="text" value="${requestScope.member.email}" name="email">
				</td>
			</tr>
			<tr>
				<td width="30%">집 주소</td>
				<td width=70%>
<%-- 					<%=mem.getEmail() %>  --%>
					<input type="text" value="${requestScope.member.addr}" name="addr">
				</td>
			</tr>
			<tr>
				<td width="30%">전화번호</td>
				<td width=70%>
<%-- 					<%=mem.getEmail() %>  --%>
					<input type="text" value="${requestScope.member.phone}" name="phone">
				</td>
			</tr>
		</table>
		<br> <br> 
		<input type="hidden" name="command" value="update">
		<input type="submit" value="수정">
	</form>
		<a href="${pageContext.request.contextPath}/loginView.jsp">뒤로</a>

</body>
</html>