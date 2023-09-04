<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8'%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<style>
#registMap {width:100%; height:600px; position:relative; float:left;}
#registMap .registMap {width:300px; height:96%; position:absolute; left:1%; top:2%; background-color:rgba(255,255,255,0.7); z-index:99}

span.mapAdd {background-color:#fff; width:58%;margin:0px;}
span.mapRegist {width:40%; margin:0px; float:right;}

#map {width:100%;height:100%; position:absolute; top:0px; left:0px; z-index:1}

#mapList li {width:100%; border-bottom:1px dotted #ccc; padding:10px 0px; background-color:#fff; cursor:pointer;}
#mapList li.active {background-color: #ffff95;}
#mapList li.new  {background-color: #dae1e6;}
#mapList li span.mapDelete {float:right; margin-right:10px; font-size:12px; height:40px; line-height:40px; width:60px;}

.mapDiv {position:relative;bottom:55px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.mapDiv:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.mapDiv span {display:block;text-align:center;border-radius:6px;background:#fff;padding:10px 15px;font-size:14px;font-weight:bold;}
</style>

</head>

<body>

<div id="registMap">
    <div class="registMap">
	<span id="mapAdd">주소등록</span>
	<span id="mapRegist">저장</span>
	<ul id="mapList"></ul>
    </div>
    <div id="map"></div>
</div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커 이미지를 여러개 사용(신규등록, 기존등록, 수정) 하기 위한 마커 생성
var imageSrc = 'markerStar1.png';
var imageSize = new kakao.maps.Size(24,35);
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

var markerSrc = 'marker_map01.png';
var markerSize = new kakao.maps.Size(31,35);
var markerImg = new kakao.maps.MarkerImage(markerSrc, markerSize);

var modifySrc = 'markerStar2.png';
var markerModify = new kakao.maps.MarkerImage(modifySrc, imageSize);

var prevMarker = -1;
var nowMarker = -1;

//마커 위치 정보를 담을 배열 생성
var markers = [];

$(function(){
    //맵 초기화(기존등록된 데이터가 있는지 확인)
    initMapData();

    //주소등록 버튼 클릭 이벤트 처리
    $("#mapAdd").on("click", function() {
        $("#addr").val("");
        new daum.Postcode({
            oncomplete: function(data) {
                $("#addr").val(data.address);
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        //첫번째 결과의 값을 활용
                        var result = results[0];

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new kakao.maps.LatLng(result.y, result.x);
                        var title = data.address;

			//마커출력
                        addMarker("new", title, coords);
                    }
                });

            }
        }).open();
    });

    //저장 버튼 클릭이벤트
    $('#mapRegist').on('click', function(){
        if(markers.length > 0) {
            $.ajax({
                type:"POST",
                url: "정보등록할 URL",
                data: $('#formName').serialize(),
                dataType: "json",
                success: function(result){
                    if(result.RESULTCD == "0") {
                        alert("등록되었습니다.");

			//맵초기화 처리(지도만 새로고침)
                        initMapData();
                    } else {
                        alert(result.RESULTMSG);
                    }
                },
                err: function(err){
                    console.log("err:", err)
                }
            });
        } else {
            alert("등록할 데이터가 없습니다.");
            return false;
        }
    });
});

//맵 초기화
function initMapData() {
    //기존 마커를 모두 지워줍니다.(안보이게 하는게 아니라 정보를 삭제)
    removeMarker();

    var getUrl = "위치정보 json 데이터 불러오기";
    $.get(getUrl, function(data) {
        var datas = JSON.parse(data);

        if(datas.RESULTCD == 0) {
            $(datas.positions).map(function(i, position) {
                var coords = new kakao.maps.LatLng(position.mapLat, position.mapLng);
		var title = position.mapTitle;
		//마커등록 처리
                addMarker(position.idx, title, coords);
            });
        }
    });    
}


