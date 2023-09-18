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
    <title>Drawing SSum | 고객센터</title>



    <!-- Favicon -->
    <link rel="icon" href="../../../img/core-img/favicon.jpg">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../../css/style.css">
    <!-- 고객센터Stylesheet -->
    <link rel="stylesheet" href="../../../css/cs/cs.css">

        



<script>

    $(document).ready(function(){

        setTimeout(showMessage,100);
    });

    function showMessage(){
        //cs?category_num=c001&modal=yes
        if("${param.modal eq 'yes'}"=="true"){
            $("#myModal").modal();   
        }
        
    }

</script>


<script>

    function insert_form(){

    // //로그인 체크(안된경우)
    if("${ empty sessionScope.user }"=="true"){


        location.href="../member/login";

            return;
    }
            //문의하기 폼으로이동
            location.href="cs_insert_form";

    }
</script>
<script>

    function my_question_list(){

    // //로그인 체크(안된경우)
    if("${ empty sessionScope.user }"=="true"){
     location.href="../member/login";
    return;
    }
    //문의하기 폼으로이동
    location.href="cs_question_list";

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

                                <li><a href="../feed/feed_insert">코스 그리기</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="../feed/feed.do">피드</a></li>
                                <li><a href="cs?category_num=c001">고객센터</a>
                            </ul>

                            <c:if test="${empty sessionScope.user}">
                                <!-- 로그인/회원가입 -->
                                <div class="login-area">
                                    <a href="../member/login">Login / Register</a>
                                </div>
                            </c:if>

                            <c:if test="${not empty sessionScope.user}">
                                <div class="login-area">
                                    <a href="../member/logout">Logout</a>
                                </div>
                            </c:if>
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
    <a href="../mypage/mypage">내 정보</a>

</div>



<!-- 이후부터 내용 변경하세요-->
    <!-- 카테고리 메뉴 -->

    <div id="cs_main">
        <div class="classynav">
            
        
            <li><a href="cs?category_num=c001"  style="color: #fb5c56; font-weight: bold;">자주 찾는 도움말</a></li>
                
            <li><a  href="#"  aria-current="false" onclick="my_question_list();">나의 문의 내역</a></li>
                
        </div>
        <div class="dropdown">
            <c:if test="${ param.category_num eq 'c001'}">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> 
            계정/로그인/가입/탈퇴
            </c:if>
            <c:if test="${ param.category_num eq 'c002'}">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> 
            내피드/설정
            </c:if>
            <c:if test="${ param.category_num eq 'c003'}">
            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> 
            기타
            </c:if>
            
            <span class="caret"></span></button>
        
            <ul class="dropdown-menu">
            <!--  for(CategoryVo category : category_list)  -->
        <c:forEach var="category"  items="${ category_list }">
            <ul>
                <li><a class="btn btn-default" href="cs?category_num=${ category.category_num }"> 
                    ${ category.category_name }</a>
            </ul>
        </c:forEach>
            </ul>
        </div>


        <c:if test="${ param.category_num eq 'c001'}">
    
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        1.<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                                비밀번호가 생각이안나요. </a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse in">
                        <div class="panel-body">
                            계정 또는 비밀번호를 분실하셨다면 로그인 화면 하단의 '이메일 주소 또는 비밀번호를 잊으셨나요?'
                            항목을 누르셔서 계정과 비밀번호를 찾으실 수 있습니다.
                            </div>
                    </div>
                    </div>
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        2.<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                        탈퇴시 내가 등록한 댓글,<br> 게시물들도 삭제되나요?
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
                        3.<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                         가입여부를 모르겠어요.
                            </a>
                        </h4>
                    </div>
                    <div id="collapse3" class="panel-collapse collapse">
                        <div class="panel-body"> Kakao, Daum, Melon 서비스에서 이메일 주소를 아이디로 하여 만들 수 있으며,
                    하나로 Kakao, Daum, Melon 서비스를 모두 이용할 수 있습니다.
                            계정 가입 여부가 기억나지 않으신 경우, 주로 사용하시는 이메일로 로그인을 시도해 보세요. 
                            가입한 적이 없다면, 카카오계정을 새로 가입해 주세요.</div>
                    </div>
                    </div>
            </div>
    
           
    
        </c:if>
        <c:if test="${ param.category_num eq 'c002'}">
            <center>
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        1.<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                        방문수를 다른사람에게 보여주기 싫어요. </a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse in">
                        <div class="panel-body">방문수 공개범위를 설정할 수 있습니다.

                            방문수 그래프 오른쪽 상단의 [설정] 버튼을 누르시거나,
                            [ 설정 > 내스토리 공개범위 설정 > 방문수]로 들어가시면  방문자수의 공개범위를 [전체공개/친구공개/나만보기]로 설정할 수 있습니다.
                            </div>
                    </div>
                    </div>
                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        2.<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                            최근 알림을 삭제하고 싶어요.

                            </a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse">
                        <div class="panel-body">알림 목록에서 삭제하고 싶은 알림을 왼쪽으로 밀어보시면, 삭제 버튼이 뜹니다. </div>
                    </div>
                    </div>

                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        3.<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                            알림이 오지 않아요.
                            
                            
                            </a>
                        </h4>
                    </div>
                    <div id="collapse3" class="panel-collapse collapse">
                        <div class="panel-body">알림 설정을 확인해보세요.
                            [우측상단 […] 버튼 > 알림 설정] 에서 알림 항목 별 수신 설정을 확인해보세요.</div>
                    </div>
                    </div>
            </div>
    
            </center>
        </c:if>
        <c:if test="${ param.category_num eq 'c003'}">
            <center>

                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">

                    <div class="panel-heading">
                        <h4 class="panel-title">
                        1.<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                            해시태그 검색해도 안 나와요</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse in">
                        <div class="panel-body">해시태그 검색은 해당 태그를 포함하여 작성한 전체공개 글에 한해 노출하며,
                            
                            이용자별로 시스템 조건에 따라 시간 순으로 표시됩니다.
                            
                            동일한 해시태그라 하더라도 사람마다 다른 리스트가 노출될 수 있습니다.
                            
                            또한 피드 개설 후에 운영일수와 활동성에 따라 개별 글의 활동성과 품질, 주제 적합성을 시스템에서 판단하기까지 시간이 소요될 수 있습니다. </div>
                    </div>
                    </div>

                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                        2.<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                            글을 공유하고 싶어요</a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse">
                        <div class="panel-body">공유하고 싶은 글의 우측 상단 더보기 […] 버튼을 클릭하여 스토리 글을 카카오톡으로 공유하거나 스토리의 게시물로 포스팅 할 수 있습니다.
                            또는 [URL 복사] 버튼을 선택하여 다른 곳에 붙여 넣기 할 수도 있습니다. 
                            
                            스토리 글은 작성자가 '공유허용'한 전체공개 또는 친구공개 글에 대해서만 공유가 가능합니다. </div>
                    </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                            3.<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
                                기타</a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">ㅇㅇ</div>
                        </div>
                        



                    </div>
                
            </div>
        </c:if>
    </div>


</div>
    


<div class="wrap_btn">
<span class="txt_solution"> 원하시는 답변을 찾지못하셨다면, 고객센터로 문의해 주세요. </span>
<div>
    <input  class="btn" type="button" value="문의하기"
            onclick="insert_form();">

        
    </div>
</div>






<!-- 아코디언 메뉴 -->

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
                                    <li><a href="cs?category_num=c001">고객센터</a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- ##### Footer Area Start ##### -->

          



            <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
    <div class="modal-dialog">
  
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <p>
              정상적으로 문의가 접수되었습니다.<br>
              처리결과는 기재하신 연락처(휴대폰번호/이메일)로 회신드리겠습니다.<br>
              * 문의량이 증가하는 경우 답변이 지연될 수 있습니다.<br>
              신속하게 답변드릴 수 있도록 최선을 다하겠습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
  
    </div>
  </div>

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