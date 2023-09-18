<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=chrome">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3ctmxyxwq1"></script>
    
    <style>
        .dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
        .dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
        .dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
        .number {font-weight:bold;color:#ee6152;}
        .dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
        .distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
        .distanceInfo .label {display:inline-block;width:50px;}
        .distanceInfo:after {content:none;}
        
        li > .label{
            color: black;
            text-align: left;
        }

        li.cen{
            text-align: center;
        }
        </style>

</head>
<body>
<div id="map" style="width:100%;height:100%;"></div>


<script type="text/javascript" src="../../../js/feed/location_map_polyline_naver.js"></script>

</body>
</html>


