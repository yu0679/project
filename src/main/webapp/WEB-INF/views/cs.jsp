<%@ page language="java" contentType="text/html; charset=UTF-8" %>



<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Drawing SSum | 고객센터
    </title>



    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/cs.css">
    
    
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
    <div class="top-header-area bg-img" style="background-image: url(../../img/bg-img/header.jpg);">
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
                                <li><a href="/cs">고객센터</a>
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


<!-- 이후부터 내용 변경하세요-->
  <!-- 페이징 메뉴 -->
  
  <hr width="600" border="1" noshade color="navy">
  <center>
      
      <!--  for(CategoryVo category : category_list)  -->
      <c:forEach var="category"  items="${ category_list }">
          <a href="list?category=${ category.category_num }">${ category.category_name }</a>
          &nbsp;&nbsp;&nbsp;
      </c:forEach>
  
  
      <!-- <a href="list.do?category=com001">컴퓨터</a> | 
      <a href="list.do?category=ele002">가전 제품</a> | 
      <a href="list.do?category=sp003">스포츠</a> -->
      
      
      
  </center>
     


<!-- 아코디언 메뉴 -->
<div class="panel-group" id="accordion">
        <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
            계정과 비밀번호가 생각이안나요. </a>
            </h4>
        </div>
        <div id="collapse1" class="panel-collapse collapse in">
            <div class="panel-body">계정 또는 비밀번호를 분실하셨다면 로그인 화면 하단의 '이메일 주소 또는 비밀번호를 잊으셨나요?'
                항목을 누르셔서 계정과 비밀번호를 찾으실 수 있습니다.
                </div>
        </div>
        </div>
        <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                탈퇴시 내가 등록한 댓글, 게시물들도 삭제되나요?
                </a>
            </h4>
        </div>
        <div id="collapse2" class="panel-collapse collapse">
            <div class="panel-body">탈퇴하시면 맺었던 친구관계가 끊어지고 모든 내 피드가 삭제됩니다.

                그러나 다른 친구들의 정상적인 서비스 이용을 위하여 다른 친구들 글에 남긴 댓글은 삭제되지 않습니다.
                
                삭제된 후에는 복구가 되지 않으니 신중하게 탈퇴하시기를 부탁드립니다. </div>
        </div>
        </div>
        <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                가입여부를 모르겠어요.
                </a>
            </h4>
        </div>
        <div id="collapse3" class="panel-collapse collapse">
            <div class="panel-body"> Kakao, Daum, Melon 서비스에서 이메일 주소를 아이디로 하여 만들 수 있으며,
                카카오계정 하나로 Kakao, Daum, Melon 서비스를 모두 이용할 수 있습니다.
                계정 가입 여부가 기억나지 않으신 경우, 주로 사용하시는 이메일로 로그인을 시도해 보세요. 
                가입한 적이 없다면, 카카오계정을 새로 가입해 주세요.</div>
        </div>
        </div>
</div>
<!-- 아코디언 메뉴끝 -->



            <!-- 하단 복사 붙여넣기 필요-->
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
                                    <li><a href="#">코스 그리기</a></li>
                                    <li><a href="#">국내</a></li>
                                    <li><a href="#">해외</a></li>
                                    <li><a href="../../single-post.html">피드</a></li>
                                    <li><a href="/cs">고객센터</a>
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