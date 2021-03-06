<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
</head>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-black w3-card-2">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <a href="${root}/index.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="${root}/index.jsp#ch" class="w3-bar-item w3-button w3-padding-large w3-hide-small">충전소</a>
    <a href="${root}/index.jsp#car" class="w3-bar-item w3-button w3-padding-large w3-hide-small">전기차</a>
    <a href="${root}/index.jsp#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>    
    <c:if test="${not empty sessionScope.id }">
    	<a href="${root}/index.jsp#Q&A" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Q&A</a>
    </c:if>
    <a href="${root}/index.jsp#map" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MAP</a>
    
    <c:if test="${empty sessionScope.id }">
    <div class="w3-dropdown w3-hide-small w3-right">
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-large w3-hide-small" onclick="document.getElementById('id01').style.display='block'" >LOGIN</a> 
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-large w3-hide-small" onclick="document.getElementById('id02').style.display='block'" >회원가입</a>  
    </div>
    </c:if>
    <c:if test="${not empty sessionScope.id }">
    <div class="w3-dropdown w3-hide-small w3-right">
    <a href="${root}/logSc?command=info" class="w3-bar-item w3-button w3-padding-large w3-hide-small" >개인정보</a>
    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-large w3-hide-small" onclick="logoutPro('${root}')">로그아웃</a>
    </div>
    </c:if>
  </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="${root}/index.jsp#ch" class="w3-bar-item w3-button w3-padding-large">ch</a>
  <a href="${root}/index.jsp#car" class="w3-bar-item w3-button w3-padding-large">TOUR</a>
  <a href="${root}/index.jsp#contact" class="w3-bar-item w3-button w3-padding-large">CONTACT</a>
  <a href="${root}/index.jsp#map" class="w3-bar-item w3-button w3-padding-large">MAP</a>
</div>

<!-- 로그아웃  -->
<script>
		function logoutPro(root){
			location.href=root+"/logoutPro.jsp";
		}
</script>

</body>
</html>