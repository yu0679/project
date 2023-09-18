<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">



<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Drawing SSum</title>

    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../../css/national/national_in_out_all_patch.css">

    <!-- date_range_css -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    
    <!-- js -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.16.24/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.24/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.24/dist/js/uikit-icons.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    

    <script>



        var global_p_idx;//전역변수
        var global_p_filename;
        function show_popup(p_idx){
              
              global_p_idx = p_idx;
              
              var window_width = $(window).width();   //browser폭
              var popup_width  = $("#popup").width(); //popup폭
              //alert(window_width + " / " + popup_width );
        
              
              //팝업윈도우가 중앙에 올수 있도록 left위치 계산
              var left = window_width/2 - popup_width/2;
              $("#popup").css("left", left);
              $("#popup").show();
              
              
              //alert(p_idx+"에 대한 자료를 Ajax통해서 요청");
              
              $.ajax({
                  url		:	"photo_one.do",      //PhotoOneAction
                  data		:	{"p_idx" : p_idx },
                  dataType	: "json",
                  success	: function(res_data){
                      
                      //res_data = {"p_idx":20, "p_subject": "제목" , "p_filename":"a.jpg" ,.... }
                      
                      //download할 화일명
                      global_p_filename = res_data.p_filename;
                      
                      //이미지 출력
                      //  <img src="">
                      $("#popup > img").attr("src", "../upload/" + res_data.p_filename);
                      
                      $("#subject").html(res_data.p_subject);
                      $("#content").html(res_data.p_content);
                                    
                      var date = "최초 : " + res_data.p_regdate + 
                                 "<br>수정 : " + res_data.p_modifydate;
                      $("#regdate").html(date);
                      
                      $("#mem_idx").html("회원번호:" + res_data.mem_idx);
                      
                      
                      //로그인 여부에따라서 다운로드 버튼 사용여부 결정
                      if("${ empty user }"=="true"){
                          
                          $("#btn_download").hide();
                          
                      }else{
                          
                          $("#btn_download").show();
                      }
                      
                      //수정/삭제버튼의 사용여부 결정(본인 또는 관리자일 경우)
                      if(
                         "${ (user.mem_grade eq '관리자') }"=="true" 
                         ||
                         ( "${ user.mem_idx}" == res_data.mem_idx )
                              
                        )
                      {
                          
                          $("#div_job").show();
                          
                      }else{
                          
                          $("#div_job").hide();
                      }
                          
                      
                      
                      
                      
                  },
                  error		: function(err){
                      
                      //alert(err.responseText);
                      
                  }
                  
              });
              
          }//end:show_popup()
        
    </script>

</head>

<body>
<!-- 클릭 시 이미지 -->
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="preloader-content">
        <h3>함께 그리는 데이트, Drawing SSum</h3>
        <div id="cooking">
            <div id="area">
                <div id="pancake">
                    <img class="./img/core-img/루피.jpg">
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ##### Header Area Start ##### -->
<header class="header-area">

    <!-- Top Header Area/ sns 버튼 -->
    <div class="top-header-area bg-img bg-overlay" style="background-image: url(../../img/bg-img/header.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-between">
                <div class="col-12 col-sm-6">
                    <!-- Top Social Info -->
                    <div class="top-social-info">
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="Pinterest"><i
                                class="fa fa-pinterest" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i
                                class="fa fa-facebook" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="Twitter"><i
                                class="fa fa-twitter" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="Dribbble"><i
                                class="fa fa-dribbble" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="Behance"><i
                                class="fa fa-behance" aria-hidden="true"></i></a>
                        <a href="#" data-toggle="tooltip" data-placement="bottom" title="Linkedin"><i
                                class="fa fa-linkedin" aria-hidden="true"></i></a>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-lg-5 col-xl-4">
                    <!-- 검색 -->
                    <div class="top-search-area">
                        <form action="#" method="post">
                            <input type="search" name="top-search" id="topSearch" placeholder="Search">
                            <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 로고 사진 -->
    <div class="logo-area">
        <a href="/main"><img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 500px; height: 130px"></a>
    </div>

    <!-- Navbar Area -->
    <div class="bueno-main-menu" id="sticker">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="buenoNav">

                    <!-- 좌측 Toggler 버튼 -->
                    <div id="toggler" style="right: -1200px"><img src="../../img/core-img/toggler.png" alt=""></div>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- 메뉴 -->
                        <div class="classynav">
                            <ul>
                                <li><a href="/main">Home</a></li>

                                <li><a href="../feed/feed_insert">코스 그리기</a></li>

                                <li><a href="#">국내</a></li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="/feed/feed">피드</a></li>
                                <li><a href="#">고객센터</a>
                            </ul>

                            <!-- 로그인/회원가입 -->
                            <div class="login-area">
                                <a href="/login">Login / Register</a>
                            </div>
                        </div>
                        <!-- Nav End -->

                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<!-- ##### Header Area End ##### -->

