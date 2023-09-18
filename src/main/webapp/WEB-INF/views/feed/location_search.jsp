<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>



<!DOCTYPE html>
<html lang="en" id="location_search_jsp">
    <head>
        
<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- kakao location-->
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
    .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
    .map_wrap {position:relative;width:100%;height:500px;}
    #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
    .bg_white {background:#fff;}
    #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
    #menu_wrap .option{text-align: center;}
    #menu_wrap .option p {margin:10px 0;}  
    #menu_wrap .option button {margin-left:5px;}
    #placesList li {list-style: none;}
    #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
    #placesList .item span {display: block;margin-top:4px;}
    #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    #placesList .item .info{padding:10px 0 10px 55px;}
    #placesList .info .gray {color:#8a8a8a;}
    #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
    #placesList .info .tel {color:#009900;}
    #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
    #placesList .item .marker_1 {background-position: 0 -10px;}
    #placesList .item .marker_2 {background-position: 0 -56px;}
    #placesList .item .marker_3 {background-position: 0 -102px}
    #placesList .item .marker_4 {background-position: 0 -148px;}
    #placesList .item .marker_5 {background-position: 0 -194px;}
    #placesList .item .marker_6 {background-position: 0 -240px;}
    #placesList .item .marker_7 {background-position: 0 -286px;}
    #placesList .item .marker_8 {background-position: 0 -332px;}
    #placesList .item .marker_9 {background-position: 0 -378px;}
    #placesList .item .marker_10 {background-position: 0 -423px;}
    #placesList .item .marker_11 {background-position: 0 -470px;}
    #placesList .item .marker_12 {background-position: 0 -516px;}
    #placesList .item .marker_13 {background-position: 0 -562px;}
    #placesList .item .marker_14 {background-position: 0 -608px;}
    #placesList .item .marker_15 {background-position: 0 -654px;}
    #pagination {margin:10px auto;text-align: center;}
    #pagination a {display:inline-block;margin-right:10px;}
    #pagination .on {font-weight: bold; cursor: default;color:#777;}
    </style>    


<!-- 키워드 장소 검색 목록 표출-start -->
</head>

<body>
<div class="map_wrap">
<div id="map2" style="width:100;height:100%;position:relative;overflow:hidden;"></div>
<div id="map2" style="width:100px;height:100%;"></div>
<div id="menu_wrap" class="bg_white">
    <div class="option">
        <div>                
            <form onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
            </form> 

        </div>
    </div>
    <hr>
    <ul id="placesList"></ul>
    <div id="pagination"></div>
</div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2b9b4c24a52246df47d7ae0559f627b&libraries=services"></script>
<script>


// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map2 = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

var keyword = document.getElementById('keyword').value;

if (!keyword.replace(/^\s+|\s+$/g, '')) {
    alert('키워드를 입력해주세요!');
    return false;
}

// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
if (status === kakao.maps.services.Status.OK) {

    console.log(Object(data)); //오브젝트 형태로 나온다는 건데

    // 정상적으로 검색이 완료됐으면
    // 검색 목록과 마커를 표출합니다
    displayPlaces(data);

    // 페이지 번호를 표출합니다
    displayPagination(pagination);

} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

    alert('검색 결과가 존재하지 않습니다.');
    return;

} else if (status === kakao.maps.services.Status.ERROR) {

    alert('검색 결과 중 오류가 발생했습니다.');
    return;

}
}



const searchParams = new URLSearchParams(window.location.href);

const urlParams = new URL(window.location.href).searchParams;

const url = window.location.href;
const d_num = urlParams.get('d_num');
const d_idx = urlParams.get('d_idx');
const b_idx = urlParams.get('b_idx');
const mem_idx = urlParams.get('mem_idx');


var p_idx;

//alert(mem_idx);

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

var listEl = document.getElementById('placesList'), 
menuEl = document.getElementById('menu_wrap'), 
fragment = document.createDocumentFragment(), 
bounds = new kakao.maps.LatLngBounds(), 
listStr = '';

// 검색 결과 목록에 추가된 항목들을 제거합니다
removeAllChildNods(listEl);

// 지도에 표시되고 있는 마커를 제거합니다
removeMarker();

