<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>

</head>
<body>
<!-- 답변하기-->
<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form action="${pageContext.request.contextPath}/FAQController" method="post">
     
    <div class="w3-container w3-gray w3-padding-32">
      
      
      <input type="hidden"  name="fAQNum" value="${param.fAQNum}">
      <br>
      
      <label><b>제목</b></label>
      <p><input class="w3-input w3-border" type="text"  name="title" style="width:50%"></p>
      <br>
      <label><b>내용</b></label>
      <p><input input class="w3-input w3-border" type="text"  name="content" style="width:100%" ></p>

      <input type="hidden" name="command" value="update">
      <div class="clearfix">
        <button type="submit" class="w3-button w3-blue w3-margin-bottom" style="width: 10%;">확인</button>
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-white w3-margin-bottom" style="width: 10%;">취소</button>
      </div>
      
      <br><hr><br>
    </div>
  </form>

</body>
</html>