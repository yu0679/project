//kakao area -- 

// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
// HTML Content를 만들어 리턴하는 함수입니다
function getTimeHTML(distance) {

    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
    var walkkTime = distance / 67 | 0;
    var walkHour = '', walkMin = '';

    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
    if (walkkTime > 60) {
        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
    }
    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
    var bycicleTime = distance / 227 | 0;
    var bycicleHour = '', bycicleMin = '';

    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
    if (bycicleTime > 60) {
        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
    }
    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li>';
    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">도보</span>' + walkHour + walkMin;
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
    content += '    </li>';
    content += '</ul>'

    return content;
}

function getTimeHTMLs(distance,i) {

    i = i+1;

    var content = '<ul class="dotOverlay distanceInfo">';
    content += '    <li class="cen">';
    content += '        다음 거리';
    content += '    </li>';
    content += '    <li>';
    content += '        <span class="label">'+ i + ' ~ ' + (i+1) +'</span><span class="number">' + distance + '</span>m';
    content += '    </li>';
    content += '</ul>'

    return content;    
}


// naver area

//2 function commit_map_api(p_lat,p_lng,p_name){ //등등  이후 var으로 따로 저장
//1 function commit_map_api(p_lat,p_lng){
function commit_map_api(){
    
    //1 var center_latlng = new naver.maps.LatLng(p_lat, p_lng)    && 혹시모르면 p_name 이름을 가져와야 할 것

    var HOME_PATH = 'https://navermaps.github.io/maps.js.ncp/docs' || '/';

    var map = new naver.maps.Map(document.getElementById('map'), {
        zoomControl: true,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.LARGE,
            position: naver.maps.Position.TOP_RIGHT
        },
        zoom: 16,
        center: new naver.maps.LatLng(37.3641097, 129.114507)
        //2 center: new naver.maps.Point(center_latlng)
        
    });


    //아래 commit_map_api를 실행하면서 안에 누적되도록 하면 되겠습니다.

    //2 var add_latlng = new naver.maps.LatLng(p_lat, p_lng);
    //2 var latlngs = [] + add_latlng;
    var latlngs = [
        // new naver.maps.LatLng(37.53480443131473, 126.9927928446203),
        // new naver.maps.LatLng(37.53452500101547, 126.99103917462925),
        // new naver.maps.LatLng(37.53484946518637, 126.99253261317003),
        new naver.maps.LatLng(37.3641097, 129.114507),
        new naver.maps.LatLng(37.3631687, 129.1175097),
        new naver.maps.LatLng(37.3597282, 129.105422),
        new naver.maps.LatLng(37.3697282, 129.115422),
        new naver.maps.LatLng(37.3697282, 129.1175097)
    ];

    //2 var infos = [[p_name]];
    var infos =
        [
            ["1-1","1-2"],
            ["2-1","2-2"],
            ["3-1","3-2"],
            ["4-1","4-2"],
            ["5-1","5-2"]
        ];


    polyline = new naver.maps.Polyline({
        map: map,
        path: latlngs,
        strokeColor: '#db4040',
        strokeWeight: 2,
        strokeOpacity: 0.8,
        startIcon: naver.maps.PointingIcon.CIRCLE,
        endIcon: naver.maps.PointingIcon.CIRCLE
    });


    //console.log(polyline.getDistance()+"전체길이");


    //maker 작업 
    var markers = [],
        infoWindows = [];

    var markerList = [];
    var ICON_GAP = 150;

    for (var i=0, ii=latlngs.length; i<ii; i++) {
        var icon = {
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
            // https://navermaps.github.io/maps.js.ncp/docs/img/example/sp_pins_spot_v3.png
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(i * 29, ICON_GAP),
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon,
            content :''
        });


        infoWindow = new naver.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:10px;">Is The <b>"'+ infos[i] +'"</b>.</div>'
        });

        console.log(infos);
    
        markers.push(marker);
        infoWindows.push(infoWindow);

        naver.maps.Event.addListener(map, 'idle', function() {
            updateMarkers(map, markers);
        });

        function updateMarkers(map, markers) {

            var mapBounds = map.getBounds();
            var marker, position;
        
            for (var i = 0; i < markers.length; i++) {
        
                marker = markers[i]
                position = marker.getPosition();
        
                if (mapBounds.hasLatLng(position)) {
                    showMarker(map, marker);
                } else {
                    hideMarker(map, marker);
                }
            }
        }        

        function showMarker(map, marker) {

            if (marker.setMap()) return;
            marker.setMap(map);
        }
        
        function hideMarker(map, marker) {
        
            if (!marker.setMap()) return;
            marker.setMap(null);
        }
        
        // 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
        function getClickHandler(seq) {
            return function(e) {
                var marker = markers[seq],
                    infoWindow = infoWindows[seq];
        
                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker);
                }
            }
        }
        
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));

                

        //만일에 2개 이하이면
        if(ii <= 2){
            console.log("good progressing");
        }

        lat1 = latlngs[i].x;
        lon1 = latlngs[i].y;
        if(latlngs.length == 1){
            lat2 = lat1;
            lon2 = lon1;
        }else if(ii > i+1 ){
            lat2 = latlngs[i+1].x;
            lon2 = latlngs[i+1].y;
        }
        Lo1 = [lat1,lon1];
        Lo2 = [lat2,lon2];

        MakerPointCircle = new naver.maps.Polyline({
            path: [
                Lo1,
                Lo2
            ],
            map: map,
            startIcon: naver.maps.PointingIcon.CIRCLE,
            endIcon: naver.maps.PointingIcon.CIRCLE,
            strokeColor: '#db4040',
            strokeOpacity: 0
        });


        if (MakerPointCircle.getDistance() != 0){
            text = getTimeHTMLs(MakerPointCircle.getDistance().toFixed(1),i);
        } else {
            text = getTimeHTML(polyline.getDistance().toFixed(1));
        }

        
        ms = new naver.maps.Marker({
            position: latlngs[i],
            icon: {
                content: '<span>'+ text +'</span>',
                anchor: new naver.maps.Point(-5, -5)
            },
            map: map
        });

        //var call_distance = polyline.path._array[i];
        //console.log(call_distance);

        marker.set('seq', i);

        markerList.push(marker);

        marker.addListener('mouseover', onMouseOver);
        marker.addListener('mouseout', onMouseOut);

        icon = null;
        marker = null;

    }

    //console.log(markerList);
    function onMouseOver(e) {
        var latlng = e.coord;

        var marker = e.overlay,
            seq = marker.get('seq');

        marker.setIcon({
            url: HOME_PATH +'/img/example/sp_pins_spot_v3_over.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(seq * 29, ICON_GAP)
        });


        //2
        // infoWindow = new naver.maps.InfoWindow({
        //     content: '',
        //     anchor: new naver.maps.Point(12, 37),

        // });

        // infoWindow.setContent([
        //     '<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
        //     '<strong>'+latlng+'</strong> : '+ '좌 클릭 지점 위/경도 좌표' +'<br />',
        //     '<strong></strong> : '+ '위/경도 좌표를 UTMK 좌표로 변환한 값' +'<br />',
        //     '<strong></strong> : '+ '변환된 UTMK 좌표를 TM128 좌표로 변환한 값' +'<br />',
        //     '<strong></strong> : '+ '변환된 TM128 좌표를 NAVER 좌표로 변환한 값' +'<br />',
        //     '</div>'
        // ].join(''));

        // infoWindow.open(map, latlng);
        //2 

    }


    function onMouseOut(e) {
        var marker = e.overlay,
            seq = marker.get('seq');

        marker.setIcon({
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(seq * 29, ICON_GAP)
        });
    }


}