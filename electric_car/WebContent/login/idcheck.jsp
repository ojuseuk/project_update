<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${requestScope.msg == '아이디가 존재합니다.'}">
		<font color="red">${requestScope.msg}</font>
	</c:if>
	<c:if test="${requestScope.msg == '아이디가 존재하지않습니다.'}">
		<font color="#DCDCDC">${requestScope.msg}</font>
	</c:if>
	<br>
