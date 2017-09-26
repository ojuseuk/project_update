<%@page import="car.dao.LoginDAO"%>
<%@page import="car.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info</title>
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
</style>
</head>


<body class="w3-light-grey">
	<form action="${pageContext.request.contextPath}/logSc" method="post">
		<!-- Page Container -->
		<div class="w3-content w3-margin-top" style="max-width: 1400px;">

			<!-- The Grid -->
			<div class="w3-row-padding">

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
									class="fa fa-lock fa-fw w3-margin-right w3-large w3-text-teal"></i><input
									type="text" value="${requestScope.member.password}"
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
									class="fa fa-envelope-o fa-fw w3-margin-right w3-large w3-text-teal"></i><input
									type="text" value="${requestScope.member.email}" name="email">
							</p>
							<p>
								<i
									class="fa fa-address-book fa-fw w3-margin-right w3-large w3-text-teal"></i><input
									type="text" value="${requestScope.member.addr}" name="addr">
							</p>
							<p>
								<i
									class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i><input
									type="text" value="${requestScope.member.phone}" name="phone">
							</p>
							<hr>

							
							<input type="hidden" name="command" value="update"> <input type="submit" value="수정">

							<a href="${pageContext.request.contextPath}/loginView.jsp">뒤로</a>
							<br><br>


						</div>
					</div>


					<!-- End Left Column -->
				</div>
				
				<!-- Right Column -->
				<div class="w3-twothird" >

					<div class="w3-container w3-card-2 w3-white w3-margin-bottom">
						<h2 class="w3-text-grey w3-padding-16">
							<i
								class="fa fa-lightbulb-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Q&A
						</h2>
						<!-- 문의게시판 -->
						<div class="w3-display-container w3-container">
							<header class="masthead">
								<div class="w3-container">
									<table class="w3-table-all w3-hoverable">
										<tr id="list">
											<th>질문</th>
										</tr>
										<c:forEach var="question" items="${flist}">
											<tr>
												<td><a id="list" href="FAQController?command=detail&num=${question.FAQNum}">${question.FAQName}</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</header>
						</div>
					</div>
					<br><br><br><br>


					<!-- End Right Column -->
				</div>

				<!-- End The Grid -->
			</div>
			<!-- End Page Container -->
		</div>
	</form>

</body>
</html>


