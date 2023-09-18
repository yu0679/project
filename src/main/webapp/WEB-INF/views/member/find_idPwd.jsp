<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<script src="../../js/jquery/jquery-2.2.4.min.js"></script>

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
    <link rel="stylesheet" href="../../../css/member/find_id.css">


    <script>

        var chooseIdPwd = 'id';
        var choosephoneMail = 'phone';

        function findId() {
            chooseIdPwd = 'id';
            document.getElementById('findId').style.borderBottom = "2px solid #92A8D1";
            document.getElementById('findPwd').style.borderBottom = "1px solid lightgray";
            document.getElementById('idpwd').innerHTML = '아이디 ';
            document.getElementById('mem_id').innerHTML = '';


        }

        function findPwd() {

            chooseIdPwd = 'pwd';

            let idHtml = '<div style="margin-left: 34%; margin-bottom: 10px">' +
                '<input type="text" id="mem_id" class="input3" placeholder="아이디">' +
                '</div>';


            document.getElementById('findId').style.borderBottom = "1px solid lightgray";
            document.getElementById('findPwd').style.borderBottom = "2px solid #92A8D1";
            document.getElementById('idpwd').innerHTML = '비밀번호 ';

            document.getElementById('mem_id').innerHTML = idHtml;


        }

        function phone() {
            choosephoneMail = 'phone';

            let phoneHtml = '<div style="margin-left: 34%; margin-bottom: 10px">' +
                '<input type="text" id="mem_phone" name="mem_phone" class="input3" placeholder="휴대폰번호">' +
                '</div>'
            document.getElementById('phone').style.border = '2px solid gray';
            document.getElementById('phone').style.fontWeight = 'bold';
            document.getElementById('phone').style.background = 'white';
            document.getElementById('phone').style.color = 'black';
            document.getElementById('phone').value = "✓ 휴대폰번호";
            document.getElementById('phoneParents').innerHTML = phoneHtml;

            document.getElementById('email').style.background = '#f1f3f5';
            document.getElementById('email').style.border = '0px';
            document.getElementById('email').style.fontWeight = 'bold';
            document.getElementById('email').value = "이메일";
            document.getElementById('email').style.width = '280px';
            document.getElementById('email').style.color = 'dimgray';
            document.getElementById('mem_email').innerHTML = '';
        }


        function email() {
            choosephoneMail = 'email';
            let mailHtml = '<div style="margin-left: 34%; margin-bottom: 10px">' +
                '<input type="text" id="mem_email" name="mem_email" class="input3" placeholder="이메일주소">' +
                '</div>'

            document.getElementById('email').style.border = '2px solid gray';
            document.getElementById('email').style.fontWeight = 'bold';
            document.getElementById('email').style.background = 'white';
            document.getElementById('email').style.color = 'black';
            document.getElementById('email').style.width = '280px';
            document.getElementById('email').value = "✓ 이메일";
            document.getElementById('mem_email').innerHTML = mailHtml;


            document.getElementById('phone').style.background = '#f1f3f5';
            document.getElementById('phone').style.border = '0px';
            document.getElementById('phone').style.fontWeight = 'bold';
            document.getElementById('phone').style.width = '285px';
            document.getElementById('phone').style.color = 'dimgray';
            document.getElementById('phone').value = "휴대폰번호";
            document.getElementById('mem_phone').remove();

        }

    </script>


    <script type="text/javascript">
        function inNumber() {
            if (event.keyCode < 48 || event.keyCode > 57) {
                event.returnValue = false;
            }
        }


        function moveToLoginForm() {
            location.href = '/member/login';
        }

        function send(f) {
            let mem_name = f.mem_name.value.trim();

            //휴대폰번호로 아이디찾기
            if (chooseIdPwd == 'id' && choosephoneMail == 'phone') {
                let mem_phone = f.mem_phone.value.trim();

                if (mem_name == '') {

                    alert('이름을 입력하세요.');
                    f.mem_name.value = '';
                    f.mem_name.focus();
                    return;
                }

                if (mem_phone == '') {

                    alert('휴대폰 번호를 입력하세요.');
                    f.mem_phone.value = '';
                    f.mem_phone.focus();
                    return;
                }

                $.ajax({
                    type: "post",
                    url: '/member/searchIdByPhone',
                    data: {"mem_name": mem_name, "mem_phone": mem_phone},
                    dataType: "json",
                    success: function (resdata) {
                        document.getElementById("chooseTable").remove();
                        document.getElementById("insertForm").remove();
                        document.getElementById("result").innerHTML =
                            '<div style="margin-bottom: 1%">' +
                            '<span style="margin-left: 42%; font-weight: bold; color: #92A8D1">' +
                            resdata.resName + '</span><span>님이 가입하신 아이디는 다음과 같습니다.</span></div>' +
                            '<h6 style="margin-left: 47%; font-weight: bold; color: #92A8D1">' + resdata.resId + '</h6>' +
                            '<p style="margin-left: 43%; margin-bottom: 3%">가입일시 : ' + resdata.resRegidate +
                            '<div style="margin-left: 34%; margin-bottom: 1%">' +
                            '<input type="button" class="confirm" value="로그인하기" onclick="moveToLoginForm()">';

                    },
                    error: function () {
                        alert('일치하는 정보가 없습니다.');
                        f.mem_name.value = '';
                        f.mem_phone.value = '';
                        return;
                    }
                });

                //이메일 주소로 아이디 찾기
            } else if (chooseIdPwd == 'id' && choosephoneMail == 'email') {

                let mem_email = f.mem_email.value.trim();

                if (mem_name == '') {

                    alert('이름을 입력하세요.');
                    f.mem_name.value = '';
                    f.mem_name.focus();
                    return;
                }

                if (mem_email == '') {

                    alert('메일 주소를 입력하세요.');
                    f.mem_email.value = '';
                    f.mem_email.focus();
                    return;
                }


                $.ajax({
                    type: "post",
                    url: '/member/searchIdByEmail',
                    data: {"mem_name": mem_name, "mem_email": mem_email},
                    dataType: "json",
                    success: function (resdata) {
                        document.getElementById("chooseTable").remove();
                        document.getElementById("insertForm").remove();

                        document.getElementById("result").innerHTML =
                            '<div style="margin-bottom: 1%">' +
                            '<span style="margin-left: 42%; font-weight: bold; color: #92A8D1">' +
                            resdata.resName + '</span><span>님이 가입하신 아이디는 다음과 같습니다.</span></div>' +
                            '<h6 style="margin-left: 47%; font-weight: bold; color: #92A8D1">' + resdata.resId + '</h6>' +
                            '<p style="margin-left: 43%; margin-bottom: 3%">가입일시 : ' + resdata.resRegidate +
                            '<div style="margin-left: 34%; margin-bottom: 1%">' +
                            '<input type="button" class="confirm" value="로그인하기" onclick="moveToLoginForm()">';

                    },
                    error: function () {
                        alert('일치하는 정보가 없습니다.');
                        f.mem_name.value = '';
                        f.mem_email.value = '';
                        return;
                    }
                });


                //휴대폰 번호로 비밀번호 찾기
            } else if (chooseIdPwd == 'pwd' && choosephoneMail == 'phone') {

                let mem_id = f.mem_id.value.trim();
                let mem_phone = f.mem_phone.value.trim();


                if (mem_name == '') {

                    alert('이름을 입력하세요.');
                    f.mem_name.value = '';
                    f.mem_name.focus();
                    return;
                }

                if (mem_id == '') {

                    alert('아이디를 입력하세요.');
                    f.mem_id.value = '';
                    f.mem_id.focus();
                    return;
                }

                if (mem_phone == '') {

                    alert('휴대폰 번호를 입력하세요.');
                    f.mem_phone.value = '';
                    f.mem_phone.focus();
                    return;
                }


                $.ajax({
                    type: "post",
                    url: '/member/searchPwdByPhone',
                    data: {"mem_name": mem_name, "mem_phone": mem_phone, "mem_id":mem_id},
                    dataType: "json",
                    success: function (resdata) {
                        document.getElementById("chooseTable").remove();
                        document.getElementById("insertForm").remove();

                        document.getElementById("result").innerHTML =
                            '<div style="margin-bottom: 1%">' +
                            '<span style="margin-left: 45%; font-weight: bold; color: #92A8D1">' +
                            resdata.resName + '<span style="font-weight: normal; color: dimgray">님의</span>' +
                            '<span style="font-weight: bold; color: dimgray">'+ resdata.resPhone+'</span>'+'<span style="font-weight: normal;color: dimgray">으로</span><br>' +
                            '<span style="margin-left: 45%; font-weight: normal; color: dimgray">임시번호를 발급해 드렸습니다.</span>' +
                            '<div style="margin-left: 34%; margin-bottom: 1%; margin-top: 2%">' +
                            '<input type="button" class="confirm" value="로그인하기" onclick="moveToLoginForm()"></div>';

                    },
                    error: function (err) {
                        alert(err.responseText)
                        // alert('일치하는 정보가 없습니다.');
                        // f.mem_name.value = '';
                        // f.mem_id.value = '';
                        // f.mem_email.value = '';
                        // return;
                    }
                });




                //이메일 주소로 비밀번호 찾기
            } else if (chooseIdPwd == 'pwd' && choosephoneMail == 'email') {
                let mem_id = f.mem_id.value.trim();
                let mem_email = f.mem_email.value.trim();

                if (mem_name == '') {

                    alert('이름을 입력하세요.');
                    f.mem_name.value = '';
                    f.mem_name.focus();
                    return;
                }

                if (mem_id == '') {

                    alert('아이디를 입력하세요.');
                    f.mem_id.value = '';
                    f.mem_id.focus();
                    return;
                }

                if (mem_email == '') {

                    alert('메일 주소를 입력하세요.');
                    f.mem_email.value = '';
                    f.mem_email.focus();
                    return;
                }



                $.ajax({
                    type: "post",
                    url: '/member/searchPwdByEmail',
                    data: {"mem_name": mem_name, "mem_email": mem_email, "mem_id":mem_id},
                    dataType: "json",
                    success: function (resdata) {
                        document.getElementById("chooseTable").remove();
                        document.getElementById("insertForm").remove();

                        document.getElementById("result").innerHTML =
                            '<div style="margin-bottom: 1%">' +
                            '<span style="margin-left: 42%; font-weight: bold; color: #92A8D1">' +
                            resdata.resName + '<span style="font-weight: normal; color: dimgray">님의</span>' +
                            '<span style="font-weight: bold; color: dimgray">'+ resdata.resEmail+'</span>'+'<span style="font-weight: normal;color: dimgray">으로</span><br>' +
                            '<span style="margin-left: 45%; font-weight: normal; color: dimgray">임시번호를 발급해 드렸습니다.</span>' +
                            '<div style="margin-left: 34%; margin-bottom: 1%; margin-top: 2%">' +
                            '<input type="button" class="confirm" value="로그인하기" onclick="moveToLoginForm()"></div>';

                    },
                    error: function () {
                        alert('일치하는 정보가 없습니다.');
                        f.mem_name.value = '';
                        f.mem_id.value = '';
                        f.mem_email.value = '';
                        return;
                    }
                });




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


<div style="margin-top: 5%; margin-bottom: 2%; margin-right: 5%">
    <span id="idpwd">아이디 </span><span
        style="font-size: large;font-weight: bold">찾기</span>
</div>

<div id="chooseTable">
    <table style="margin-left: 34%; margin-bottom: 30px">
        <tr>
            <td><input type="button" id="findId" class="input1" value="아이디 찾기" onclick="findId()"></td>
            <td><input type="button" id="findPwd" class="input1" value="비밀번호 찾기" onclick="findPwd()"></td>
        </tr>
    </table>


    <table style="margin-left: 34%; margin-bottom: 10px">
        <tr>
            <td><input type="button" class="input2" id="phone" value="✓ 휴대폰번호" onclick="phone()"></td>
            <td><input type="button" class="input2" id="email" value="이메일" onclick="email()"></td>
        </tr>
    </table>
</div>

<div id="result"></div>


<form method="post" enctype="multipart/form-data" id="insertForm">
    <div>
        <div style="margin-left: 34%; margin-bottom: 10px">
            <input type="text" id="mem_name" name="mem_name" class="input3" placeholder="이름">
        </div>

        <div id="mem_id"></div>

        <div id="phoneParents">
            <div style="margin-left: 34%; margin-bottom: 10px">
                <input type="number" id="mem_phone" name="mem_phone" class="input3" placeholder="휴대폰번호"
                       onkeypress="inNumber();">
            </div>
        </div>

        <div id="mem_email"></div>

        <div style="margin-left: 34%; margin-bottom: 10px">
            <input type="button" class="confirm" value="확인" onclick="send(this.form);">
        </div>
    </div>
</form>


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