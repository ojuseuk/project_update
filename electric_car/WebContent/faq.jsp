<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
 a:link {text-decoration: none;}
/**faq 스타일*/
#list {
	
	color: black;
}

th {
	background-color: #000033;
	color: white;
}

tr {
	background-color: #e6e6ff;
	color: black;
}
td {
	background-color: #e6e6ff;
	color: black;
}
.button {
	background-color: #18bc9c; /* Green */
	border-color: white;
	border-width: 1px;
	border-style: solid;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button:hover {
	background-color: white; /* Green */
	border-color: white;
	border-width: 1px;
	border-style: solid;
	color: #18bc9c;
}
</style>
<body class="w3-content" style="max-width:1200px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <a href="adminView.jsp"><h3 class="w3-wide"><b>Team 3</b></h3></a>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
 
     <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      충전소 <i class="fa fa-caret-down"></i>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a onclick="document.getElementById('id01').style.display='block'" href="#" class="w3-bar-item w3-button w3-light-grey" ><i class="fa fa-caret-right w3-margin-right"></i>추가</a>
      <jsp:include page="location/locationAdd.jsp"/>
      <a href="#" class="w3-bar-item w3-button w3-light-grey" onclick="locationList('${root}')"><i class="fa fa-caret-right w3-margin-right"></i>목록 보기</a>
<%--       ${pageContext.request.contextPath}/loc?command=updateList --%>
    </div>
    <a href="${pageContext.request.contextPath}/FAQController?command=getList" class="w3-bar-item w3-button">문의게시판</a>
    
  
  </div>
 
</nav>



<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
    <p class="w3-left">전기차 충전소</p>
    <p class="w3-right">
      <i class="fa fa-car w3-margin-right"></i>
      <a href="javascript:void(0)"  onclick="logoutPro()"><i class="fa fa-remove w3-margin-right"></i></a>
    </p>
  </header>

  <!-- 문의게시판 -->
<form action="${pageContext.request.contextPath}/FAQController" method="post">
  <div class="w3-display-container w3-container">
    <header class="masthead">
	<div class="w3-container">
		<table class="w3-table-all w3-hoverable">
			<tr id = "list">
				<th>번호</th><th>제목</th><th>내용</th><th>ID</th><th>답변</th>
			</tr>
			<c:forEach var="question" items="${flist}">
				<tr>
					<td><a id = "list">${question.fAQNum}</a></td>
					<td><a id = "list">${question.fAQName}</a></td>
					<td><a id = "list">${question.fAQContent}</a></td>
					<td><a id = "list">${question.memberId}</a></td>
					<td onclick="one('${root}', '${question.fAQNum}')">답변하기</td>
					
				</tr>
			</c:forEach>
		</table>
		
		<br><hr><br>
		<h2 class="w3-text-grey w3-padding-16">답변</h2>
		<div id="answer">
		
		</div>
		<br><hr><br>
	</div>
	</header>
  </div>
</form>


<div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">team 3</a></div>
<!-- End page content -->
</div>
<!-- 답변jsp -->
<script type="text/javascript" src="${root}/script/httpRequest.js"></script>
	<script type="text/javascript">
		function one(root, fAQNum){
			alert("admin답변");
			var url = "adminAnswer.jsp";
			str = "fAQNum="+fAQNum;
			alert(str);
			sendRequest(url, str, callback, "POST");
		}
		
		function callback(){
			if(httpRequest.readyState ==4 && httpRequest.status == 200){
				alert(httpRequest.responseText);
				document.getElementById("answer").innerHTML = httpRequest.responseText;
			}
		}
		
	 </script>
<script>
// Accordion 
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}


document.getElementById("myBtn").click();


// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>
<!-- 로그아웃  -->
<script>
		function logoutPro(){
			location.href="logoutPro.jsp";
		}
</script>
</body>
</html>
