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
     

        function searchDate(f){
            
            var b_start = f.b_start.value;
            var b_end= f.b_end.value;


            }
            
     var t_name;

      // 피드 내용 insert
      function feed_insert_day(f){

        let b_subject = f.b_subject.value;
        let t_name    = f.t_name.value;

        
        if(confirm('일정을 추가 하시겠습니까?')==false)return;

        f.action = "../../board/feed_insert_day.do";
        f.submit();

        
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
    <link rel="stylesheet" href="../../../css/style.css">

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

                                <li><a href="#" onclick="feed_insert_day();">코스 그리기</a></li>

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


<div id="insert_outline_p">
    <form >
        <div id="feed_insert_theme">
       
            <div style="font-size: 30px; margin-top: -6px;">어떤 코스를 그리시나요?</div><br>
           
                    <label style="margin-left: 180px;">
                        <input role="switch" id="theme_date" name="t_name" type="radio" value="#데이트"/>#데이트
                    
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    
                    <label>
                        <input role="switch" id="theme_local_food" name="t_name" type="radio" value="#맛집"/>#맛집
                    
                    </label>
                    &nbsp; &nbsp; &nbsp;

                    <label>
                        <input role="switch" id="theme_heeling" name="t_name" type="radio" value="#힐링" />#힐링
                        
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    
                    <label>
                        <input role="switch" id="theme_memory" name="t_name" type="radio" value="#추억">#추억
                    
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    <label>
                        <input role="switch" id="theme_family" name="t_name" type="radio" value="#가족" />#가족
                        
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    
                    <label>
                        <input role="switch"  id="theme_anniversary" name="t_name" type="radio" value="#기념일"/>#기념일
                    
                    </label>
                    <hr>
        
            <label style="font-size: 30px;">제  목</label>
              <div style="font-size: 30px; padding: 5px;">
                <textarea class="form-control" rows="2" id="feed_insert_subject" name="b_subject" placeholder="                                                                    제목을 입력하세요"></textarea>
            </div>
        
         
            <div id="feed_insert_date">
                시작날짜 :
               <input id="b_start" name="b_start" style="border: 1px solid white;" type="date" value="날짜" onclick="searchDate(this.form);">
               마지막날짜 :
               <input id="b_end" name="b_end" style="border: 1px solid white;" type="date" value="날짜" onclick="searchDate(this.form);">
            </div>
      
            <hr>
            <br>

            <hr>

            <div id="feed_insert_mainSubject">
                
                    <label style="font-size: 30px;">내  용</label>
                    <textarea class="form-control" rows="8" id="feed_insert_content" name="b_content"
                    placeholder="
                    

                                                                어떤 여행이 되고 싶나요?"></textarea>
                
            </div>

            
        </div> 
        
        
            <label><input class="btn btn-info" type="button"  style="margin-bottom: -1515px; margin-left: 14px; font-size: 15px;" value="일정추가하기" 
                onclick="feed_insert_day(this.form)"></label>
      
    </form>
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

                                <li><a href="#" onclick="feed_insert_day();">코스 그리기</a></li>
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