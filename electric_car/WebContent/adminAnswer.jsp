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
<!-- 답변하기-->
<span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form action="${pageContext.request.contextPath}/FAQController" method="post">
    <div class="container">
      
      
      <input type="hidden"  name="fAQNum" value="${param.fAQNum}">
      <br>
      <label><b>제목</b></label>
      <input type="text"  name="title" >
      <br>
      <label><b>내용</b></label>
      <input type="text"  name="content" >

      <input type="hidden" name="command" value="update">
      <div class="clearfix">
        <button type="submit" class="signupbtn" style="width: 10%;">확인</button>
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" style="width: 10%;">취소</button>
      </div>
      
      <br><hr><br>
    </div>
  </form>

</body>
</html>