<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  


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

                                <li><a href="../feed/my_feed.do">내 피드</a></li>

                                <li><a href="#">국내</a></li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="/feed/feed.do">피드</a></li>
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
    <a href="/feed/my_feed.do">내 피드</a>
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

<div id="insert_outline_p" style=" overflow: auto;">
 
        <div id="feed_insert_tag">
           <br>
                    <label style="margin-left: 190px;">
                        <input role="switch" id="theme_date" name="t_name" type="radio" value="데이트" onclick="location.href='feed.do?t_name=데이트'" />#데이트
                    
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    
                    <label>
                        <input role="switch" id="theme_local_food" name="t_name" type="radio" value="맛집" onclick="location.href='feed.do?t_name=맛집'"/>#맛집
                    
                    </label>
                    &nbsp; &nbsp; &nbsp;

                    <label>
                        <input role="switch" id="theme_heeling" name="t_name" type="radio" value="#힐링"onclick="location.href='feed.do?t_name=힐링'"/>#힐링
                        
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    
                    <label>
                        <input role="switch" id="theme_memory" name="t_name" type="radio" value="#추억" onclick="location.href='feed.do?t_name=추억'">#추억
                    
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    <label>
                        <input role="switch" id="theme_family" name="t_name" type="radio" value="#가족" onclick="location.href='feed.do?t_name=가족'"/>#가족
                        
                    </label>
                    &nbsp; &nbsp; &nbsp;
                    
                    <label>
                        <input role="switch"  id="theme_anniversary" name="t_name" type="radio" value="#기념일" onclick="location.href='feed.do?t_name=기념일'"/>#기념일
                    
                    </label>
                           

        </div> 
        <hr>
       

    <!-- Data가 없는경우 -->
    <c:if test="${ empty t_name_list }">
        <tr>
            <td colspan="5" align="center" style="font-size: 20px; margin-left: 100px;">
                <font color="red" style="font-size: 30px; margin-left: 450px;">#태그를 클릭해 주세요</font>
            </td>                      
        </tr>
    </c:if> 



    <c:forEach var="vo" items="${t_name_list}">
    
        <div id="list_box_feed">
            <a href="../board/my_feed_b_idx_look.do?b_idx=${vo.b_idx}" >
                <!-- list_box_subject를 list_box 안으로 이동 -->
                <div class="list_box_subject" style="width: 1000px;">
                    <br>
                    <div style="font-size: 20px; margin-left: 20px;">제목</div>
                    <div style="margin-top: 10px; margin-left: 10px;">${vo.b_subject}</div><br>
                    <hr>
                    <div style="margin-top: 10px; margin-left: 20px;">${vo.t_name}</div><br><hr>
                    <span style="margin-left: 20px;">${vo.b_start.substring(0,10)}</span>~<span style="">${vo.b_end.substring(0,10)}</span><br><hr>
            
                    <textarea style="width: 900px; height: auto; margin-left: 50px; border: 2px solid #F7CAC9; resize: none;">${vo.b_content}</textarea>
                </div>
            </a>
            </div>

            <br> 
    </c:forEach>
    
     
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
                        <li><a href="/main">Home</a></li>
                        <li><a href="../feed/my_feed.do">내 피드</a></li>
                        <li><a href="#">국내</a></li>
                        <li><a href="#">해외</a></li>
                        <li><a href="feed/feed.do">피드</a></li>
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