<!-- toggle 클릭시 마이페이지/관리자 창 -->
<div class="treading-post-area" id="treadingPost">
    <div class="close-icon">
        <i class="fa fa-times"></i>
    </div>

    <h4>My Page</h4>
    <hr>

    <br>
    <a href="/feed/my_feed">내 피드</a>
    <br>
    <br>
    <br>
    <a href="#">내 예약</a><br>
    <br>
    <br>
    <a href="#">내 쿠폰</a><br>
    <br>
    <br>
    <a href="../mypage/mypage">내 정보</a>

</div>
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->



<!-- 내용 삽입 부분-->

<!-- 피드 내 가고 싶은곳 검색 -->
<!-- SDK-Start -->


<script>

    /* Jqurry초기화 */
    $(document).ready(function(){
        choose_acc();
        choose_p_jeju();
        
        console.log('alpha has called is name');

    });

    function url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose){

        url = '';

        if(choose == "place"){
            conttentId = 12;
        }else if (choose == "acc"){
            conttentId = 32;
        }else if (choose == "all"){
            conttentId = 32;
        }

        url = url_for_search_put_next_ur_forcus_on + ur_forcus_on + url_for_search_put_next_numOfRows + numOfRows + url_for_put_next_pageNum
            + pageNum + url_for_put_next_choose_hot_place + choose_hot_place + url_for_put_next_conttentId + conttentId;            

        if(ur_forcus_on == "locationBasedList1"){
            url = url_for_search_put_next_ur_forcus_on + ur_forcus_on + url_for_search_put_next_numOfRows + numOfRows + url_for_put_next_pageNum
            + pageNum + url_for_put_next_a_round_LaLoR + a_round_LaLoR + url_for_put_next_conttentId + conttentId;            
            
        }
        
        return url;
        
    }

    //전역
        var url_for_search_put_next_ur_forcus_on="https://apis.data.go.kr/B551011/KorService1/";
        var ur_forcus_on = "";
        var url_for_search_put_next_numOfRows="?serviceKey=JWkGuMrqBefVmAf2VhMxXPgWWvY4waScYYKAmkq7z%2BzySfEh1pf5f%2Ff%2FdKQq2UoxmAkWmP%2BvUMbOn8Q03pXSMQ%3D%3D&numOfRows=";
        var numOfRows = 0;

        var url_for_put_next_pageNum="&pageNo=";
        var pageNum = 0

        var url_for_put_next_choose_hot_place="&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&keyword=";
        var choose_hot_place = "";

        // 값을 받아와 나중에 나누어 주어야 합니다._수정
        var url_for_put_next_a_round_LaLoR="&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&mapX=126.981611&mapY=37.568477&radius=1000";
        var a_round_LaLoR = "";
        
        var url_for_put_next_conttentId="&contentTypeId=";
        var conttentId = 0;

        var url = '';

        var choose = '';

        var pn_run = '';

        var search = '';

        var search_input ='';
    
    function show_numof_page(pn_run,search_input){
    
        console.log('페이징 작동');

        //다음페이지
        alert(pn_run);

        choose_place(pn_run,search_input);

    }

    function choose_all(show_pn_run,search_input) {
        choose = 'all';
        document.getElementById('choose_all').style.borderBottom = "2px solid #92A8D1";
        document.getElementById('choose_acc').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_place').style.borderBottom = "1px solid lightgray";

        $("#top_place_area").hide();
        $("#date_range_addon").hide();
        $('button[id=place_search_nonuse_form]').prop('type', "button");
        $("#selection_list").hide();

        const element = document.getElementById('summer_recommend');
            element.innerHTML = '<div>여름 휴가 관광지 추천<div>';
                
        console.log(search_input+"se_place");

        if (search_input===undefined || search_input == '' || search_input=='undefined'){
            //주변 기반 기본값
            ur_forcus_on="locationBasedList1";
        }else if(search_input != null){
            choose_hot_place = search_input;
            ur_forcus_on="searchKeyword1";            
        }

        //2중 for 가져옴 api body내용
        pageNum = 1 ;
        a_round_LaLoR = "";
        numOfRows = 10 ;  

        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);
        console.log(url);
        
        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let page_size = Math.floor(res_data.response.body.totalCount/res_data.response.body.numOfRows);
                // console.log(res_data.response.body.totalCount);
                // console.log(res_data.response.body.numOfRows);
                // console.log(page_size);
                let list = res_data.response.body.items.item;

                let html="";
                for(let all of list){

                    html +=
                '<div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" id="selected_output_area" style="margin-top: 20px;">' +
                    '<div class="row align-items-center" style="border: solid 1px  black; margin-bottom: 10px;" >' +
                        '<div class="col-12 col-md-6">' +
                            '<div class="single-blog-thumbnail" style="text-align: center; border: 1px solid black;">' +
                                '<img id="main_img" src="' + all.firstimage +'"alt="...">' +
                            '</div>' +
                        '</div>' +
                        '<div class="col-12 col-md-6">' +
                            '<div class="single-blog-content">' +
                                '<h4><a href="#" class="post-headline">' +all.title+'</a></h4>' +
                                '<hr>'+
                                '<p id="overview_'+all.contentid+'">살라바!</p>' +
                                '<div style="display: none;">'+url_for_get_content(all.contentid,all.contenttypeid)+'</div>'+
                                '<hr>'+
                                '<div class="post-meta">' +
                                    '<p> 주소 : '+all.addr1+'</p>' +
                                    '<p>'+all.addr2+'</p>' +
                                    '<hr>'+
                                    '<p>by Number <a href="#">' +all.contentid+'</a></p>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>';
            }

            //remaind & intel called?
            if (search_input===undefined || search_input == ''){
            //주변 기반 기본값
                ur_forcus_on="locationBasedList1";
            }else{
                choose_hot_place = search_input;
                ur_forcus_on="searchKeyword1";            
            }

            //2중 for 가져옴 api body내용
            pageNum = show_pn_run ;
            a_round_LaLoR = "";
            numOfRows = 10 ; 
            
            for( var pn_run = 1 ; pn_run < page_size + 1 ; pn_run++){
                // 페이지당 갯수 보기위해 전역으로 빼도록 해봅시다.
                url_maker(ur_forcus_on,numOfRows,pn_run,choose_hot_place,a_round_LaLoR,choose);
                html+='<a onclick="show_numof_page('+pn_run+','+"'"+search_input+"'"+');" id="A'+pn_run+'">'+ pn_run +' </a>';
            }    

                //id=disp 출력
                $("#selected_output_area").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });        

    }

    function choose_acc() {
        choose = 'acc';
        document.getElementById('choose_acc').style.borderBottom = "2px solid #92A8D1";
        document.getElementById('choose_all').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_place').style.borderBottom = "1px solid lightgray";

        $("#top_place_area").show();
        $("#date_range_addon").show();
        $('button[id=place_search_nonuse_form]').prop('type', "submit");
        $("#selection_list").show();

        const element = document.getElementById('summer_recommend');
            element.innerHTML = '<div>여름 휴가 호텔 추천<div>';

        //입력값
        ur_forcus_on="locationBasedList1";
        numOfRows = 4 ;
        pageNum = 1 ;
        a_round_LaLoR = "";

        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);        
        

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                console.log(res_data.response.body.items.item);
                let list = res_data.response.body.items.item;

                let html="";
                for(let place of list){
                    var addr1 = place.addr1;
                    console.log(addr1);

                    
                    html +=
    '<div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" id="selected_output_area">' +
        '<div class="row align-items-center" style="border: solid 1px  black; margin-bottom: 10px;" >' +
            '<div class="col-12 col-md-6">' +
                '<div class="single-blog-thumbnail" style="text-align: center; border: 1px solid black;">' +
                    '<img id="main_img" src="../../img/bg-img/9.jpg" alt="" style="width: 350px; height: 350px;">' +
                '</div>' +
            '</div>' +
            '<div class="col-12 col-md-6">' +
                '<div class="single-blog-content">' +
                    '<a href="#" class="post-tag">place.contenttypeid</a>' +
                    '<h4><a href="#" class="post-headline">place.title</a></h4>' +
                    '<p>설명</p>' +
                    '<div class="post-meta">' +
                        '<p>by Number <a href="#">place.contentid</a></p>' +
                        '<p>place.addr1</p>' +
                        '<p>place.addr2</p>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>' +
    '</div>';
                    }

                //id=disp 출력
                $("#selected_output_area").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });
        

    }

    function choose_place(show_pn_run,search_input) {
        choose = 'place';
        
        document.getElementById('choose_place').style.borderBottom = "2px solid #92A8D1";
        document.getElementById('choose_acc').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_all').style.borderBottom = "1px solid lightgray";

        $("#top_place_area").hide();
        $("#date_range_addon").hide();
        $('button[id=place_search_nonuse_form]').prop('type', "button");
        $("#selection_list").hide();

        const element = document.getElementById('summer_recommend');
            element.innerHTML = '<div>여름 휴가 관광지 추천<div>';
                
        console.log(search_input+"se_place");

        if (search_input===undefined || search_input == '' || search_input=='undefined'){
            //주변 기반 기본값
            ur_forcus_on="locationBasedList1";
        }else if(search_input != null){
            choose_hot_place = search_input;
            ur_forcus_on="searchKeyword1";            
        }

        //2중 for 가져옴 api body내용
        pageNum = show_pn_run ;
        a_round_LaLoR = "";
        numOfRows = 10 ;  

        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);
        console.log(url);
        
        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let page_size = Math.floor(res_data.response.body.totalCount/res_data.response.body.numOfRows);
                // console.log(res_data.response.body.totalCount);
                // console.log(res_data.response.body.numOfRows);
                // console.log(page_size);
                let list = res_data.response.body.items.item;

                let html="";
                for(let place of list){

                    html +=
                '<div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" id="selected_output_area" style="margin-top: 20px;">' +
                    '<div class="row align-items-center" style="border: solid 1px  black; margin-bottom: 10px;" >' +
                        '<div class="col-12 col-md-6">' +
                            '<div class="single-blog-thumbnail" style="text-align: center; border: 1px solid black;">' +
                                '<img id="main_img" src="' + place.firstimage +'"alt="...">' +
                            '</div>' +
                        '</div>' +
                        '<div class="col-12 col-md-6">' +
                            '<div class="single-blog-content">' +
                                '<h4><a href="#" class="post-headline">' +place.title+'</a></h4>' +
                                '<hr>'+
                                '<p id="overview_'+place.contentid+'">살라바!</p>' +
                                '<div style="display: none;">'+url_for_get_content(place.contentid,place.contenttypeid)+'</div>'+
                                '<hr>'+
                                '<div class="post-meta">' +
                                    '<p> 주소 : '+place.addr1+'</p>' +
                                    '<p>' +place.addr2+'</p>' +
                                    '<hr>'+
                                    '<p>by Number <a href="#">' +place.contentid+'</a></p>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>';
            }

            //remaind & intel called?
            if (search_input===undefined || search_input == ''){
            //주변 기반 기본값
                ur_forcus_on="locationBasedList1";
            }else{
                choose_hot_place = search_input;
                ur_forcus_on="searchKeyword1";            
            }

            //2중 for 가져옴 api body내용
            pageNum = show_pn_run ;
            a_round_LaLoR = "";
            numOfRows = 10 ; 
            
            for( var pn_run = 1 ; pn_run < page_size + 1 ; pn_run++){
                // 페이지당 갯수 보기위해 전역으로 빼도록 해봅시다.
                url_maker(ur_forcus_on,numOfRows,pn_run,choose_hot_place,a_round_LaLoR,choose);
                html+='<a onclick="show_numof_page('+pn_run+','+"'"+search_input+"'"+');" id="A'+pn_run+'">'+ pn_run +' </a>';
            }    

                //id=disp 출력
                $("#selected_output_area").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });

    }

    function url_for_get_content(contentid,contentTypeId){

        console.log(contentid);
        console.log(contentTypeId);

        contentid = contentid;
        contentTypeId = contentTypeId;

        url = "https://apis.data.go.kr/B551011/KorService1/detailCommon1?serviceKey=JWkGuMrqBefVmAf2VhMxXPgWWvY4waScYYKAmkq7z%2BzySfEh1pf5f%2Ff%2FdKQq2UoxmAkWmP%2BvUMbOn8Q03pXSMQ%3D%3D&MobileOS=ETC&MobileApp=AppTest&_type=json&contentId="+contentid+"&contentTypeId="+contentTypeId+"&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=10&pageNo=1";

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let list = res_data.response.body.items.item;

                for(let place of list){

                    const element_view = document.getElementById('overview_'+contentid);
                        element_view.innerHTML = place.overview;
                }

            },
            error : function(err){
                alert(err.responseText);

            }

        });        

    }


    function find(f){
        let search_input = f.search_input.value.trim();
        console.log(search_input + "입력된 값 입니다.");

        if(choose == "place"){

        //입력값
        numOfRows = 10 ;
        pageNum = 1 ;
        a_round_LaLoR = "";

            choose_place(1,search_input);

        }
    }

    
    function choose_p_gangwon() {
        choose_hot_place = '강원';
        document.getElementById('choose_p_gangwon').style.borderBottom = "1px solid gray";
        document.getElementById('choose_p_gangwon').style.borderTop = "1px solid gray";

        document.getElementById('choose_p_jeju').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_jeju').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_soul').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_soul').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_suwon').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_suwon').style.borderTop = "1px solid lightgray";

        //입력값
        ur_forcus_on="searchKeyword1";
        numOfRows = 4 ;
        pageNum = 1 ;
        a_round_LaLoR = "";

        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let list = res_data.response.body.items.item;

                let html="";
                for(let place of list){
                    html +=
                            '<div class="col mb-5">' +
                                '<div class="card h-100">' +
                                    '<c:if test="${empty'+ place.firstimage+'}">'+
                                        'place.firstimage == "https://dummyimage.com/450x300/dee2e6/6c757d.jpg"'+
                                    '</c:if>'+
                                    '<img class="card-img-top" src="' + place.firstimage +'"alt="..." />' +
                                    '<div class="card-body p-4">' +
                                        '<div class="text-center">' +
                                                '<h5 class="fw-bolder">' + place.title +'</h5>' +
                                                '$40.00 - $80.00' +
                                        '</div>' +
                                    '</div>' +
                                    '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">' +
                                        '<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    
                }

                //id=disp 출력
                $("#hot_place_area_info").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });





    }
    
    function choose_p_jeju() {
        choose_hot_place = '제주';
        document.getElementById('choose_p_jeju').style.borderBottom = "1px solid gray";
        document.getElementById('choose_p_jeju').style.borderTop = "1px solid gray";

        document.getElementById('choose_p_gangwon').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_gangwon').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_soul').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_soul').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_suwon').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_suwon').style.borderTop = "1px solid lightgray";

        //입력값
        ur_forcus_on="searchKeyword1";
        numOfRows = 4 ;
        pageNum = 1 ;
        a_round_LaLoR = "";
        
        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let list = res_data.response.body.items.item;

                let html="";
                for(let place of list){
                    html +=
                            '<div class="col mb-5">' +
                                '<div class="card h-100">' +
                                    '<img class="card-img-top" src="' + place.firstimage +'"alt="..." />' +
                                    '<div class="card-body p-4">' +
                                        '<div class="text-center">' +
                                                '<h5 class="fw-bolder">' + place.title +'</h5>' +
                                                '$40.00 - $80.00' +
                                        '</div>' +
                                    '</div>' +
                                    '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">' +
                                        '<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    
                }

                //id=disp 출력
                $("#hot_place_area_info").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });





    }
    
    function choose_p_soul() {
        choose_hot_place = '서울';
        document.getElementById('choose_p_soul').style.borderBottom = "1px solid gray";
        document.getElementById('choose_p_soul').style.borderTop = "1px solid gray";

        document.getElementById('choose_p_jeju').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_jeju').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_gangwon').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_gangwon').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_suwon').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_suwon').style.borderTop = "1px solid lightgray";

        //입력값
        ur_forcus_on="searchKeyword1";
        numOfRows = 4 ;
        pageNum = 1 ;
        a_round_LaLoR = "";

        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let list = res_data.response.body.items.item;

                let html="";
                for(let place of list){
                    html +=
                            '<div class="col mb-5">' +
                                '<div class="card h-100">' +
                                    '<img class="card-img-top" src="' + place.firstimage +'"alt="..." />' +
                                    '<div class="card-body p-4">' +
                                        '<div class="text-center">' +
                                                '<h5 class="fw-bolder">' + place.title +'</h5>' +
                                                '$40.00 - $80.00' +
                                        '</div>' +
                                    '</div>' +
                                    '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">' +
                                        '<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    
                }

                //id=disp 출력
                $("#hot_place_area_info").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });





    }
    
    function choose_p_suwon() {
        choose_hot_place = '수원';
        document.getElementById('choose_p_suwon').style.borderBottom = "1px solid gray";
        document.getElementById('choose_p_suwon').style.borderTop = "1px solid gray";

        document.getElementById('choose_p_jeju').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_jeju').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_soul').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_soul').style.borderTop = "1px solid lightgray";
        document.getElementById('choose_p_gangwon').style.borderBottom = "1px solid lightgray";
        document.getElementById('choose_p_gangwon').style.borderTop = "1px solid lightgray";

        //입력값
        ur_forcus_on="searchKeyword1";
        numOfRows = 4 ;
        pageNum = 1 ;
        a_round_LaLoR = "";

        url_maker(ur_forcus_on,numOfRows,pageNum,choose_hot_place,a_round_LaLoR,choose);

        $.ajax({
            type : "GET",
            url : url,
            dataType : "json",
            success : function(res_data){
                
                let list = res_data.response.body.items.item;

                let html="";
                for(let place of list){
                    html +=
                            '<div class="col mb-5">' +
                                '<div class="card h-100">' +
                                    '<img class="card-img-top" src="' + place.firstimage +'"alt="..." />' +
                                    '<div class="card-body p-4">' +
                                        '<div class="text-center">' +
                                                '<h5 class="fw-bolder">' + place.title +'</h5>' +
                                                '$40.00 - $80.00' +
                                        '</div>' +
                                    '</div>' +
                                    '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">' +
                                        '<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>';
                    
                }

                //id=disp 출력
                $("#hot_place_area_info").html(html);

            },
            error : function(err){
                alert(err.responseText);

            }

        });





    }

