<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<div class="w3-container" style="background-color: white;">
		<table class="w3-table w3-bordered">
			<tr>
				<td>충전소명</td>
				<td>충전소 주소</td>
				<td>충전기 종류</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			<c:forEach begin="0" end="${requestScope.list.size()-1}" var="i">
				<tr>
					<td>${requestScope.list[i].csnm}</td>
					<td>${requestScope.list[i].addr}</td>
					<td>${requestScope.list[i].cpnm}</td>
					<td><button
							onclick="location.href='${pageContext.request.contextPath}/loc?command=updateDetail&station_num=${requestScope.list[i].id}'">수정하기</button></td>
					<td><button
							onclick="location.href='${pageContext.request.contextPath}/loc?command=delete&station_num=${requestScope.list[i].id}'">삭제하기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div align="center">
			<!-- 		한 화면에 보여주는 페이지 수 -->
			<c:if test="${requestScope.cnt > 0 }">
				<!-- 화면에 이동가능한 페이즈를 보여주는 수 -->
				<c:set var="pageBlock" value="${5}" />
				<!-- 현재 가지고 있는 게시글의 수에 따른 총 페이지 수 -->
				<fmt:parseNumber var="pageCount"
					value="${requestScope.cnt/requestScope.boardSize+(requestScope.cnt%requestScope.boardSize==0 ? 0:1)}"
					integerOnly="true" />
				<!-- 화면 번호 -->
				<fmt:parseNumber var="result"
					value="${(requestScope.currentPage-1)/pageBlock}"
					integerOnly="true" />

				<!-- 현 화면에서 보여주는 첫 페이지 번호 -->
				<c:set var="startPage" value="${result*pageBlock+1}" />
				<!-- 현 화면에서 보여주는 마지막 페이지 번호 -->
				<c:set var="endPage" value="${startPage+pageBlock-1}" />
			</c:if>

			<!-- 마지막 화면(page)에서 마지막 페이지번호가 총 페이지 번호보다 크면
		 마지막 페이지 번호를 총 페이지 번호로 바꾼다 -->
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>

			<c:if test="${startPage > pageBlock }">
				<a onclick="location2('${root}', '${startPage-1}')" href="#">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a onclick="location2('${root}', '${i}')" href="#">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage < pageCount}">
				<a onclick="location2('${root}', '${startPage+pageBlock}')" href="#">[다음]</a>
			</c:if>
		</div>
	</div>
</body>
</html>