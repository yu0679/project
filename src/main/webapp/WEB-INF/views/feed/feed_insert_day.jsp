<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>


<!DOCTYPE html>
<html lang="en">

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script>
        var global_d_idx;
        var global_mem_idx;
        var global_p_idx;
        var html = "";
        var b_idx ="${b_idx}";
        var d_idx;
        var d_num = 0;
     
        
        function oneday(id){
            
            var mem_idx = id;  

            d_num +=1;
            if(d_num > 7){
                alert("더 이상 일정을 추가 할수 없습니다.")
                return;
            }

            $.ajax({

                url : "../day/plus",
                data: {"d_num" :d_num, "mem_idx" : mem_idx,"b_idx":b_idx},
                success : function(day_data){
                    d_idx   = day_data.d_idx;
                    global_mem_idx = mem_idx;

              
               html = 
                
               '<hr><div id="feed_insert_day" + ${p_idx} style="font-size:25px; margin-top:5px; margin-left: 10px;">' +

                '<div name="d_num" style="font-size: 30px;  margin-top: -5%;" >' + d_num + '일차' +
                '<input class="btn btn-info" name="popup_test" style="margin-left: 210px; margin-top: 6%; font-size: 20px; color: black;"' +
                'type="button" value="장소+" onclick="popup_loc(' + d_num +','+ d_idx + ')">' +

                ' <input class="btn btn-info" id="${user.mem_idx}" name="memo_popup" style="margin-left: 446px; margin-top: 62px; font-size: 20px; color: black;"' +
                'type="button" value="메모+" onclick="popup_memo(id,' + d_num +','+d_idx+','+b_idx+')">' +
                '</div>' +

                '<div id="place_insert_day_' + d_num + '">'+
                    '<input type="hidden" id="p_idx" value="p_idx">' +
                    '</div>' +

                '</div>' +

                '<input type="hidden" id="memo_idx">' +
                '<input type="hidden" id="p_idx" value="p_idx">' +
                '<input type="hidden" id="d_idx">' +
                '<input type="hidden" id="d_num">' +
                '<textarea readonly id="memo_content_'+ d_num +'" style="width: 500px; height: 300px; padding: 5px;' +
                'margin-top: -64px; margin-left: 615px; font-size: 20px; border: 3px solid #F7CAC9;' +
                'border-radius: 10px; resize: none;"></textarea>';
             

                                         $("#feed_insert_day_plus"+'${p_idx}').append(html); 

                },

                error : function(err){
                
                alert(err.responseText);

        }


            });
        }




    function popup_loc(d_num){
        var url = "../feed/location_search?"+"d_num="+d_num+'&'+"d_idx="+d_idx+'&'+"b_idx="+b_idx +'&'+"mem_idx="+global_mem_idx;
        var name = "popup_test";
        var option = "height=370 width=800, top = 100, left = 200, location = no, scrollbars = yes";
        var parent = window.open(url, name, option);
        
    }

    function popup_memo(id,d_num,d_idx,b_idx){

         var mem_idx = id;

         var window_width = $(window).width();   //browser폭
         var popup_width  = $("#popup").width(); //popup폭
         
         //팝업윈도우가 중앙에 올수 있도록 left위치 계산
         var left = window_width/2 - popup_width/2;
         $("#popup").css("left", left);
         $("#popup").show();
            
     }//end:memo_popup()


    function place_delete(id){

        var p_idx = id;
        
        alert(p_idx);
        if(confirm('정말 삭제 하시겠습니까?')==false)return;

        $.ajax({

        url  : "../place/delete",
        data : { "p_idx":p_idx  }, 
        success	: function(res_data){ 

            console.log(res_data.p_idx);
            
          var html="";

           html +='<div id="delete_p_name'+res_data.p_idx+'">'+
                        '<li id='+res_data.p_name+' style="margin-left: 90px; font-size: 25px; margin-top: 5px; z-index: 100;">'+res_data.p_name+'</li>'+
                        '<input class="btn btn-danger" id="'+res_data.p_idx+'" type="button" style="margin-left: 450px;" value="삭제" onclick="place_delete(this.id)">'+
                    '</div>';
                        
                   $("#delete_p_name").html(res_data);
                        
            },

            error		: function(err){
                
                alert(err.responseText);

        }

              });
            }
     
        function searchDate(f){
            
            var b_start = f.b_start.value;
            var b_end= f.b_end.value;
            console.log(b_start);
            console.log(b_end);

            }
            
     var t_name;
      // 피드 내용 insert
      function feed_board_insert(){

        location.href = "../../feed/my_feed.do?mem_idx=${user.mem_idx}";
}


      </script> 

