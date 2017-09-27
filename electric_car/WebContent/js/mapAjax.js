/**
 *	지도 비동기화 
 */

function sidoSearch(root){
	url = root+"/loc";
//	alert(url);
	var str;
	if(document.f.SI_DO.selectedIndex != 0){
		str = document.f.SI_DO.value;
		str = "command=sido&SI_DO="+str;
//		alert(str);
		sendRequest(url, str, sidoCallback, "get");
	}
}

function sidoCallback(){
	if(httpRequest.readyState == 4 && httpRequest.status==200){
//		alert("sidoCallback");
//		alert(httpRequest.responseText);
		
		document.getElementById("def").innerHTML = httpRequest.responseText;
		meMap();
	}
}

function keySearch(root){
	var url = root + "/loc";
	var str = "command=csNm&key_search="+document.getElementById("STAT_NAME").value;
//	alert(url);
//	alert(str);
	sendRequest(url, str, keyCallback, "POST");
}

function keySearch2(root, csnm){
	var url = root + "/loc";
	var str = "command=csNm&key_search="+csnm;

	sendRequest(url, str, keyCallback, "POST");
}

function keyCallback(){
	if(httpRequest.readyState == 4 && httpRequest.status==200){
//		alert("keyCallback");
//		alert(httpRequest.responseText);
		
		document.getElementById("def").innerHTML = httpRequest.responseText;
		deTailMap();
	}
}
