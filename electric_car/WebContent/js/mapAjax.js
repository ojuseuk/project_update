/**
 *	지도 비동기화 
 */

function sidoSearch(root){
	url = root+"/loc";
	alert(url);
	var str;
	if(document.f.SI_DO.selectedIndex != 0){
		str = document.f.SI_DO.value;
		str = "command=sido&SI_DO="+str;
		alert(str);
		sendRequest(url, str, sidoCallback, "get");
	}
}

function sidoCallback(){
	if(httpRequest.readyState == 4 && httpRequest.status==200){
		alert("콜백함수");
		alert(httpRequest.responseText);
		
		document.getElementById("abc").innerHTML = httpRequest.responseText;
		meMap();
	}
}