</script>

 <link rel="stylesheet" href="../../../css/feed/feed_search.css">
<!-- 전체숙소관광지 -->

<div id="show_chooseTable" style="margin-bottom: 20px;">
    <table style="margin-top: 10px; margin-bottom: 10px; margin: auto;">
        <tr>
            <td><input type="button" class="input1" id="choose_all" value="전체 숙소" onclick="choose_all();"></td>
            <td><input type="button" class="input1" id="choose_acc" value="숙소" onclick="choose_acc();"></td>
            <td><input type="button" class="input1" id="choose_place" value="관광지" onclick="choose_place();"></td>
        </tr>
    </table>
</div>
<!-- 검색기능 -->

<li style="border: 1px solid black;" onclick="alert('ㅁ');">야놀자 리스트 주소 형식으로</li>

<div id="list_container" style="width: 600px; height: 150px;">
    <div class="search_LND">
        <div class="uk-margin">
            <form class="uk-search uk-search-default" style="padding-top: 5px;width: 100%;">
                <input id="search_input" class="uk-search-input" type="search" placeholder="Search" aria-label="Search">                
                    <div class="under_searching_d_s">
                        <div class="col-sm-6" id="date_range_addon" style="display: none;">
                            <div class="input-group">
                                <i class="fa fa-calendar bigger-6"></i>
                                <input class="form-control" type="text" name="date-range-picker" id="daterangepicker">
                            </div>
                        </div>
                    </div>
                <div class sc-btn-6>
                    <p uk-margin>
                        <button id="place_search_nonuse_form" class="uk-button uk-button-primary" onclick="find(this.form);">검색하기</button>
                    </p>
                </div>
            </form>
        </div>
        
        <!-- calendar-addon-start -->
            <script>
                $('#daterangepicker').daterangepicker({
                    "locale": {
                        "format": "YYYY-MM-DD",
                        "separator": " ~ ",
                        "applyLabel": "확인",
                        "cancelLabel": "취소",
                        "fromLabel": "From",
                        "toLabel": "To",
                        "customRangeLabel": "Custom",
                        "weekLabel": "W",
                        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    },
                    "startDate": new Date(),    
                    "endDate": new Date(),
                    "drops": "auto"
                }, function (start, end, label) {
                    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                });
            </script> 
        <!-- calendar-addon-end -->
    </div>
