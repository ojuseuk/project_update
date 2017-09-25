/**
 * 
 */
var geocoder;
var map;

function change() {

	geocoder = new google.maps.Geocoder();
	markerAddress(document.getElementById("station_addr").value);
}

function markerAddress(location) {
	var address = location;
	
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status === google.maps.GeocoderStatus.OK) {
			var marker = new google.maps.Marker({
				map : map,
				position : results[0].geometry.location
				
			});
			alert(results[0].geometry.location);
			var s=String(results[0].geometry.location);
			var s=s.replace("(", "");
			var s=s.replace(")", "");
			var num = s.indexOf(",");
//			alert(num);
			a=s.substring(0, num);
			b=s.substring(num+1)
//			alert(a);
//			alert(b);
			document.getElementById("station_lat").value=a;
			document.getElementById("station_longi").value=b;
			
		} else {
			alert("위도 or 경도 확인이 불가능합니다.");
		}
	});
}
