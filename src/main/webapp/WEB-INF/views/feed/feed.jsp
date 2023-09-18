<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html lang="en">

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
			     "${ (user.mem_distinguish eq '관리자') }"=="true" 
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
<!-- Start -->


 <link rel="stylesheet" href="../../../css/feed/feed_search.css">

<div class="top-search-area">
    <form method="post">
        <input type="search" name="feed_search" id="feed_search" placeholder="어디로 떠나고 싶나요.#서울 #제주도">
       
        <button type="submit" class="btn"><i class="fa fa-search" id="search_button"></i></button>
    </form>

<!-- End -->
<hr>
<!-- 옵션 선택 -->
<div id="selection_list">
    <form id="selection">
        <select name="selection" >
            <option value="전체">전체</option>
            <option value="조회순">조회순</option>
            <option value="좋아요순">좋아요순</option>
        </select>
    </form>
</div>
</div id="insert_outline">



<!-- 상세보기 팝업 -->
<%@include file="feed_popup.jsp"%>

<div id="list_container">

    <div id="list_box">



        <div id="good">
             <span  style="width: 20px; height:20px; margin-left: 880px; margin-top: 15px;">조회수 : 1348</span>
            <input type="image" src="../../img/heart/빈하트.PNG" style="width: 20px; height:20px; margin-left: 950px; margin-top: 10px;" >
        </div>


        <a id="list_box_link" href="#" onclick="show_popup('${ vo.p_idx }');">
            <div id="list_box_loc"><ul>서울시 신사동</ul></div>
                <div id="list_box_photo">
                    <img src="../../img/bg-img/11.jpg" >
                </div>
                    <div id="list_box_subject">
                        <p>2박3일</p><br>
                        <p>맛있는거</p>
                        <p>먹은날이지로오오오오오ㅁㄴㅇㄻㄴㅇㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㄹㅇㅁㄴㄹㅇㅁㄴㅇㄹㄴㅇㄹ오</p>
                        
                    
                    </div>
        </a>

</div>



<hr>
<div id="list_box">
    <!-- <a href="show_popup('${ vo.p_idx }');"> -->
    <a href="#" onclick="show_popup('${ vo.p_idx }');">
        <div id="list_box_loc"><ul>서울시 신사동</ul></div>
            <div id="list_box_photo">
                <img src="../../img/bg-img/11.jpg" >
            </div>
                <div id="list_box_subject">
                    <p>2박3일</p><br>
                    <p>맛있는거</p>
                    <p>먹은날이지로오오오오오ㅁㄴㅇㄻㄴㅇㅁㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㄹㅇㅁㄴㄹㅇㅁㄴㅇㄹㄴㅇㄹ오</p>
                    
                
            </div>
    </a>

</div>





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