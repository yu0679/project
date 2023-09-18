<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.11/clipboard.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!DOCTYPE html>
<html lang="en">


<script>
    $(function(){
        var clipboard = new ClipboardJS('#copy_text');

        clipboard.on('success', function(e) {
            console.info('Text:', e.text);
            alert("초대 코드가 복사되었습니다. \nCtrl + v 를 눌러서 붙여넣기 하세요.");
        });

        clipboard.on('error', function(e) {
            alert("Ctrl + C 를 눌러서 복사해 주세요.");
        });
    });
</script>



<script>
    function mypage_modify_popup(p_idx) {

        global_p_idx = p_idx;

        var window_width = $(window).width();   //browser폭
        var popup_width = $("#popup").width(); //popup폭
        //alert(window_width + " / " + popup_width );


        //팝업윈도우가 중앙에 올수 있도록 left위치 계산
        var left = window_width / 2 - popup_width / 2;
        $("#popup").css("left", left);
        $("#popup").show();


        //alert(p_idx+"에 대한 자료를 Ajax통해서 요청");

        $.ajax({
            url: "photo_one.do",      //PhotoOneAction
            data: {"p_idx": p_idx},
            dataType: "json",
            success: function (res_data) {


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
                if ("${ empty user }" == "true") {

                    $("#btn_download").hide();

                } else {

                    $("#btn_download").show();
                }

                //수정/삭제버튼의 사용여부 결정(본인 또는 관리자일 경우)
                if (
                    "${ (user.mem_distinguish eq '관리자') }" == "true"
                    ||
                    ("${ user.mem_idx}" == res_data.mem_idx)

                ) {

                    $("#div_job").show();

                } else {

                    $("#div_job").hide();
                }


            },
            error: function (err) {

                //alert(err.responseText);

            }

        });

    }//end:mypage_modify_popup()


    function deleteMember(mem_idx){
        if(confirm('정말 탈퇴하시겠습니까?')==true) {
            location.href='../member/deleteMember?mem_idx=' + mem_idx;
            alert('회원 탈퇴가 완료되었습니다.')
        } else{
            return;
        }
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

                                <li><a href="../feed/feed_insert">코스 그리기</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="../feed/feed.do">피드</a></li>
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
    <a href="/mypage">내 정보</a>

</div>
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->


<!-- 내용 삽입 부분-->

<!-- 수정추가 펍업 -->
<%--<%@include file="mypage_modify_popup.jsp" %>--%>

<c:if test="${empty sessionScope.user}">
    <script>
        alert('로그인 후 이용해 주세요.');
        location.href="/member/login";
    </script>
</c:if>

<div style=" width: 1200px; 
height:800px;  
border: 5px solid #F7CAC9; 
border-radius: 30px;
margin: 0 auto;
margin-top: 5px;">

    <form>

        <c:choose>
        <c:when test="${user.mem_photo == null}">
            <div>
                <img src="../../../img/profileimg.jpg"
                     style="width: 100px; height:100px; margin-left: 1040px; margin-top: 15px; border-radius: 50px;">
            </div>
            </c:when>

            <c:otherwise>
            <div>
                <img src="../../../img/profile-img/${user.mem_photo}"
                     style="width: 100px; height:100px; margin-left: 1040px; margin-top: 15px; border-radius: 50px;">
            </div>
            </c:otherwise>
            </c:choose>

    <br>
    <div style="font-size: 20px; margin-left: 10px; padding: 5px;">

        <div>
            <span>아이디</span><span style="margin-right: 70px"></span>


            <span>${user.mem_id}</span>

        </div>
        <hr>
        <div>
            <span>닉네임</span><span style="margin-right: 70px"></span>


            <span>${user.mem_nickname}</span>


        </div>

        <hr>


        <div>
            <span>이름</span><span style="margin-right: 84px"></span>

            <span>${user.mem_name}</span>

        </div>

        <hr>
        <div>

            <span rowspan="3">주소</span><span style="margin-right: 84px"></span>

            <c:choose>
                <c:when test="${user.mem_zipcode eq 0}">
                    <span></span>
                </c:when>
                <c:otherwise>
                    <span>${user.mem_zipcode}</span>
                </c:otherwise>
            </c:choose>


        </div>


        <div>
            <span style="margin-right: 128px"></span><span>${user.mem_addr}</span>

        </div>

        <hr>


        <div>
            <span>휴대전화</span><span class="star" style="margin-right: 40px"></span>


            <span>${user.mem_phone}</span>
        </div>

        <hr>
        <div>
            <span>이메일</span><span style="margin-right: 55px"></span>

            <span>${user.mem_email}</span>


        </div>

        <hr>
        <div>
            <span>파트너 ID</span>
            <span style="margin-right: 31px"></span>



            <c:choose>
            <c:when test="${user.mem_partner eq null}">

            <a href="javascript:void(0);" id="copy_text" style="color: #92A8D1" data-clipboard-text="${user.mem_name}님과 특별한 시간을 보낼 준비 되셨나요?
지금 바로 가입하시고 둘만의 코스를 그려보아요♡

회원 가입 시, 아래의 파트너 코드를 입력하면 2,000 포인트를 더 지급해 드립니다.

파트너 코드 : ${user.mem_code}

데이트 코스부터 여행, 숙박까지! 드로잉썸에서 더 다양한 정보를 확인하세요!
">
                <span>초대 코드 발송하기</span>
                <i class="material-icons" style="position: absolute; margin-top: 2px;">&#xe554;</i></a>
        </div>
        </c:when>


        <c:otherwise>
        <span>${user.mem_partner}</span>
    </div>
    </c:otherwise>
    </c:choose>


</div>

<hr>
<div id="mypage_modify" style="text-align: center">
    <input class="btn btn-default" type="button" style="font-size: 20px; margin-top: 10px; margin-right: 3%;"
           value="수정하기" onclick="location.href='/member/modify_form'">

    <input class="btn btn-default" type="button" style="font-size: 20px; margin-top: 10px;"
           value="탈퇴하기" onclick="deleteMember(${user.mem_idx})">
</div>

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
                        <li><a href="../main">Home</a></li>
                        <li><a href="../feed/feed_insert">코스 그리기</a></li>
                        <li><a href="#">국내</a></li>
                        <li><a href="#">해외</a></li>
                        <li><a href="../feed/feed.do">피드</a></li>
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