<script>


    function img_home_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/main";
        
    }
    function main_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/main";
        
    }

    function insert_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="../feed/feed_insert";
        
    }

    function feed_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/feed/feed";
        
    }

    function my_feed_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/feed/my_feed";
        
    }

    // function main_page(){

    //     if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	//   location.href="/main";
        
    // }



</script>


<script>

    $(document).ready(function(){

        //1 p_lat = 37.53480443131473; 
        //1 p_lng = 126.9927928446203;
        //1 commit_map_api(p_lat,p_lng);
        commit_map_api();
        
    });

</script>
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
    <div class="top-header-area bg-img bg-overlay" style="background-image: url(../../../img/bg-img/header.jpg);">
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
        <a href="#" onclick="img_home_page();">  <img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 500px; height: 130px"></a>
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
                                <li><a href="#" onclick="main_page();">Home</a></li>

                                <li><a href="#" onclick="insert_page();">내 피드</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="#" onclick="feed_page();">피드</a></li>
                                <li><a href="#">고객센터</a>
                            </ul>

                            <!-- 로그인/회원가입 -->
                            <c:if test="${empty sessionScope.user}">
                                <!-- 로그인/회원가입 -->
                                <div class="login-area">
                                    <a href="/member/login">Login / Register</a>
                                </div>
                            </c:if>

                            <c:if test="${not empty sessionScope.user}">
                                <div class="login-area">
                                    <a href="/member/logout">Logout</a>
                                </div>
                            </c:if>
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
    <a href="#" onclick="my_feed_page();">내 피드</a>
    <br>
    <br>
    <br>
    <a href="#">내 예약</a><br>
    <br>
    <br>
    <a href="#">내 쿠폰</a><br>
    <br>
    <br>
    <a href="/mypage/mypage">내 정보</a>

</div>
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->



<!-- 내용 삽입 부분-->

<!-- 메모추가 펍업 -->
 <%@include file="feed_memo_popup.jsp"%> 


<link rel="stylesheet" href="../../../css/feed/feed_search.css">


<div id="insert_outline" style="overflow: auto;">
            <input type="hidden" name="mem_idx" value="${user.mem_idx}">
   
            <div style="font-size: 30px; padding: 5px;">
                <label id="p_addr" style="color:#F7CAC9; margin-left: 560px;"></label><label>여행</label>
            </div>
    
      
            <hr>
            <div id="feed_insert_map">
                <!-- 지도 api -->
                <%@include file="location_map_polyline_naver.jsp"%> 
            </div>

           <br>
            
            <div id="feed_insert_day_plus"+${p_idx}></div>
                <input type="hidden" id="mem_idx" name="mem_idx" value="${user.mem_idx}">
                <input type="hidden" id="b_idx" name="b_idx" value="${b_idx}">
                <input class="btn btn-info" id="${user.mem_idx}" type="button" value="Day+" style="margin-left: 550px;"  onclick="oneday(this.id)">
            </div> 
            
                
            
                <label><input class="btn btn-info" type="button"  style="margin-bottom: -1px; margin-left: 550px; font-size: 15px; margin-top: 5px;" value="등록하기" 
                    onclick="feed_board_insert(this.form)"></label>
            <hr>
        
      
</div>



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
                        <li><a href="#" onclick="main_page();">Home</a></li>

                                <li><a href="#" onclick="insert_page();">내 피드</a></li>
                                <li><a href="#">국내</a></li>
                                <li><a href="#">해외</a></li>
                                <li><a href="#" onclick="feed_page();">피드</a></li>
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