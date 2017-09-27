/**
 * 
 */

var map;
var marker

function myMap() {
	alert("myMap");
	
	if(typeof(document.getElementById("sido")) != 'undefinded'){
		alert("my");
	map = new google.maps.Map(document.getElementById("map"), {
		zoom : 8,
		center : {
			lat : 36.8240220,
			lng : 127.9265940,
		}
	});
	}else {
		alert("me");
		var latLng = document.getElementById("sido").value.split("/");
		alert(latLng[0] + " / " + latLng[1]);
		
		map = new google.maps.Map(document.getElementById("map"), {
			zoom : 9,
			center : {
				lat : Number(latLng[0]),
				lng : Number(latLng[1]),
			}
		});
	}

	var cnt = document.getElementById("cnt").value;
	
	for (var i = 0; i < cnt; i++) {
		markerAddress(document.getElementById("lat_" + (i + 1)).value, document.getElementById("longi_" + (i + 1)).value);
	}
}

function meMap() {
	alert("meMap");
	alert(document.getElementById("sido"));
	// 한국 주요도시 위도 경도 0번째 - 위도 1번째 경도
	var latLng = document.getElementById("sido").value.split("/");
	alert(latLng[0] + " / " + latLng[1]);
	
	map = new google.maps.Map(document.getElementById("map"), {
		zoom : 11,
		center : {
			lat : Number(latLng[0]),
			lng : Number(latLng[1]),
		}
	});

	var cnt = document.getElementById("cnt").value;
	for (var i = 0; i < cnt; i++) {
		markerAddress(document.getElementById("lat_" + (i + 1)).value, document.getElementById("longi_" + (i + 1)).value);
	}
}

function deTailMap() {
	alert("deTailMap");
	// 한국 주요도시 위도 경도 0번째 - 위도 1번째 경도
	
	map = new google.maps.Map(document.getElementById("map"), {
		zoom : 16,
		center : {
			lat : Number(document.getElementById("lat_1").value),
			lng : Number(document.getElementById("longi_1").value),
		}
	});
	
	markerAddress(document.getElementById("lat_1").value, document.getElementById("longi_1").value);
}

function markerAddress(lat, longi) {
	lat = Number(lat);
	longi = Number(longi);
	var myLatLng = {lat: lat, lng: longi};
	
	 marker = new google.maps.Marker({
		position: myLatLng,
		map : map
	});

	marker.addListener('click', function() {
		map.setZoom(16);
		map.setCenter(marker.getPosition());
	});

}