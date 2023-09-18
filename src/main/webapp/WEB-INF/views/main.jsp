<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<script>

function feed_insert(){

    if(confirm("내 피드는 로그인 후 이용가능 합니다.")==false)return;

    location.href="../feed/my_feed.do";
}

</script>

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

                                <li><a href="#" onclick="feed_insert();">내 피드</a></li>
                                <!-- <li><a href="#" onclick="feed_insert();">내 피드</a></li> -->

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


    <div class="treading-post-area" id="treadingPost">
        <div class="close-icon">
            <i class="fa fa-times"></i>
        </div>
        <c:if test="${not empty sessionScope.user}">
        <h4>${user.mem_name} 님 / 보유 포인트 : ${user.mem_point}p</h4>
        </c:if>
        <hr>

        <br>
        <a href="../feed/my_feed">내 피드</a>
        <br>
        <br>
        <br>
        <a href="#">내 예약</a><br>
        <br>
        <br>
        <a href="#">내 쿠폰</a><br>
        <br>
        <br>
        <a href="mypage/mypage">내 정보</a>

    </div>


<!-- toggle 클릭시 마이페이지/관리자 창 -->

<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->

<!-- 처음 슬라이드 -->
<div class="hero-area">
    <!-- Hero Post Slides -->
    <div class="hero-post-slides owl-carousel">
        <!-- Single Slide -->
        <div class="single-slide">

            <!-- 슬라이드 1 -->
            <div class="blog-thumbnail">
                <a href="#"><img src="../../img/bg-img/1.jpg" alt=""></a>
            </div>

            <!-- 슬라이드1 내용 -->
            <div class="blog-content-bg">
                <div class="blog-content">
                    <a href="#" class="post-tag">소제목</a>
                    <a href="#" class="post-title">제목</a>
                    <div class="post-meta">
                        <a href="#" class="post-date">날짜</a>
                        <a href="#" class="post-author">글쓴이</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 슬라이드2 -->
        <div class="single-slide">
            <!-- Blog Thumbnail -->
            <div class="blog-thumbnail">
                <a href="#"><img src="../../img/bg-img/2.jpg" alt=""></a>
            </div>

            <!-- 슬라이드2 내용 -->
            <div class="blog-content-bg">
                <div class="blog-content">
                    <a href="#" class="post-tag">소제목</a>
                    <a href="#" class="post-title">제목</a>
                    <div class="post-meta">
                        <a href="#" class="post-date">날짜</a>
                        <a href="#" class="post-author">글쓴이</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 슬라이드3 -->
        <div class="single-slide">
            <!-- Blog Thumbnail -->
            <div class="blog-thumbnail">
                <a href="#"><img src="../../img/bg-img/3.jpg" alt=""></a>
            </div>

            <!-- 슬라이드3 내용 -->
            <div class="blog-content-bg">
                <div class="blog-content">
                    <a href="#" class="post-tag">소제목</a>
                    <a href="#" class="post-title">제목</a>
                    <div class="post-meta">
                        <a href="#" class="post-date">날짜</a>
                        <a href="#" class="post-author">글쓴이</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 슬라이드4 -->
        <div class="single-slide">
            <!-- Blog Thumbnail -->
            <div class="blog-thumbnail">
                <a href="#"><img src="../../img/bg-img/3.jpg" alt=""></a>
            </div>

            <!-- 슬라이드4 내용 -->
            <div class="blog-content-bg">
                <div class="blog-content">
                    <a href="#" class="post-tag">소제목</a>
                    <a href="#" class="post-title">제목</a>
                    <div class="post-meta">
                        <a href="#" class="post-date">날짜</a>
                        <a href="#" class="post-author">글쓴이</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<br>
<br>
<br>