//마커 등록처리
function addMarker(idx, title, position) {
    var markerIcon = markerImage;
    if(idx !== "new") {
        markerIcon = markerImg;
    }

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: position,
        image:markerIcon,
        zIndex:4
    });

    // 지도 중심을 변경한다.
    map.setCenter(position);

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    
    // 생성된 마커를 배열에 추가합니다
    markers.push(marker);

    //커스텀 오버레이추가
    var content = '<div class="mapDiv"><span>'+title+'</span></div>';
    var customOverlay = new kakao.maps.CustomOverlay({
        map:map,
        position:position,
        content:content,
        zIndex:3
    });
    customOverlay.setMap(null);

    (function(marker, customOverlay) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            customOverlay.setMap(map);
            marker.setZIndex(999);
            customOverlay.setZIndex(998);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            marker.setZIndex(4);
            customOverlay.setZIndex(3);
            customOverlay.setMap(null);
        });
    })(marker, customOverlay);

    var html = '';
    if(idx == "new") {
        html += '<li class="new">'
    } else {
        html += '<li>'
    }
    html += '<input type="hidden" name="mapIdx[]" class="mapIdx" value="'+idx+'" />';
    html += '<input type="hidden" name="lat[]" value="'+position.getLat()+'" />';
    html += '<input type="hidden" name="lng[]" value="'+position.getLng()+'" />';
    html += '<input type="text" name="mapTitle[]" class="uk-input" style="width:210px; margin-left:10px;" value="'+title+'" />';
    html += '<span class="uk-button uk-button-danger uk-button-small mapDelete">삭제</span>';
    html += '</li>';

    //등록 및 변경을 위한 li 항목 추가
    $('#mapList').append(html);
}

//마커삭제(등록된 마커 정보 모두 삭제 - 초기화)
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
    $('#mapList li').remove();
}

//생성된 li 영역 클릭시 위치정보 수정 마커로 변경
$(document).on('click','#mapList li',function(){
    prevMarker = nowMarker;

    //현재 선택중인 위치 확인을 위한 배경색 변경
    $('#mapList li').removeClass('active');
    $(this).addClass('active');

    nowMarker = $(this).index();
    var position = markers[nowMarker].getPosition();

    //마커 이미지 변경
    changeMarkerImage();

    //위치변경(선택된 위치 중심)
    map.setCenter(position);
});


//생성된 li에서 삭제버튼 클릭시 이벤트 처리
$(document).on('click','.mapDelete',function(e){
    e.preventDefault();
    var index = $(this).closest('li').index();
    var idxVal = $(this).closest('li').find('.mapIdx').val();
    
    //li 삭제
    $(this).closest('li').remove();

    //마커정보 삭제
    markers[index].setMap(null);
    markers.splice(index, 1);
    nowMarker = -1;

    //삭제할 정보가 기존등록된 정보이면 DB에서도 삭제처리한다.
    if(!isNaN(idxVal)) {
        $.ajax({
            type:"POST",
            url: "삭제할 url",
            data: {idx:idxVal},
            dataType: "json",
            success: function(result){
                if(result.RESULTCD == "0") {
                    alert("삭제되었습니다.");
                    initMapData();
                } else {
                    alert(result.RESULTMSG);
                }
            },
            err: function(err){
                console.log("err:", err)
            }
        });
    }

    return false;
});

//마커 이미지 변경(선택된 마커는 변경으로 표시 나머지는 기존으로 되돌림)
function changeMarkerImage() {
    var val = "";
    var markerIcon = markerImg;
    if(prevMarker >= 0) {
        val = $('#mapList li').eq(prevMarker).find('.mapIdx').val();
        if(trim(val) == "new") markerIcon = markerImage;
        markers[prevMarker].setImage(markerIcon);
    }
    markers[nowMarker].setImage(markerModify);

    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        if(nowMarker >= 0) {
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            markers[nowMarker].setPosition(latlng);

            document.getElementsByName("lat[]")[nowMarker].value = latlng.getLat();
            document.getElementsByName("lng[]")[nowMarker].value = latlng.getLng();
        }
    });
}

</script>

</body>
</html>