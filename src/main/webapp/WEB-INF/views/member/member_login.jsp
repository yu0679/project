<%@ page import="java.math.BigInteger" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="../../../js/jquery/jquery-2.2.4.min.js"></script>
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>드로잉썸(Drawing SSum)</title>

    <!-- Favicon -->
    <link rel="icon" href="../../../img/core-img/favicon.jpg">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../../css/style.css">
    <link rel="stylesheet" href="../../../css/member/login.css">

    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
            integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
    <script>
        Kakao.init('f0a0fa73034e605a4aa9ffee7fe16d05'); // 사용하려는 앱의 JavaScript 키 입력

        function loginWithKakao() {
            Kakao.Auth.authorize({
                redirectUri: 'http://192.168.0.28:9090/auth/kakao/callback',
            });
        }

    </script>

    <script>


        //비밀번호 칸에 영문만 입력 가능하도록 설정
        function onlyAlphabet(ele) {
            ele.value = ele.value.replace(/[^\\!-z]/gi, "");
        }

        function login(f) {

            let mem_id = f.mem_id.value.trim();
            let mem_pwd = f.mem_pwd.value.trim();


            if (mem_id == '') {
                alert('아이디를 입력하세요.');
                f.mem_id.value = '';
                f.mem_id.focus();
                return;
            }

            if (mem_pwd == '') {

                alert('비밀번호를 입력하세요.');
                f.mem_pwd.value = '';
                f.mem_pwd.focus();
                return;
            }

            //전송
            f.action = "login.do";
            f.submit();
        }


    </script>


    <script type="text/javascript">
        //jQuery초기화 이벤트
        $(document).ready(function () {

            // 0.1초후에 호출 : 로그인폼 show된후에 호출
            setTimeout(show_message, 100);
            //show_message();

        });

        function show_message() {
            if ("${ param.reason eq 'wrong_id' }" == "true" || "${ param.reason eq 'wrong_pwd' }" == "true") {
                alert('일치하는 회원 정보가 없습니다.');
            }

            if ("${ param.reason eq 'checking' }" == "true") {
                alert('회원가입 심사가 진행중입니다.');
            }

            if ("${ param.reason eq 'withdrawal' }" == "true") {
                alert('탈퇴한 회원입니다.');
            }

            //login_form.do?reason=fail_session_timeout
            if ("${ param.reason eq 'fail_session_timeout' }" == "true") {
                alert('로그아웃 되었습니다.\n로그인 후 이용해 주세요.');
            }

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
        <a href="/main"><img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 500px; height: 130px"></a>
    </div>

    <!-- Navbar Area -->
    <div class="bueno-main-menu" id="sticker">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="buenoNav">

                    <!-- 좌측 Toggler 버튼 -->
                    <div id="toggler" style="right: -1200px"><img src="../../../img/core-img/toggler.png" alt=""></div>

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
                            <div class="login-area">
                                <a href="/member/login">Login / Register</a>
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
    <a href="/mypage/mypage">내 정보</a>

</div>
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->


<div id="loginForm">
    <div class="container" id="container">
        <div class="form-container sign-in-container">

            <form id="formm" method="POST" enctype="multipart/form-data">
                <h1 class="hh" style="color: black">Sign in</h1>
                <div class="social-container">
                    <%
                        String clientId = "2hoie656b8eIovgqA1i_";//애플리케이션 클라이언트 아이디값";
                        String redirectURI = URLEncoder.encode("http://192.168.0.28:9090/auth/naver/callback", "UTF-8");
                        SecureRandom random = new SecureRandom();
                        String state = new BigInteger(130, random).toString();
                        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
                        apiURL += "&client_id=" + clientId;
                        apiURL += "&redirect_uri=" + redirectURI;
                        apiURL += "&state=" + state;
                        session.setAttribute("state", state);
                    %>
                    <span><img src="http://static.nid.naver.com/oauth/small_g_in.PNG" id="naver_id_login" style="width: 60px; height: 30px"
                    onclick="location.href='<%=apiURL%>'"></span>
                    <span><img src="../../../img/core-img/kakao_login_small.png" id="kakao-login-btn" onclick="javascript:loginWithKakao()"></span>



                </div>
                <span style="color: dimgray">or use your account</span>
                <input type="text" name="mem_id" id="mem_id" placeholder="아이디를 입력하세요." class="iii"/>
                <input type="password" name="mem_pwd" id="mem_pwd" placeholder="비밀번호를 입력하세요." class="iii"
                       onkeydown="onlyAlphabet(this)"/>
                <a href="/member/find_idPwd" class="aa" style="color: dimgray">아이디나 비밀번호를 잊으셨나요?</a>
                <button onclick="login(this.form)">로그인</button>
            </form>

        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right">
                    <h5 style="margin-bottom: 0; color: white;">함께 그리는 Something!</h5>
                    <h1 class="hh">Drawing SSUM</h1>
                    <p class="pp" style="font-weight: bold ">지금 바로 회원가입하시고<br>다양한 혜택을 누리세요!</p>
                    <button class="ghost" id="signUp" onclick="location.href='/member/join'">회원가입</button>
                </div>
            </div>
        </div>
    </div>
</div>


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
<script src="../../../js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="../../../js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="../../../js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="../../../js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="../../../js/active.js"></script>


</body>

</html>