<%@page import="car.dao.LoginDAO"%>
<%@page import="car.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5, h6 {
	font-family: "Roboto", sans-serif
}
/** 버튼 스타일*/
.button4 {
	background-color: white;
	color: black;
	border: 2px solid #e7e7e7;
	border-radius: 12px;
}

.button4:hover {
	background-color: #e7e7e7;
}

/** right */
</style>
</head>
<body class="w3-light-grey" >
<jsp:include page="nav.jsp"/>
	<form action="${root}/logSc" method="post">
		<!-- Page Container -->
		<div class="w3-content w3-margin-top" style="max-width: 1400px; margin-left: 10px;" >

			<!-- The Grid -->
			<div class="w3-row-padding"  style="margin-top: 45px;">

				<!-- Left Column -->
				<div class="w3-third">

					<div class="w3-white w3-text-grey w3-card-4">
						<div class="w3-display-container">
							<img src="./images/ap.PNG" style="width: 100%" alt="Avatar">

							<div class="w3-display-bottomleft w3-container w3-text-black">
								<input type="text" value="${requestScope.member.id}"
									disabled="disabled"> <input type="hidden"
									value="${requestScope.member.id}" name="id">
							</div>
						</div>
						<div class="w3-container">
							<p>
								<i
									class="fa fa-lock fa-fw w3-margin-right w3-large w3-text-teal"></i>
								<input type="text" value="${requestScope.member.password}"
									name="password">
							</p>
							<p>
								<i
									class="fa fa-smile-o fa-fw w3-margin-right w3-large w3-text-teal"></i>
								<input type="text" value="${requestScope.member.name}"
									disabled="disabled"> <input type="hidden"
									value="${requestScope.member.name}" name="name">
							</p>
							<p>
								<i
									class="fa fa-envelope-o fa-fw w3-margin-right w3-large w3-text-teal"></i>
								<input type="text" value="${requestScope.member.email}"
									name="email">
							</p>
							<p>
								<i
									class="fa fa-address-book fa-fw w3-margin-right w3-large w3-text-teal"></i>
								<input type="text" value="${requestScope.member.addr}"
									name="addr">
							</p>
							<p>
								<i
									class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>
								<input type="text" value="${requestScope.member.phone}"
									name="phone">
							</p>
							<hr>

							<input type="hidden" name="command" value="update"> <input
								type="submit" value="수정"> <a
								href="${root}/loginView.jsp">뒤로</a> <br>
							<br>

						</div>
					</div>

					<!-- End Left Column -->
				</div>
				<!-- End The Grid -->
			</div>
			<!-- End Page Container -->
		</div>
	</form>
	
	<!-- Right Column -->
	<form action="${root}/logSc" method="post">
		<div class="w3-twothird w3-display-topright w3-margin-top" id="right"
			style="margin-right: 10px; ">

			<div class="w3-container w3-card-2 w3-white w3-margin-bottom" style="margin-top: 40px;">
				<h2 class="w3-text-grey w3-padding-16">
					<i class="fa fa-lightbulb-o fa-fw w3-margin-right w3-xxlarge w3-text-teal">Q&A</i>
				</h2>
				<!-- 문의게시판 -->
				<div class="w3-display-container w3-container">
					<header class="masthead">
						<div class="w3-container">
							<table class="w3-table-all w3-hoverable">
								<tr id="list">
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>ID</th>
									<th>답변여부</th>
								</tr>
								<c:forEach var="question" items="${list}" varStatus="i">
									<tr>
										<td><a id="list">${question.fAQNum}</a></td>
										<td><a id="list">${question.fAQName}</a></td>
										<td><a id="list">${question.fAQContent}</a></td>
										<td><a id="list">${question.memberId}</a></td>
										<c:if test="${empty question.adminId}">
											<td>확인 불가</td>
										</c:if>
										<c:if test="${not empty question.adminId}">
											<td onclick="one('${root}', '${question.fAQNum}')">확인가능</td>
										</c:if>
										
									</tr>
								</c:forEach>
							</table>
						</div>

						<br><hr><br>
						<h2 class="w3-text-grey w3-padding-16">답변</h2>
						<div id="answer">
						</div>
						<br><hr><br>
					</header>
				</div>
			</div>
			<br><br><br><br>
			<!-- End Right Column -->
		</div>
	</form>
	<jsp:include page="footer.jsp"/>
	<script type="text/javascript" src="${root}/script/httpRequest.js"></script>
	<script type="text/javascript">
		function one(root, fAQNum){
			alert("안녕하세요");
			var url = root+"/FAQController";
			str = "command=anw&fAQNum="+fAQNum
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
</body>
</html>


