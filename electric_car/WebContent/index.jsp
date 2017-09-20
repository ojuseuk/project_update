<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<style>
body {font-family: "Lato", sans-serif}
.mySlides {display: none}
</style>
<body>

<!-- 화면위의 목록을 다른 jsp에 넣어두고 불러옵니다. -->
<jsp:include page="nav.jsp"/>
<!-- Page content -->
<div class="w3-content" style="max-width:2000px;margin-top:46px">

  <!-- Automatic Slideshow Images -->
  <div class="mySlides w3-display-container w3-center">
    <img src="./images/car8.PNG" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-black w3-padding-32 w3-hide-small">
      <h3>건강을 생각합니다</h3>
      <p><b>자동차 배출 가스로부터 해방</b></p>   
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="./images/car1.PNG" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-black w3-padding-32 w3-hide-small">
      <h3>에너지를 생각합니다</h3>
      <p><b>연료비 절감효과 </b></p>    
    </div>
  </div>
  <div class="mySlides w3-display-container w3-center">
    <img src="./images/car9.PNG" style="width:100%">
    <div class="w3-display-bottommiddle w3-container w3-text-gray w3-padding-32 w3-hide-small">
      <h3>전기차</h3>
      <p><b>미래를 생각합니다</b></p>    
    </div>
  </div>

  <!-- The Band Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="ch">
    <h2 class="w3-wide">전기차 충전소</h2>
 
    <p class="w3-justify">고향 가는 길 전기차 충전소 미리미리 위치 확인하세요.<br> 가는 길 충전소 위치를 미리 알면 연료가 떨어져가도 걱정이 없어요.</p>
    <div class="w3-row w3-padding-32 w3-right">
      <div class="w3-third ">
    		 <div class="w3-third ">
        <p>충전소 찾기 이동</p>
        <a href="Charging.jsp"><img src="./images/car4.PNG" class="w3-round w3-margin-bottom "  alt="Random Name" style="width:100%"></a>
      	</div>
      </div>
    </div>
  </div>

  <!-- The car Section -->
  <div class="w3-black" id="car">
    <div class="w3-container w3-content w3-padding-64" style="max-width:800px">
      <h2 class="w3-wide w3-center">전기차</h2>
      <p class="w3-opacity w3-center"><i>2020년 출시예정!</i></p><br>

      <ul class="w3-ul w3-border w3-white w3-text-grey">
        <li class="w3-padding">아우디 <span class="w3-tag w3-red w3-margin-left">2018년</span></li>
        <li class="w3-padding">볼보 <span class="w3-tag w3-red w3-margin-left">2019년</span></li>
        <li class="w3-padding">애플 <span class="w3-tag w3-red w3-margin-left">2019년</span></li>
      </ul>

      <div class="w3-row-padding w3-padding-32" style="margin:0 -16px">
        <div class="w3-third w3-margin-bottom">
          <img src="/w3images/newyork.jpg" alt="아우디" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>아우디</b></p>
            <p class="w3-opacity">Q6</p>
            <p>자사 첫 풀 전기 SUV를 2018년부터 생산한다고 선언</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('More').style.display='block'">More</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="/w3images/paris.jpg" alt="볼보" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>볼보</b></p>
            <p class="w3-opacity">Volvo</p>
            <p>자사 풀 전기차를 2019년 출시한다고 선언</p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('More1').style.display='block'">More</button>
          </div>
        </div>
        <div class="w3-third w3-margin-bottom">
          <img src="/w3images/sanfran.jpg" alt="애플" style="width:100%" class="w3-hover-opacity">
          <div class="w3-container w3-white">
            <p><b>애플</b></p>
            <p class="w3-opacity">apple</p>
            <p>애플은 2019년까지 시중에 전기차를 출시한다고 선언 </p>
            <button class="w3-button w3-black w3-margin-bottom" onclick="document.getElementById('More2').style.display='block'">More</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 아우디 -->
  <div id="More" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('More').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">×</span>
        <h2 class="w3-wide"><i class="w3-margin-right"></i>More</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-car"></i>Q6</label></p>
       
        <img src="./images/q6.PNG" style="width:100%">
       
      
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('More').style.display='none'">Close <i class="fa fa-remove"></i></button>
        
      </div>
    </div>
  </div>
  
  <!-- 볼보 -->
  <div id="More1" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('More1').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">×</span>
        <h2 class="w3-wide"><i class="w3-margin-right"></i>More</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-car"></i>Volvo</label></p>
       
        <img src="./images/vo.PNG" style="width:100%">
       
      
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('More1').style.display='none'">Close <i class="fa fa-remove"></i></button>
        
      </div>
    </div>
  </div>
  
  <!-- 애플 -->
  <div id="More2" class="w3-modal">
    <div class="w3-modal-content w3-animate-top w3-card-4">
      <header class="w3-container w3-teal w3-center w3-padding-32"> 
        <span onclick="document.getElementById('More2').style.display='none'" 
       class="w3-button w3-teal w3-xlarge w3-display-topright">×</span>
        <h2 class="w3-wide"><i class="w3-margin-right"></i>More</h2>
      </header>
      <div class="w3-container">
        <p><label><i class="fa fa-car"></i>apple</label></p>
       
        <img src="./images/ap.PNG" style="width:100%">
       
      
        <button class="w3-button w3-red w3-section" onclick="document.getElementById('More2').style.display='none'">Close <i class="fa fa-remove"></i></button>
        
      </div>
    </div>
  </div>

  <!-- The Contact Section -->
  <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
    <h2 class="w3-wide w3-center">CONTACT</h2>
    <p class="w3-opacity w3-center"><i>we love electric vehicles</i></p>
    <div class="w3-row w3-padding-32">
      <div class="w3-col m6 w3-large w3-margin-bottom">
        <i class="fa fa-map-marker" style="width:30px"></i> 서울<br>
        <i class="fa fa-phone" style="width:30px"></i> Phone: 02 1234 1234<br>
        <i class="fa fa-envelope" style="width:30px"> </i> Email: mail@mail.com<br>
      </div>
      <div class="w3-col m6">
       
      </div>
    </div>
  </div>
  
