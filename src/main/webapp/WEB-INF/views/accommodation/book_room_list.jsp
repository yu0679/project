<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    

    <!-- Title -->
    <title>드로잉썸(Drawing SSum)</title>

    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.jpg">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../css/style.css">
    

    <style>
        /* Blog Content Area CSS */
.single-blog-area {
  position: relative;
  z-index: 1; }
  .single-blog-area .single-blog-thumbnail {
    position: relative;
    z-index: 1; }
    .single-blog-area .single-blog-thumbnail img {
      width: 100%; }
    .single-blog-area .single-blog-thumbnail .post-date {
      position: absolute;
      z-index: 10;
      left: 15px;
      top: 15px;
      border: 1px solid #787878;
      background-color: #ffffff;
      padding: 20px 8px;
      text-align: center; }
      .single-blog-area .single-blog-thumbnail .post-date a {
        font-size: 24px;
        text-transform: uppercase;
        color: #000000;
        line-height: 1;
        font-family: "helveticaneuemedium"; }
        .single-blog-area .single-blog-thumbnail .post-date a span {
          display: block;
          font-family: "Open Sans", sans-serif;
          font-size: 11px;
          color: #878787; }
  .single-blog-area .single-blog-content .line {
    background-color: #c8c8c8;
    width: 26px;
    height: 2px;
    margin-bottom: 20px; }
  .single-blog-area .single-blog-content .post-tag {
    color: #a1a1a1;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 3px;
    margin-bottom: 10px;
    display: block; }
    .single-blog-area .single-blog-content .post-tag:hover, .single-blog-area .single-blog-content .post-tag:focus {
      color: #000000; }
  .single-blog-area .single-blog-content h4 a {
    display: inline-block;
    color: #000000;
    font-size: 24px;
    margin-bottom: 30px; }
    .single-blog-area .single-blog-content h4 a:hover, .single-blog-area .single-blog-content h4 a:focus {
      color: #30336b; }
    @media only screen and (min-width: 992px) and (max-width: 1199px) {
      .single-blog-area .single-blog-content h4 a {
        margin-bottom: 20px; } }
  .single-blog-area .single-blog-content > p {
    line-height: 2;
    margin-bottom: 70px; }
    @media only screen and (min-width: 992px) and (max-width: 1199px) {
      .single-blog-area .single-blog-content > p {
        margin-bottom: 30px; } }
  .single-blog-area .single-blog-content .post-meta p {
    font-size: 9px;
    text-transform: uppercase;
    margin-bottom: 0;
    letter-spacing: 3px;
    display: inline-block; }
    .single-blog-area .single-blog-content .post-meta p:first-of-type {
      margin-right: 30px; }
    .single-blog-area .single-blog-content .post-meta p a {
      font-size: 9px;
      text-transform: uppercase;
      color: #000000;
      letter-spacing: 3px; }
  .single-blog-area.blog-style-2 .single-blog-content > p {
    margin-bottom: 30px; }

    .btn-accregister {
        background-color: rgb(220, 122, 171);
        border-color: rgb(220, 122, 171);
        margin-left: 980px;
        margin-top: 20px;
    }
   
   .btn-accregister:hover {
        border-color: rgb(116, 210, 231);
        background-color: rgb(116, 210, 231);
   }
  
    
    </style>


<!-- 
<script>
function change_text() {

    
        if (to_char(room_check_in) > to_char(${room_check_out}) || to_char(room_check_out) < to_char(${room_check_in})
            $("#textchange").val("예약가능합니다");
        
        $("#textchange").val("예약 불가한 방입니다");
        }
    
    

</script> -->



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

                                <li><a href="#" onclick="feed_insert();">코스 그리기</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="../feed/feed.do">피드</a></li>
                                <li><a href="cs/cs?category_num=c001">고객센터</a>
                            </ul>

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
    <a href="#">내 피드</a>
    <br>
    <br>
    <br>
    <a href="#">내 예약</a><br>
    <br>
    <br>
    <a href="#">내 쿠폰</a><br>
    <br>
    <br>
    <a href="#">내 정보</a>

</div>
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->



<!-- 숙소 검색 토글 -->



<!--숙소 게시물 시작 -->
<div class="container" >
    <!-- Single Blog Area  -->
    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp">

         <!-- IF 조건 걸곳 -->
       <c:forEach var="resvvo" items="${list}">

        <div class="row align-items-center" style="border: solid 1px  black; margin-bottom: 10px;" >

            <!-- 사진이 들어갈꺼 -->
            <div class="col-12 col-md-6">
                <c:forEach var="photo" items="${ resvvo.room_photo_list }">
                    <!-- <div class="single-blog-thumbnail" style="text-align: center;"> -->
                        <c:if test="${photo.room_photo_main==1}">
                        <img src="images/${photo.room_photo_name}"  style="width: 100px;" alt="">
                     </c:if>
                    <!-- </div> -->
                </c:forEach>
            </div>
            <!-- 사진끝 -->

            <!-- 글이 들어가는곳 -->
            <div class="col-12 col-md-6">
                <!-- Blog Content -->
                <div class="single-blog-content">
                    <!-- <div class="line"></div> -->
                    <h4><a href="book_room_detail.do?room_idx=${roomvo.room_idx}" class="post-headline">${resvvo.room_name}</a></h4>
                    <p>${resvvo.room_people}</p>
                    <p>${resvvo.room_price}</p>
                    <p>${resvvo.room_service}</p>   
                        <span id="id_message">${  resvvo.room_use==1 ? '<font color=red>예약불가</font>' : '<font color=blue>예약가능</font>' }</span>
                        <c:if test="${ resvvo.room_use==0 }">
                            <span>
                                <form action="../payment">
                                    <input type="hidden" name="room_idx" value="${ resvvo.room_idx}">
                                    <input type="hidden" name="room_price" value="${ resvvo.room_price}">
                                    <input type="hidden" name="room_name" value="${ resvvo.room_name}">
                                    <input type="hidden" name="acc_idx" value="${ resvvo.acc_idx}">
                                    
                                    <input type="submit"  class="btn btn_lg btn_primary" value="예약">
                                </form>
                            </span>
                        </c:if>
                        <input type="hidden" id="${resvvo.room_use}" name="${resvvo.room_use}" value="${resvvo.room_use}">
                    </div>
                    <div class="post-meta">
                        <p> <a href="#"></a></p>
                        <p>3 comments</p>
                    </div>
                   
                </div>
            </div>
            <!-- 글이 끝나는  -->
            <!-- IF 조건 끝나는 곳  -->

        </div>

    </c:forEach>

    </div>
</div>
<!-- 끝 -->






<!-- 내용 삽입 부분-->




<!-- Footer/ 수정금지-->
<!-- ##### Footer Area Start ##### -->
<footer class="footer-area">
    <hr>
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
                        <li><a href="#">코스 그리기</a></li>
                        <li><a href="#">국내</a></li>
                        <li><a href="#">해외</a></li>
                        <li><a href="../../single-post.html">피드</a></li>
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