<!-- 추천 여행기 -->
<div class="big-posts-area mb-50">
    <div class="container">
        <!-- Single Big Post Area -->
        <div class="row align-items-center">
            <div class="col-12 col-md-6">
                <div class="big-post-thumbnail mb-50">
                    <img src="../../img/bg-img/7.jpg" alt="">
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="big-post-content text-center mb-50">
                    <a href="#" class="post-tag">소제목</a>
                    <a href="#" class="post-title">제목</a>
                    <div class="post-meta">
                        <a href="#" class="post-date">날짜</a>
                        <a href="#" class="post-author">글쓴이</a>
                    </div>
                    <p>내용</p>
                    <a href="#" class="btn bueno-btn">Read More</a>
                </div>
            </div>
        </div>

        <!-- Single Big Post Area -->
        <div class="row align-items-center">
            <div class="col-12 col-md-6">
                <div class="big-post-content text-center mb-50">
                    <a href="#" class="post-tag">소제목</a>
                    <a href="#" class="post-title">제목</a>
                    <div class="post-meta">
                        <a href="#" class="post-date">날짜</a>
                        <a href="#" class="post-author">글쓴이</a>
                    </div>
                    <p>내용</p>
                    <a href="#" class="btn bueno-btn">Read More</a>
                </div>
            </div>
            <div class="col-12 col-md-6">
                <div class="big-post-thumbnail mb-50">
                    <img src="../../img/bg-img/8.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 추천 여행기 끝 -->

<!-- 인기 게시물 -->
<div class="bueno-post-area mb-70">
    <div class="container">
        <div class="row justify-content-center">
            <!-- Post Area -->
            <div class="col-12 col-lg-8 col-xl-9">
                <!-- Single Blog Post -->
                <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                    <!-- Blog Thumbnail -->
                    <div class="blog-thumbnail">
                        <img src="../../img/bg-img/9.jpg" alt="">
                    </div>
                    <!-- Blog Content -->
                    <div class="blog-content">
                        <a href="#" class="post-tag">소제목</a>
                        <a href="#" class="post-title">제목</a>
                        <div class="post-meta">
                            <a href="#" class="post-date">날짜</a>
                            <a href="#" class="post-author">글쓴이</a>
                        </div>
                        <p>내용</p>
                        <a href="#" class="btn bueno-btn">Read More</a>
                    </div>
                </div>

                <!-- Single Blog Post -->
                <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                    <!-- Blog Thumbnail -->
                    <div class="blog-thumbnail">
                        <img src="../../img/bg-img/10.jpg" alt="">
                    </div>
                    <!-- Blog Content -->
                    <div class="blog-content">
                        <a href="#" class="post-tag">소제목</a>
                        <a href="#" class="post-title">제목</a>
                        <div class="post-meta">
                            <a href="#" class="post-date">날짜</a>
                            <a href="#" class="post-author">글쓴이</a>
                        </div>
                        <p>내용</p>
                        <a href="#" class="btn bueno-btn">Read More</a>
                    </div>
                </div>

                <!-- Single Blog Post -->
                <div class="single-blog-post style-1 d-flex flex-wrap mb-30">
                    <!-- Blog Thumbnail -->
                    <div class="blog-thumbnail">
                        <img src="../../img/bg-img/11.jpg" alt="">
                    </div>
                    <!-- Blog Content -->
                    <div class="blog-content">
                        <a href="#" class="post-tag">소제목</a>
                        <a href="#" class="post-title">제목</a>
                        <div class="post-meta">
                            <a href="#" class="post-date">날짜</a>
                            <a href="#" class="post-author">글쓴이</a>
                        </div>
                        <p>내용</p>
                        <a href="#" class="btn bueno-btn">Read More</a>
                    </div>
                </div>
            </div>


            <!-- 하단 사진 모음 -->
            <div class="instagram-feed-area d-flex flex-wrap">
                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta1.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta1.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta2.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta2.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta3.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta3.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta4.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta4.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta5.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta5.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta6.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta6.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta7.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta7.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta8.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta8.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta9.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta9.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>

                <!-- Single Instagram -->
                <div class="single-instagram">
                    <img src="../../img/bg-img/insta10.jpg" alt="">
                    <!-- Image Zoom -->
                    <a href="../../img/bg-img/insta10.jpg" class="img-zoom" title="Instagram Image">+</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 사진 모음 끝-->

<!-- 하단 복사 붙여넣기 필요-->
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
                        <li><a href="#" onclick="feed_insert();">코스 그리기</a></li>
                        <li><a href="#">국내</a></li>
                        <li><a href="#">해외</a></li>
                        <li><a href="../feed/feed.do">피드</a></li>
                        <li><a href="cs?category_num=c001">고객센터</a>
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