<!-- End Page Content -->
</div>
<!-- Add Google Maps -->
<h1>MAP</h1>

<div id="map" style="width:100%;height:400px;"></div>


<!-- 로그인 -->
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="${pageContext.request.contextPath}/logSc" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img_avatar2.png" alt="로그인" class="avatar">
    </div>

    <div class="container">
      <label><b>이름</b></label>
      <input type="hidden" name="command" value="login">
      <input type="text" placeholder="이름" name="id" required>

      <label><b>비밀번호</b></label>
      <input type="password" placeholder="비밀번호" name="password" required>
        
      <button type="submit">로그인</button>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      
      
    </div>
  </form>
</div>

<!-- 회원가입 -->
<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content animate" action="${pageContext.request.contextPath}/logSc">
    <div class="container">
      <label><b>아이디</b></label>
      <input type="hidden" name="command" value="join">
      <input type="text" placeholder="아이디" name="id" required>

      <label><b>비밀번호</b></label>
      <input type="password" placeholder="비밀번호" name="password" required>
      
      <label><b>이름</b></label>
      <input type="text" placeholder="이름" name="name" required>
      
      <label><b>이메일</b></label>
      <input type="text" placeholder="이메일" name="mail" required>
      
      <label><b>주소</b></label>
      <input type="text" placeholder="주소" name="addr" required>
      
      <label><b>전화</b></label>
      <input type="text" placeholder="전화" name="phone" required>
    
      <div class="clearfix">
        <button type="submit" class="signupbtn" style="width: 80%;">회원가입</button>
        <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" style="width: 19%;">취소</button>
      </div>
    </div>
  </form>
</div>

<!-- 구글 지도 -->
<script>
function myMap() {
	var mapProp= {
	    center:new google.maps.LatLng(37.48560466,127.028077),
	    zoom:18,
	};
	var map=new google.maps.Map(document.getElementById("map"),mapProp);

	}

</script>
<!-- 구글 지도 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjvtC_0Hr83DsKOtKr0oamgTdwyBtcuho&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<jsp:include page="footer.jsp"/>

<script>
// Automatic Slideshow - change image every 4 seconds
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 4000);    
}

// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}

// When the user clicks anywhere outside of the modal, close it
var modal = document.getElementById('More');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

var modal = document.getElementById('More1');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

var modal = document.getElementById('More2');
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

<!-- 로그인 모달 -->
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<!-- 회원가입 모달 -->
<script>
// Get the modal
var modal = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>
