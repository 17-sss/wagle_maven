<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>와글 강남센터 맵</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rGDUUxt5TW5mX2jV3HBL&submodules=geocoder"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <script>
        var HOME_PATH = '/wagle/1/mapAPI/docs';
    </script>
</head>
<body>

<!-- @category Overlay/Infowindow -->

<div id="wrap" class="section" style="height: 30vh; max-height:310px;">
    <div id="map" style="width:44vw;height:29vh; margin-top: 0px;" class="w3-center w3-display-middle"></div>
    <code id="snippet" class="snippet"></code>
</div>
<script id="code">
var HOME_PATH = window.HOME_PATH || '.';

var wagleS = new naver.maps.LatLng(37.4992913,127.0331072),
    map = new naver.maps.Map('map', {
        center: wagleS.destinationPoint(0, 300),
        zoom: 10,
        zoomControl: true,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.SMALL,
            position: naver.maps.Position.TOP_RIGHT
        },
        
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: wagleS
    });

var contentString = [
        '<div class="iw_inner" style="200px;">',
        '   <p><b>Wagle 강남 센터</b><br/>서울특별시 강남구 테헤란로 132(8층)<br /></p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({

    content: contentString,
    maxWidth: 400,
    backgroundColor: "#ffffff",
    borderColor: "#ffd11a",
    borderWidth: 2,
    disableAnchor: true
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);
</script>

</body>
</html>
