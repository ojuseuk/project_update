var httpRequest = null;

/* 과거 사용 브라우저 구버전 사용을 위한 함수 */
/*function getXMLHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e1) { return null; }
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}*/

/* 현재 자주 사용 */
function getXMLHttpRequest() {
	return new XMLHttpRequest();
}

function sendRequest(url, params, callback, method) {
	alert("call");
	httpRequest = getXMLHttpRequest();	
	var httpMethod = method;	
	if (httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params;
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	
	httpRequest.onreadystatechange = callback;
	
	httpRequest.send(httpMethod == 'POST' ? httpParams : null);
	
}




