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
    <link rel="icon" href="../../../img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../../css/style.css">
    <!-- 고객센터Stylesheet -->
    <link rel="stylesheet" href="../../../css/cs/cs.css">

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
        

    <script>
        // 언제호출? : HTML browser배치완료되면
        // 검색후 초기화되지 않기위해  
        $(document).ready(function(){
    
            // if서치값이 비어있지않으면 서치내용을 남겨라
            if("${ not empty param.search }"=="true"){
            $("#search").val("${param.search}")
        }
          });
    
    
    <!-- 검색기능 -->
    
function find(){
    
    let search = $("#search").val();
    let search_text = $("#search_text").val().trim();
    
        if(search != 'all'){//전체보기가 아니면
    
            if(search_text==''){
                alert('검색어를 입력하세요');
                $("search_text").val("");//값지우기
                $("search_text").focus();
                return;
            }
        }
          //전체로 검색되면 전에 검색값 지우기
        if(search=="all"){
            $("#search_text").val("");
            search_text="";
        } 
        location.href="cs_question_list?search=" + search + "&search_text=" 
                          + encodeURIComponent(search_text); //특수문자가 들어올수있기때문에 내용을 인코딩해서 보내기
        }
    
</script>
<script>

        function insert_form(){
    
        // //로그인 체크(안된경우)
        if("${ empty sessionScope.user }"=="true"){
    
            if(confirm("글쓰기는 로그인후 가능합니다\n로그인하시겠습니까?")==false)return;
    
            location.href="../member/login";
    
                return;
        }
                //문의하기 폼으로이동
                location.href="/insert_form";
    
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
                                <li><a href="cs?category_num=c001">고객센터</a>
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
    <!-- 카테고리 메뉴 -->

<div id="cs_main">
<div id="box">
    
    <div class="panel panel-primary">
        <div class="panel-heading"><h4>${ vo.mem_name }님의 글:</h4></div>
        <div class="panel-body">
            <!-- 제목 -->
            <label>[제목]</label>
            <div class="mystyle">
            <label>${ vo.q_subject }</label>
            </div>

            <!-- 내용 -->
            <label>[내용]</label>
            <div class="mystyle" id="content">
            <label>${ vo.q_content }</label>
            </div>

            <!-- 작성일자/IP -->
            <label>[작성일자(IP)]</label>
            <div class="mystyle">
            <label>${ fn:substring(vo.q_regdate,0,16) }(${ vo.q_ip})</label>
            </div>

            <!-- 작업버튼 -->
            <input  class="btn btn-primary" type="button" value="목록보기"
                    onclick="location.href='list.do?page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'">
            
            <!-- 로그인상태 및 메인글에서만 + 검색조건이 all일때 사용  -->
            <c:if test="${ (not empty user) and ( vo.q_depth eq 0 ) and ( param.search eq 'all' )  }">
                <input  class="btn btn-success" type="button" value="답글쓰기"
                        onclick="location.href='reply_form.do?q_idx=${ vo.q_idx }&page=${ param.page }'">
            </c:if>

            <!-- 글쓴이인 경우만 활성화 -->
            <!-- <c:if test="${ user.mem_idx eq vo.mem_idx }"> -->
            <input  class="btn btn-info"    type="button" value="수정하기"
                    onclick="location.href='modify_form.do?q_idx=${ vo.q_idx }&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'"   >
            <input  class="btn btn-danger"  type="button" value="삭제하기"
                    onclick="del('${ vo.q_idx }');">
            <!-- </c:if> -->

        </div>
    </div>

    <!-- 댓글입력창 -->
    <div>
        <textarea id="comment_content" readonly></textarea>   

    </div>

    <hr style="clear:both;">
    <!-- 댓글출력영역 -->
    <div id="comment_display"></div>


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
                                    <li><a href="cs?category_num=c001">고객센터</a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- ##### Footer Area Start ##### -->


</body>

</html>