</div>

<hr>
<!-- 옵션 선택 -->
<div id="selection_list" style="display: none;">
    <form id="selection">
        <select name="selection" >
            <option value="전체">전체</option>
            <option value="조회순">조회순</option>
            <option value="좋아요순">좋아요순</option>
        </select>
    </form>
</div>

<!-- 고객님께 추천화는 지역별 숙소 -->
<!-- fe -->
<div id="top_place_area" style="border: 3px solid blueviolet; margin-top: 10px; display: none;">
    <div class="uk-text-left uk-text-large uk-card-body">
        Drawing SSum 지원 숙소 <code>마감 임박!!!</code>
    </div>



    <div class="bueno-post-area mb-70">
        <div class="container">
            <div class="row justify-content-center1">
                <!-- 반복10 -->
                <div uk-slideshow="animation: push">
                    <div class="container">
                        <div class="row justify-content-center1">
            
                            <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" style=" margin: 2px; padding: 5px; border: 2px solid salmon; height: 292px; width: 192px;">
                        
                                <ul class="uk-slideshow-items" style="width: 178px; height: 186px;">
                                    <li>
                                        <img src="../../img/bg-img/insta1.jpg" alt="" uk-cover>
                                    </li>
                                    <li>
                                        <img src="../../img/bg-img/insta2.jpg" alt="" uk-cover>
                                    </li>
                                </ul>
                        
                                <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                                <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    
                                <div class="uk-text-bolder" style="margin-top : 10px; color: black;">
                                    이름
                                </div>
                                <div class=".uk-text-emphasis" style="margin-top: 5px; color: black;">
                                    위치
                                </div>
                                <div class="uk-text-bold uk-text-right" style="margin-top: 10px; color: black;">
                                    ${room.price}원
                                </div>
                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 반복10 -->

                <div uk-slideshow="animation: push">
                    <div class="container">
                        <div class="row justify-content-center1">
            
                            <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" style="padding: 5px; border: 2px solid salmon; height: 292px; width: 196px;">
                        
                                <ul class="uk-slideshow-items" style="width: 186px; height: 186px;">
                                    <li>
                                        <img src="../../img/bg-img/insta1.jpg" alt="" uk-cover>
                                    </li>
                                    <li>
                                        <img src="../../img/bg-img/insta2.jpg" alt="" uk-cover>
                                    </li>
                                </ul>
                        
                                <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                                <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    
                                <div class="uk-text-bolder" style="margin-top : 10px; color: black;">
                                    이름
                                </div>
                                <div class=".uk-text-emphasis" style="margin-top: 5px; color: black;">
                                    위치
                                </div>
                                <div class="uk-text-bold uk-text-right" style="margin-top: 10px; color: black;">
                                    ${room.price}원
                                </div>
                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </div>
