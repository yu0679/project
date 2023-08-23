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
    <link rel="stylesheet" href="../../css/join.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- 자바스크립트 부분-->
    <script>


        //ID 중복 체크
        function check_id(){
            //
            var mem_id= $("#mem_id").val();

            var reg_id = /^[a-zA-Z]([0-9|a-z|A-Z]){5,11}$/;


            if(!reg_id.test(mem_id)){
                //   alert("아이디는 영문자, 숫자 8-12 글자로 입력가능합니다.");
                $("#id_message").html("아이디는 영문자, 숫자 조합 6-12 글자로 입력 가능합니다.");
                return;
            }

            //서버: 아이디 중복체크
            $.ajax({

                url : "../member/check_id",         //MemberCheckIdAction
                data: {"mem_id" : mem_id},    //parameter=> check_id.
                dataType : "json",
                success : function(res_data){
                    if(res_data.result==true){

                        $("#id_message").html("사용 가능한 아이디입니다.");

                    }else{

                        $("#id_message").html("이미 사용 중인 아이디입니다.");

                    }
                },
                error : function(err){

                    alert(err.responseText);

                }
            })

        } //end-check_id



        //닉네임 중복 체크
        function check_nickname(){
            //
            var mem_nickname= $("#mem_nickname").val();

            var reg_nickname = /^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,5}$/;

            if(!reg_nickname.test(mem_nickname)){
                $("#nickname_message").html("닉네임은 한글, 영문자, 숫자 조합 2-6 글자로 입력 가능합니다.");
                return;
            }

            $.ajax({

                url : "../member/check_nickname",         //MemberCheckIdAction
                data: {"mem_nickname" : mem_nickname},    //parameter=> check_id.
                dataType : "json",
                success : function(res_data){
                    if(res_data.result==true){

                        $("#nickname_message").html("사용 가능한 닉네임입니다.");

                    }else{

                        $("#nickname_message").html("이미 사용 중인 닉네임입니다.");

                    }
                },
                error : function(err){

                    alert(err.responseText);

                }
            })

        } //end-check_nickname



        //비밀번호 정규식
        function check_pwd(){

            var mem_pwd= $("#mem_pwd").val();
            var reg_pwd=/^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{7,15}$/;


            if(!reg_pwd.test(mem_pwd)){
                $("#pwd_message").html("비밀번호는 영문자, 숫자 및 특수기호 !@#$%^&*-_+=? 포함 8-15 글자입니다.");

                return;
            }

            $("#pwd_message").html("사용 가능한 비밀번호입니다.");

        }

        function check_pwd_check(){
            var mem_pwd= $("#mem_pwd").val();
            var mem_pwd_check=$("#mem_pwd_check").val();

            if(mem_pwd_check!=mem_pwd){
                $("#pwd_check_message").html("비밀번호가 일치하지 않습니다.");

                return;

            }

            $("#pwd_check_message").html("비밀번호가 일치합니다.");

        } //end-pwd


        //이메일 체크
        function check_email(){

            var mem_email = $("#mem_email").val();
            var reg_email = /^[a-zA-Z]{1}[a-zA-Z0-9.\-_]+@[a-z0-9]{1}[a-z0-9\-]+[a-z0-9]{1}\.(([a-z]{1}[a-z.]+[a-z]{1})|([a-z]+))$/

            if(!reg_email.test(mem_email)){
                $("#email_message").html("이메일 형식에 맞지 않습니다.");

                return;
            }
            $("#email_message").html("사용가능한 이메일입니다.");

        }//end - email


        function find_addr(){

            new daum.Postcode({
                oncomplete: function(data) {

                    $("#mem_zipcode").val(data.zonecode);
                    $("#mem_addr1").val(data.address);

                }
            }).open();
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
        <a href="/main"><img src="../../img/core-img/DrawingSSum.png" alt="" style="width: 500px; height: 130px"></a>
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
    <div id="distinguish">
        <span>회원구분</span><span class="star">*</span>
        <span><input type="radio" name="distinguish" value="normal" onclick="location.href='join'">개인회원</span>
        <span><input type="radio" name="distinguish" value="ceo" style="margin-left: 30px" checked>사업자회원</span>
    </div>

    <hr id="hr1">

    <p style="font-weight: bold">기본정보</p>
    <hr class="hr2">


    <form id="information">

        <table width="1500px">

            <tr>
                <td width="150px"><span>아이디</span><span class="star" style="margin-right: 70px">*</span>
                </td>
                <td><input type="text" name="mem_id" id="mem_id" class="input" onkeyup="check_id();">
                    <span id="id_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </tr>

            <tr>
                <td width="150px"><span>닉네임</span><span class="star" style="margin-right: 70px">*</span>
                </td>
                <td><input type="text" name="mem_nickname" id="mem_nickname"class="input" onkeyup="check_nickname();">
                    <span id="nickname_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </tr>


            <tr>
                <td><span>비밀번호</span><span class="star" style="margin-right: 56px">*</span></td>
                <td>
                    <input type="password" name="mem_pwd" id="mem_pwd" class="input" onkeyup="check_pwd()">
                    <span id="pwd_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </tr>


            <tr>
                <td><span>비밀번호 확인</span><span class="star" style="margin-right: 24px">*</span></td>
                <td><input type="password" id="mem_pwd_check" class="input" onkeyup="check_pwd_check()">
                    <span id="pwd_check_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </tr>


            <tr>
                <td><span>이름</span><span class="star" style="margin-right: 84px">*</span></td>
                <td><input type="text" name="mem_name" id="mem_name" class="input"></td>
            </tr>


            <tr>
                <td rowspan="3">
                    <span>주소</span><span class="star" style="margin-right: 84px">*</span></td>
                <td>
                    <input type="text" name="mem_zipcode" id="mem_zipcode" style="width: 57px" readonly class="addr">
                    <input type="button" value="우편번호"
                           onclick="find_addr();"
                           style="width: 59px;background: white; border: 1px solid lightgray; height: 30px; font-size: smaller;">
                </td>
            </tr>


            <tr>
                <td><input type="text" name="mem_addr1" id="mem_addr1" style="width: 220px" readonly class="addr">기본주소</td>
            </tr>
            <tr>
                <td><input type="text" name="mem_addr2" id="mem_addr2" style="width: 220px; margin-bottom: 30px" class="addr">나머지주소
                </td>
            </tr>


            <tr>
                <td width="150px"><span>휴대전화</span><span class="star" style="margin-right: 70px">*</span></td>
                <td>
                    <select name="mem_phone" id="mem_phone" style="font-size: smaller">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    &nbsp;
                    <input type="text" name="mem_phone1" id="mem_phone1" class="input" style="margin-top: 10px; width: 70px"> -
                    <input type="text" name="mem_phone2" id="mem_phone2" class="input" style="margin-top: 10px; width: 70px"></td>
            </tr>


            <tr>
                <td width="150px"><span>이메일</span><span class="star" style="margin-right: 70px">*</span></td>
                <td><input type="email" name="mem_email" id="mem_email" class="input" style="width: 233px"
                onkeyup="check_email()">
                    <span id="email_message" style="font-size: 1px; margin-top: 0"></span>
                </td>
            </tr>
        </table>
        <hr>
        <br>

        <p style="font-weight: bold">추가정보</p>
        <hr class="hr2">
        <span>파트너 ID</span>
        <input type="text" name="mem_partner" id="mem_partner" class="input" style="margin-left: 85px">
        <hr style="margin-top: 0">
        <input type="button" value="가입하기" style="margin-left: 50%; border-color: lightgray;background: white;" class="btn"
        onclick="send(this.form); return false">
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