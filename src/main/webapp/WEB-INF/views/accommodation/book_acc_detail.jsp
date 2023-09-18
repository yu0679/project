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

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.16.24/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.24/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.24/dist/js/uikit-icons.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>    
    

    <style>
        /* Blog Content Area CSS */
  .single-blog-area .single-blog-content .post-tag {
    color: #a1a1a1;
    font-size: 17px;
    text-transform: uppercase;
    letter-spacing: 3px;
    margin-top: 10px;
    margin-bottom: 10px;
    display: block; }
   
  .single-blog-area .single-blog-content h4 a {
    color: #000000;
    font-size: 24px;
    margin-bottom: 50px; }

    .single-blog-area .single-blog-content .locationplace{
     font-size: 17px;
     text-transform: uppercase;
     letter-spacing: 3px;
    }
    
  .single-blog-area .single-blog-content .post-meta p {
    font-size: 9px;
    text-transform: uppercase;
    margin-bottom: 0;
    letter-spacing: 3px;
    display: inline-block; }
  .single-blog-area.blog-style-2 .single-blog-content > p {
    margin-bottom: 40px; }
   .single-blog-area.blog-style-2 .single-blog-content a{
    display: inline-block;
    vertical-align: middle;
   }
   
   .btn-accmodify {
        background-color: rgb(220, 122, 171);
        border-color: rgb(220, 122, 171);
        margin-left: 300px;
    }

    .btn-accdelete {
        background-color: rgb(220, 122, 171);
        border-color: rgb(220, 122, 171);
   
    }
   
   .btn-accmodify:hover {
        border-color: rgb(116, 210, 231);
        background-color: rgb(116, 210, 231);
   }
   .btn-accdelete:hover {
        border-color: rgb(116, 210, 231);
        background-color: rgb(116, 210, 231);
   }


    </style>

<script>
function del(acc_idx){

    if(confirm("정말 삭제하시겠습니까?")==false)return;

    location.href="delete.do?acc_idx=" + acc_idx ;

  }

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

                                <li><a href="#">코스 그리기</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="../../single-post.html">피드</a></li>
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



<!-- 숙소 상세 게시물 시작 -->
<div class="container" >
    <!-- Single Blog Area  -->
    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" style="padding:100px">

        <div class="row align-items-center" style="border: solid 1px  black; margin-bottom: 10px; font-size:0px" >
            <!-- 사진이 들어갈꺼 -->
            <div class="col-12 col-md-4">
                
                
                
                <div class="single-blog-thumbnail" style="text-align: left; border: 1px solid black;">
                    <c:forEach var="photo" items="${ vo.acc_photo_list }">
                        <c:if test="${photo.acc_photo_main==1}">
                            <!-- if 아래 이미지 클릭시 메인 페이지로 반환되도록 -->
                            <img id="main_img" src="images/${photo.acc_photo_name}" alt="" style="width: 300px; height: 300px;">
                        </c:if>
                    </c:forEach>
                      
                </div>
                   
                

                <div>
                    <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slider="sets: true">

                       
                        <ul class="uk-slider-items uk-child-width-1-5 uk-child-width-1-6">
                            <!-- 반복  -->
                        
                        <c:forEach var="photo" items="${vo.acc_photo_list}">
                            <li>
                                <img src="images/${photo.acc_photo_name}" width="100" height="100" alt="" onclick="toggleImg('${photo.acc_photo_name}');">

                                <div class="uk-position-center uk-panel"></div>
                            </li>
                        </c:forEach>
                        
                        <script>
                            function toggleImg(filename) {
                                document.getElementById("main_img").src = "images/" + filename;
                            }
                        </script>

                        </ul>
        
                    </div>
                </div>

            </div>

            <!-- 사진끝 -->

            <!-- 글이 들어가는곳 -->
            <div class="col-12 col-md-8">
                <!-- Blog Content -->
                <div class="single-blog-content" >
                    <!-- <div class="line"></div> -->
                    <a href="#" class="post-tag">${vo.acc_type}</a>
                    <a style="margin-left:400px"><img src="../../img/heart/빈하트.PNG" alt="" style="width: 20px; height:20px;"><img src="../../img/core-img/download.jpg" alt="" style="width: 30px; height:30px;"</a>
                    <h4><a href="#" class="post-headline" >${vo.acc_name}</a></h4>
                    <p class="locationplace" style="margin-left:0px">${vo.acc_location}</p>
                    <p> ${vo.acc_service} </p>
                    <p>${vo.acc_cancel}</p>
                    <div class="post-meta" style="height:10%">
                        <p>By <a href="#">${vo.acc_contact}</a></p>
                    </div>
                    <span>
                     <input class="btn btn-primary btn-accroominsert" id="accroominsertbtn" type="button" value="방 목록 보기" style="margin-left:20px"
                     onclick="location.href='book_room_list.do?acc_idx=${vo.acc_idx}&check_in_date=${param.check_in_date}'" ></span>

                </div>
            </div>
            <!-- 글이 끝나는  -->
            <!-- IF 조건 끝나는 곳  -->
        </div>

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
