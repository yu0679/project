<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="../../../css/member/join.css">


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- 자바스크립트 부분-->

    <script type="text/javascript">
        function onlyAlphabet(ele) {
            ele.value = ele.value.replace(/[^\\!-z]/gi, "");
        }


        function ajaxFileUpload() {
            $("#ajaxFile").click();
        }

        function setThumbnail(event) {
            var reader = new FileReader();

            reader.onload = function (event) {


                $("#myimg").attr("src", event.target.result);
            };

            reader.readAsDataURL(event.target.files[0]);
        }
    </script>


    <script>
        var reg_nickname = /^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,5}$/;
        var reg_pwd = /^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{7,15}$/;
        var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        //닉네임 중복 체크
        function check_nickname() {
            //
            var mem_nickname = $("#mem_nickname").val();


            if (!reg_nickname.test(mem_nickname)) {
                $("#nickname_message").html("닉네임은 한글, 영문자, 숫자 조합 2-6 글자로 입력 가능합니다.");
                return;
            }

            $.ajax({

                url: "../member/check_nickname",         //MemberCheckIdAction
                data: {"mem_nickname": mem_nickname},    //parameter=> check_id.
                dataType: "json",
                success: function (res_data) {
                    if (res_data.result == true) {

                        $("#nickname_message").html("사용 가능한 닉네임입니다.");


                    } else {

                        $("#nickname_message").html("이미 사용 중인 닉네임입니다.");

                    }
                },
                error: function (err) {

                    alert(err.responseText);

                }
            })

        } //end-check_nickname


        //파트너 체크
        function search_partner() {
            //
            var mem_partner = $("#mem_partner").val();


            $.ajax({

                url: "../member/search_partner",         //MemberCheckIdAction
                data: {"mem_partner": mem_partner},    //parameter=> check_id.
                dataType: "json",
                success: function (res_data) {

                    console.log(res_data.result);

                    if (res_data.result == "null") {

                        $("#partner_message").html("가입하지 않은 회원입니다.");


                    } else if (res_data.result == "exist") {

                        $("#partner_message").html("이미 파트너가 등록된 회원입니다.");

                    } else if (res_data.result == "confirmed") {
                        $("#partner_message").html("");
                    }
                },
                error: function (err) {

                    alert(err.responseText);

                }
            })

        } //end-search_partner


        //비밀번호 정규식
        function check_pwd() {

            var mem_pwd = $("#mem_pwd").val();


            if (!reg_pwd.test(mem_pwd)) {
                $("#pwd_message").html("비밀번호는 영문자, 숫자 및 특수기호 !@#$%^&*-_+=? 포함 8-15 글자입니다.");

                return;
            }


            $("#pwd_message").html("사용가능한 비밀번호 입니다");


        }

        function check_pwd_check() {
            var mem_pwd = $("#mem_pwd").val();
            var mem_pwd_check = $("#mem_pwd_check").val();

            if (mem_pwd_check != mem_pwd) {
                $("#pwd_check_message").html("비밀번호가 일치하지 않습니다.");
                return;
            }

            $("#pwd_check_message").html("비밀번호가 일치합니다.");

        } //end-pwd


        //이메일 체크
        function check_email() {

            var mem_email = $("#mem_email").val();

            if (!reg_email.test(mem_email)) {
                $("#email_message").html("이메일 형식에 맞지 않습니다.");

                return;
            }
            $("#email_message").html("사용 가능한 이메일입니다.");
        }//end - email


        function find_addr() {

            new daum.Postcode({
                oncomplete: function (data) {

                    $("#mem_zipcode").val(data.zonecode);
                    $("#addr1").val(data.address);

                }
            }).open();
        }


        //가입
        function modify(f) {
            var photo = f.photo.value;


            var mem_root = f.mem_root.value;


            if (mem_root == 'web') {
                var mem_pwd = f.mem_pwd.value.trim();
                var mem_pwd_check = f.mem_pwd_check.value.trim();
                var mem_email = f.mem_email.value.trim();
                var mem_nickname = f.mem_nickname.value.trim();
                var mem_name = f.mem_name.value.trim();
                var mem_zipcode = f.mem_zipcode.value.trim();

                var addr1 = f.addr1.value.trim();
                var addr2 = f.addr2.value.trim();
                var phone2 = f.phone2.value.trim();
                var phone3 = f.phone3.value.trim();
                var mem_zipcode = f.mem_zipcode.value.trim();

                if (mem_pwd == '') {

                    alert('비밀번호를 입력하세요.')
                    f.mem_pwd.value = '';
                    f.mem_pwd.focus();
                    return;
                }

                if (!reg_pwd.test(mem_pwd)) {
                    alert('비밀번호는 영문자, 숫자 및 특수기호 !@#$%^&*-_+=? 포함 8-15 글자입니다.')
                    f.mem_pwd.value = '';
                    f.mem_pwd.focus();
                    return;
                }


                if (mem_pwd_check == '') {

                    alert('비밀번호를 확인하세요.')
                    f.mem_pwd_check.value = '';
                    f.mem_pwd_check.focus();
                    return;
                }

                if (mem_pwd_check != mem_pwd) {

                    alert('비밀번호가 일치하지 않습니다.')
                    f.mem_pwd_check.focus();
                    return;
                }


                if (!reg_email.test(mem_email)) {
                    alert('이메일 형식에 맞지 않습니다.')
                    f.mem_email.value = '';
                    f.mem_email.focus();
                    return;
                }

                if (mem_email == '') {

                    alert('이메일을 입력하세요.')
                    f.mem_email.value = '';
                    f.mem_email.focus();
                    return;
                }


                if (mem_nickname == '') {

                    alert('닉네임을 입력하세요.')
                    f.mem_nickname.value = '';
                    f.mem_nickname.focus();
                    return;
                }

                if (!reg_nickname.test(mem_nickname)) {
                    alert('닉네임은 한글, 영문자, 숫자 조합 2-6 글자로 입력 가능합니다.')
                    f.mem_nickname.value = '';
                    f.mem_nickname.focus();
                    return;
                }


                if (mem_name == '') {

                    alert('이름을 입력하세요.')
                    f.mem_name.value = '';
                    f.mem_name.focus();
                    return;
                }

                if (addr1 == '') {

                    alert('주소를 입력하세요.')
                    f.addr1.value = '';
                    return;
                }

                if (addr2 == '') {

                    alert('상세주소를 입력하세요.')
                    f.addr2.value = '';
                    f.addr2.focus();
                    return;
                }


                if (phone2 == '') {

                    alert('전화번호를 입력하세요.')
                    f.phone2.value = '';
                    f.phone2.focus();
                    return;
                }


                if (phone3 == '') {

                    alert('전화번호 뒷자리를 입력하세요.')
                    f.phone3.value = '';
                    f.phone3.focus();
                    return;
                }

            }


            f.action = "../member/modify";
            f.submit();
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


<!-- 내용 삽입 부분-->

<div id="join">

    <form method="POST" enctype="multipart/form-data">
        <input type="hidden" id="mem_point" name="mem_point" value="${user.mem_point}">
        <input type="hidden" id="mem_idx" name="mem_idx" value="${user.mem_idx}">
        <input type="hidden" id="mem_code" name="mem_code" value="${user.mem_code}">
        <input type="hidden" id="mem_root" name="mem_root" value="${user.mem_root}">
        <p style="font-weight: bold; margin-top: 5%">기본정보</p>
        <hr class="hr2">

        <table width="1500px">

            <tr>
                <td width="150px"><span>사진</span>
                <td>
                    <img src="../../../img/profileimg.jpg" width="100" height="100" id="myimg">
                    <input type="file" id="ajaxFile" name="photo" style="display:none;" onchange="setThumbnail(event);">
                    <div><input class="uk-button uk-button-default uk-button-small" type="button" value="사진 추가"
                                style="width: 59px;background: white; border: 1px solid lightgray; height: 30px; font-size: smaller;
margin-top: 3px; margin-bottom: 3px; margin-left: 20px"
                                onclick="ajaxFileUpload();"></div>
                </td>
            </tr>

            <tr>
                <td width="150px"><span>아이디</span><span class="star" style="margin-right: 70px">*</span>
                </td>

                <c:choose>
                <c:when test="${user.mem_root eq 'web'}">
                <td><input type="text" name="mem_id" id="mem_id" class="input" onkeyup="check_id();"
                           value="${user.mem_id}" readonly>
                    </c:when>

                    <c:when test="${user.mem_root eq 'naver'}">
                <td><input type="text" value="${user.mem_id}" class="input" readonly style="width: 390px">
                </td>
                </c:when>

                <c:when test="${user.mem_root eq 'kakao'}">
                <td><input type="text" name="mem_id" id="mem_id" class="input" onkeyup="check_id();"
                           value="${user.mem_id}" readonly>
                    </c:when>


                    </c:choose>
            </tr>

            <c:choose>
            <c:when test="${user.mem_root eq 'web'}">
                <td width="150px"><span>닉네임</span><span class="star" style="margin-right: 70px">*</span>
                </td>
                <td><input type="text" name="mem_nickname" id="mem_nickname" class="input" onkeyup="check_nickname();"
                           value="${user.mem_nickname}">
                    <span id="nickname_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </c:when>

            <c:when test="${user.mem_root eq 'kakao' || user.mem_root eq 'naver'}">
            <td width="150px"><span>닉네임</span><span class="star" style="margin-right: 70px">*</span>
            <td><input type="text" name="mem_nickname" class="input"
                       value="${user.mem_nickname}" readonly>
                </c:when>

                </c:choose>


                <c:choose>
                <c:when test="${user.mem_root eq 'web'}">
                <tr>
            <td><span>비밀번호</span><span class="star" style="margin-right: 56px">*</span></td>
            <td>
                <input type="password" id="mem_pwd" name="mem_pwd" class="input" onkeyup="check_pwd()"
                       onkeydown="onlyAlphabet(this)">
                <span id="pwd_message" style="font-size: 1px; margin-top: 0"></span>
            </td>
            </tr>

            <tr>
                <td><span>비밀번호 확인</span><span class="star" style="margin-right: 24px">*</span></td>
                <td><input type="password" id="mem_pwd_check" name="mem_pwd_check" class="input"
                           onkeyup="check_pwd_check()" onkeydown="onlyAlphabet(this)">
                    <span id="pwd_check_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </tr>
            </c:when>

            <c:otherwise>
            </c:otherwise>

            </c:choose>

            <c:choose>
                <c:when test="${user.mem_root eq 'web'}">
                    <tr>
                        <td><span>이름</span><span class="star" style="margin-right: 84px">*</span></td>
                        <td><input type="text" name="mem_name" id="mem_name" class="input" value="${user.mem_name}">
                        </td>
                    </tr>
                </c:when>

                <c:when test="${user.mem_root eq 'kakao' || user.mem_root eq 'naver'}">
                    <tr>
                        <td><span>이름</span><span class="star" style="margin-right: 84px">*</span></td>
                        <td><input type="text" name="mem_name" class="input" value="${user.mem_name}" readonly></td>
                    </tr>
                </c:when>

            </c:choose>

            <c:choose>
                <c:when test="${user.mem_root eq 'web'}">
                    <tr>
                        <td rowspan="3">
                            <span>주소</span><span class="star" style="margin-right: 84px">*</span></td>
                        <td>
                            <input type="text" name="mem_zipcode" id="mem_zipcode" style="width: 57px" readonly class="addr"
                            <c:choose>
                            <c:when test="${user.mem_zipcode eq 0}">
                                   value=""
                            </c:when>

                            <c:otherwise>
                                   value=${user.mem_zipcode}>
                            </c:otherwise>
                            </c:choose>


                            <input type="button" value="우편번호"
                                   onclick="find_addr()"
                                   style="width: 59px;background: white; border: 1px solid lightgray; height: 30px; font-size: smaller;">
                        </td>
                    </tr>

                    <c:set var="addr" value="${user.mem_addr}"/>
                    <tr>
                        <td><input type="text" name="mem_addr" id="addr1" style="width: 220px" readonly class="addr"
                                   value="${fn:substringBefore(addr, ",")}"
                        >기본주소
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="mem_addr" id="addr2" style="width: 220px; margin-bottom: 30px"
                                   value="${fn:substringAfter(addr, ",")}"
                                   class="addr">나머지주소
                        </td>

                    </tr>
                </c:when>


                <c:otherwise>
                    <tr>
                        <td rowspan="3">
                            <span>주소</span><span class="star" style="margin-right: 84px">*</span></td>
                        <td>
                            <input type="text" style="width: 57px" readonly class="addr"
                            <c:choose>
                            <c:when test="${user.mem_zipcode eq 0}">
                                   value=""
                            </c:when>

                            <c:otherwise>
                                   value=${user.mem_zipcode}>
                            </c:otherwise>
                            </c:choose>


                        </td>
                    </tr>

                    <c:set var="addr" value="${user.mem_addr}"/>
                    <tr>
                        <td><input type="text" name="mem_addr" style="width: 220px" readonly class="addr"
                                   value="${fn:substringBefore(addr, ",")}">기본주소
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="mem_addr" style="width: 220px; margin-bottom: 30px"
                                   value="${fn:substringAfter(addr, ",")}"
                                   class="addr" readonly>나머지주소
                        </td>

                    </tr>
                </c:otherwise>

            </c:choose>


            <tr>
                <td width="150px"><span>휴대전화</span><span class="star" style="margin-right: 70px">*</span></td>
                <td>
                    <c:set var="phone" value="${user.mem_phone}"/>

                    <select name="mem_phone" style="font-size: smaller">

                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    &nbsp;
                    <input type="text" name="mem_phone" id="phone2" class="input" style="margin-top: 10px; width: 70px"
                           value="${fn:substring(phone,4,8)}"> -
                    <input type="text" name="mem_phone" id="phone3" class="input" style="margin-top: 10px; width: 70px"
                           value="${fn:substring(phone,9,13)}">
                </td>

            </tr>

            <c:choose>
                <c:when test="${user.mem_root eq 'web' }">
                    <tr>
                        <td width="150px"><span>이메일</span><span class="star" style="margin-right: 70px">*</span></td>


                        <td><input type="email" name="mem_email" id="mem_email" class="input" style="width: 233px"
                                   value="${user.mem_email}" onkeyup="check_email()">
                            <span id="email_message" style="font-size: 1px; margin-top: 0"></span>
                        </td>

                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td width="150px"><span>이메일</span><span class="star" style="margin-right: 70px">*</span></td>


                        <td><input type="email" name="mem_email" class="input" style="width: 233px"
                                   value="${user.mem_email}" readonly>
                        </td>

                    </tr>
                </c:otherwise>
            </c:choose>

        </table>
        <hr>
        <br>

        <p style="font-weight: bold">추가정보</p>
        <hr class="hr2">
        <td><span>파트너 ID</span></td>

        <c:choose>
            <c:when test="${user.mem_partner != null}">
        <td>
            <input type="text" class="input" style="margin-left: 85px"
                    value="${user.mem_partner}" readonly>
        </td>
            </c:when>

            <c:otherwise>
                <td><input type="text" name="mem_partner" id="mem_partner" class="input" style="margin-left: 85px"
                           onkeyup="search_partner()">
                    <span class="partner_message" id ="partner_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </c:otherwise>
        </c:choose>


        <hr style="margin-top: 0">

        <input type="button" value="수정하기" style="margin-left: 50%; border-color: lightgray;background: white;"
               class="btn" onclick="modify(this.form);">
    </form>

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