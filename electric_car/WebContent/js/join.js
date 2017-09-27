/**
 *	회원가입시 사용하는 js 
 */

/** 아이디 중복 체크하는 함수 */
	function check(root){
		var id = document.getElementById("id").value;
		var url = root + "/logSc";
		var str = "command=check&id="+id;
//		alert(id);
//		alert(url);
//		alert(str);
		sendRequest(url, str, callbackCheck, "POST");
		
	}
	
	
	function callbackCheck(){
		if(httpRequest.readyState == 4 && httpRequest.status == 200){
//			alert(httpRequest.responseText);
			document.getElementById("idcheck").innerHTML =httpRequest.responseText;
//			alert(document.getElementById("idcheck").childNodes[1].firstChild.nodeValue);
			if(document.getElementById("idcheck").childNodes[1].firstChild.nodeValue == '아이디가 존재합니다.'){
				document.getElementById("id").value = "";
				document.f.id.focus();

//				alert("들어옴");
			}
		}
	}

/** 아이디 시작을 admin_으로 못하게 하는 함수 */
	function checkAdmin(root){
		for(var i=0;i=document.f.id.value.length;i++){
			ch = document.f.id.value.substr(0, 5);
			if(ch == 'admin'){
				alert("아이디는 'admin' 으로 시작할수 없습니다");
				document.f.id.select();
				return;
			}else{
				break;
			}
		}
		check(root);
		
	}
/** 비밀번호하고 비밀번호 확인이 일치하는지 확인시켜주는 함수 */
	function checkPwd(){
		var str = "비밀번호가 일치합니다.";
		if(document.f.pwd.value != document.f.password.value){
			str = "비밀번호가 일치하지 않습니다.";
			document.f.pwd.value="";
			document.f.password.value="";
			document.f.pwd.focus();
			document.getElementById("pwdCheck").innerHTML= '<font color="red">'+str+'</font>';
			return;
		}
		document.getElementById("pwdCheck").innerHTML='<font color="#DCDCDC">'+str+'</font>';
	}
	
	
	
	
	