for ( var i=0; i<places.length; i++ ) {
    

    // 마커를 생성하고 지도에 표시합니다
    var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
        marker = addMarker(placePosition, i), 
        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        //저장해야합니다
        //console.log(places[i]);


    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(placePosition);

    // 마커와 검색결과 항목에 mouseover 했을때
    // 해당 장소에 인포윈도우에 장소명을 표시합니다
    // mouseout 했을 때는 인포윈도우를 닫습니다



    (function(marker, title) {

        //카운트되는 i 값 내부 함수로 가져와
        var o = i;

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            // 마커 위에 인포윈도우를 표시합니다
            if(confirm(title+": Maker 쪽 이벤트 : 장소를 추가하시겠습니까?")==false)return;
            var address_name=places[o].address_name;
            var category_group_code=places[o].category_group_code;
            var category_group_name=places[o].category_group_name;
            var category_name=places[o].category_name;
            var distance=places[o].distance;
            var id=places[o].id;
            var phone=places[o].phone;
            var place_name=places[o].place_name;
            var place_url=places[o].place_url;
            var road_address_name=places[o].road_address_name;
            var x=places[o].x; //lat
            var y=places[o].y; //log
            //아래 새창으로 열었으니 데이터 전송, vo 또는 Ajax작업 하면 될거 같습니다.



            ///장소추가  
            // location_names.value=title;
            // addr_name.value = address_name;  
            
            // lat.value = x;
            // log.value = y;

            //console.log(category_group_code);
            ///장소 추가 확인 창 아래 test 이후 text box 삭제 해주십시오.

            $.ajax({

                url  : "../place/location",
                data : { "p_name":place_name, "p_addr":address_name, "p_lat":x, "p_log":y , "mem_idx":mem_idx,"d_num":d_num, "d_idx":d_idx,"p_code" :category_group_code,"b_idx":b_idx }, 
                success	: function(res_data){
                    
                    var arr = res_data;
                    var p_addr = address_name.substring(0, 2);
                    var p_name;
                    p_name = place_name;
                    p_idx = res_data.p_idx;
                    
                    var place="";
                   
                    console.log(d_num);
                    for(let list of arr){
                     place += '<div id="delete_p_name"'+list.p_idx+'>'+
                         '<li id='+list.p_name+' name="p_name" style="margin-left: 90px; font-size: 25px; margin-top: 5px; z-index: 100;">'+list.p_name+'</li>'+
                        '<input class="btn btn-danger" id="'+list.p_idx+'" type="button" style="margin-left: 450px;" value="삭제" onclick="place_delete('+ list.p_idx +')">'+
                        '<c:if test="${'+ list.category_group_code +' eq '+AD5+' }">'+
                            '<input class="btn btn-danger" id="'+list.acc+'" type="button" style="margin-left: 450px;" value="숙소예약" onclick="place_delete('+ list.p_idx +')">'+
                        '</c:if>'+
                        '<input  id="'+list.p_addr+'" type="hidden" value="p_addr">'+
                        '<input  id="'+list.p_idx+'" type="hidden" value="'+list.p_idx+'">'+
                        '</div>';

                        
                        opener.document.getElementById("place_insert_day_" + list.d_num).innerHTML += place;
                     
                    }
                
                    opener.document.getElementById("p_addr").innerHTML = p_addr;
                  

                    setTimeout(function() {
                        window.close();
                    }, 500);
                        
                },
                error		: function(err){
                    
                    alert(err.responseText);
                    
                    
                    
                }


            });


            //infowindow.open(map, marker);  
        });

        kakao.maps.event.addListener(marker, 'mouseover', function() {
            displayInfowindow(marker, title); //지도에있는 마커에 호버 했을경우
            //function onclick()
        });

        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });


        itemEl.onclick =  function () {
            displayInfowindow(marker, title);
            if(confirm(title+": List 쪽 이벤트 : 장소를 추가하시겠습니까?")==false)return;
            var address_name=places[o].address_name;
            var category_group_code=places[o].category_group_code;
            var category_group_name=places[o].category_group_name;
            var category_name=places[o].category_name;
            var distance=places[o].distance;
            var id=places[o].id;
            var phone=places[o].phone;
            var place_name=places[o].place_name;
            var place_url=places[o].place_url;
            var road_address_name=places[o].road_address_name;
            var x=places[o].x; //lat
            var y=places[o].y; //log

            //아래 새창으로 열었으니 데이터 전송, vo 또는 Ajax작업 하면 될거 같습니다.



          ///장소추가  
        //   location_names.value=title;
        //     addr_name.value = address_name;  
            
        //     lat.value = x;
        //     log.value = y;

            //console.log(category_group_code);
            ///장소 추가 확인 창 아래 test 이후 text box 삭제 해주십시오.

            $.ajax({

                url  : "../place/location",
                data : { "p_name":place_name, "p_addr":address_name, "p_lat":x, "p_log":y , "mem_idx":mem_idx,"d_num":d_num, "d_idx":d_idx,"p_code" :category_group_code,"b_idx":b_idx }, 
                success	: function(res_data){
                    
                    var arr = res_data;
                    var p_addr = address_name.substring(0, 2);
                    var p_name;
                    p_name = place_name;
                    p_idx = res_data.p_idx;
                    
                    var place="";
                   
                    console.log(d_num);
                    for(let list of arr){
                     place += '<div id="delete_p_name"'+list.p_idx+'>'+
                         '<li id='+list.p_name+' name="p_name" style="margin-left: 90px; font-size: 25px; margin-top: 5px; z-index: 100;">'+list.p_name+'</li>'+
                        '<input class="btn btn-danger" id="'+list.p_idx+'" type="button" style="margin-left: 450px;" value="삭제" onclick="place_delete('+ list.p_idx +')">'+
                        '<c:if test="${'+ list.category_group_code +' eq '+AD5+' }">'+
                            '<input class="btn btn-danger" id="'+list.acc+'" type="button" style="margin-left: 450px;" value="숙소예약" onclick="place_delete('+ list.p_idx +')">'+
                        '</c:if>'+
                        '<input  id="'+list.p_addr+'" type="hidden" value="p_addr">'+
                        '<input  id="'+list.p_idx+'" type="hidden" value="'+list.p_idx+'">'+
                        '</div>';

                        
                        opener.document.getElementById("place_insert_day_" + list.d_num).innerHTML += place;
                     
                    }
                
                    opener.document.getElementById("p_addr").innerHTML = p_addr;
                  

                    setTimeout(function() {
                        window.close();
                    }, 500);
                        
                },
                error		: function(err){
                    
                    alert(err.responseText);
                    
                    
                    
                }


                });
        };


        itemEl.onmouseover =  function () {
            displayInfowindow(marker, title);
        };

        itemEl.onmouseout =  function () {
            infowindow.close();
        };
    })(marker, places[i].place_name);
    

    fragment.appendChild(itemEl);
}

// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
listEl.appendChild(fragment);
menuEl.scrollTop = 0;

// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
map2.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

var el = document.createElement('li'),
itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
            '<div class="info">' +
            '   <h5>' + places.place_name + '</h5>';

if (places.road_address_name) {
    itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' +  places.address_name  + '</span>';
} else {
    itemStr += '    <span>' +  places.address_name  + '</span>'; 
}
             
  itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';           

el.innerHTML = itemStr;
el.className = 'item';

return el;
}



// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
    imgOptions =  {
        spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
        spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
        marker = new kakao.maps.Marker({
        position: position, // 마커의 위치
        image: markerImage 
    });

marker.setMap(map2); // 지도 위에 마커를 표출합니다
markers.push(marker);  // 배열에 생성된 마커를 추가합니다

return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
for ( var i = 0; i < markers.length; i++ ) {
    markers[i].setMap(null);
}   
markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
var paginationEl = document.getElementById('pagination'),
    fragment = document.createDocumentFragment(),
    i; 

// 기존에 추가된 페이지번호를 삭제합니다
while (paginationEl.hasChildNodes()) {
    paginationEl.removeChild (paginationEl.lastChild);
}

for (i=1; i<=pagination.last; i++) {
    var el = document.createElement('a');
    el.href = "#";
    el.innerHTML = i;

    if (i===pagination.current) {
        el.className = 'on';
    } else {
        el.onclick = (function(i) {
            return function() {
                pagination.gotoPage(i);
            }
        })(i);
    }

    fragment.appendChild(el);
}
paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';



infowindow.setContent(content);
infowindow.open(map2, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
while (el.hasChildNodes()) {
    el.removeChild (el.lastChild);
}
}

</script>
<!-- 키워드 장소 검색 목록 표출-end -->

<style>
div.map_wrap {
overflow-x: hidden;
overflow-y: hidden;
}
</style>

<input type="hidden" id="${user.mem_idx}" name="${user.mem_idx}" value="${user.mem_idx}">


</body>
</html>