</div>

<!-- 사진 모음 끝-->

<!-- 내용물 -->
<div id="list_container" style="display: table; ">
    <!-- Single Blog Area  -->
<div  style="border: 2px solid hotpink;
    border-radius: 16px;   
    display: table-row;
	width:100%;
	height:auto;
    padding-left: 100px;padding-right: 100px; float: left;
    ">
    <!-- Single Blog Area  -->
    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" >

        <div id="selected_output_area"></div>
        

    </div>

</div>
<!-- 내용물 -->
</div>


<!-- 여름 휴가 호텔 추천 -->
<div id="summer_pp">
    <div class="uk-text-left uk-text-large uk-card-body" id="summer_recommend">
        여름 휴가 호텔 추천
    </div>
    <div id="show_chooseWhereTable">
        <table style="margin-top: 10px; margin-bottom: 10px; margin: auto;">
            <tr>
                <td><input type="button" class="input3" id="choose_p_gangwon" value="강원" onclick="choose_p_gangwon();"></td>
                <td><input type="button" class="input3" id="choose_p_jeju" value="제주" onclick="choose_p_jeju();"></td>
                <td><input type="button" class="input3" id="choose_p_soul" value="서울" onclick="choose_p_soul();"></td>
                <td><input type="button" class="input3" id="choose_p_suwon" value="수원" onclick="choose_p_suwon();"></td>
            </tr>
        </table>
    </div>


    <div id="hot_place_area" >
            <!-- Section-->
            <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="hot_place_area_info">
                        <!-- 5반복 -->
                    </div>
                </div>
            </section> 
            <!-- Section-->
    </div>
</div>

<!-- 사랑받는 여행지 -->


<!-- 가까운 호텔 -->

<!-- selected_area_enn -->
<!-- Footer/ 수정금지-->
<!-- ##### Footer Area Start ##### -->
<footer class="footer-area">
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-5">
                <!-- Copywrite Text -->
                <p class="copywrite-text"><a href="#"/>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                    All rights reserved | This site is made<br> <i class="fa fa-heart-o"
                                                                   aria-hidden="true"></i> by <a
                            href="/main" target="_blank">Drawing SSum</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
            <div class="col-12 col-sm-7">
                <!-- Footer Nav -->
                <div class="footer-nav">
                    <ul>
                        <li><a href="/main">Home</a></li>
                        <li><a href="../feed/feed_insert">코스 그리기</a></li>
                        <li><a href="#">국내</a></li>
                        <li><a href="#">해외</a></li>
                        <li><a href="feed/feed">피드</a></li>
                        <li><a href="#">고객센터</a>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- ##### Footer Area Start ##### -->

<!-- ##### All Javascript Script ##### -->
<!-- jQuery-2.2.4 js -->
<script src="../../js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../../js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="../../js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="../../js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="../../js/active.js"></script>


</body>

</html>