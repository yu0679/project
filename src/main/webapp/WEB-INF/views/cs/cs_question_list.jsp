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


    <!-- jQuery-2.2.4 js -->
<script src="../../../js/jquery/jquery-2.2.4.min.js"></script>

    <style>
        .table>tbody>tr.success>th {
            background-color: #F7CAC9;
        }
        
        .pagination>.active>a  {
            z-index: 3;
            color: #fff;
            cursor: default;
            background-color: #F7CAC9;
            border-color: #F7CAC9;
        }
        .table{
        
            font-size: 18px;
            text-align: center;
            margin-top: 60px;
        }
        
        .form-inline{
            margin-bottom: 30px;
        }
        .pagination{
            float: right;
        }
        #list{
        font-size: 20px;
        font-weight: 400;
        }
        .wrap_btn {
    clear: both;
    margin: 0 auto;
    overflow: hidden;
    text-align: right;
    width: 1500px;
}
</style>




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
                location.href="cs_insert_form";
    
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
    <a href="../mypage/mypage">내 정보</a>

</div>



<!-- 이후부터 내용 변경하세요-->
    <!-- 카테고리 메뉴 -->

<div id="cs_main">
    <div class="classynav">
        <li><a href="cs?category_num=c001" >자주 찾는 도움말</a></li>
        <li><a href="cs_question_list" style="color: #fb5c56; font-weight: bold;" >나의 문의 내역</a></li>
    </div>
   
    <div id="box">
        
        <table class="table">
            <tr class="success">
                <th>문의번호</th>
                <th width="70%" style="text-align: center;">제목</th>
                <th>문의일자</th>
                <th>        </th>
            </tr>

            <!-- Data가 없는경우 -->
           
            <c:if test="${ empty list}">
                <tr>
                    <td colspan="5" align="center">
                        <font color="red">등록된 게시물이 없습니다</font>
                    </td>                      
                </tr>
            </c:if>
        
          
    

            <!-- Data가 있는경우 -->
            <!-- for(BoardVo vo : list ) -->
           
            <c:forEach var="vo" items="${ list }">
              
                
                <tr>
                    <td>${ vo.q_idx }</td>
                    <td>
                        <div class="subject">
                            <!-- 답글에 대한 처리(들여쓰기/ㄴ) -->
                                        <!--1인것부터 q_depth 만큼 공백을만들어라  -->

                                <!-- 사용중인 게시물 -->
                            <c:if test="${ vo.q_use eq 'y'}">     <!-- page가 비어 있으면? 페이지를 1 로 줘라  : <= 그렇지 않으면 page를 줘라-->
                                <a id="list" href="cs_question_view?q_idx=${vo.q_idx}&page=${ (empty param.page) ? 1 : param.page}&search=${ param.search }&search_text=${ param.search_text }">${vo.q_subject}</a>
                            </c:if>
        
                            <!-- 삭제된 게시물 -->
                      
                        </div>
                    </td>

                    <td>${ fn:substring(vo.q_regdate,0,16) }</td>
                <td>
                    <c:if test="${ vo.comment_count > 0}">
                        <span class="badge"><h6>답변완료</h6></span>
                    </c:if>
                </td>
<!-- 댓글 뱃지 -->
                </tr>   
           
            </c:forEach>
       

            <!-- 페이징 메뉴 -->
            <tr>
              <td colspan="5" align="center">
                <!-- 
                  Paging내서 동적으로 생성된 HTML 메뉴 페이지
              <ul class="pagination">
                <li><a href='#'>◀</a></li>
                <li><a href='list.do?page=1'>1</a></li>
                <li class='active'><a href='#'>2</a></li>
                <li><a href='list.do?page=3'>3</a></li>
                <li><a href='list.do?page=4'>4</a></li>
                <li><a href='list.do?page=5'>5</a></li>
                <li><a href='list.do?page=7'>▶</a></li>
                </ul>
              -->
  
                ${pageMenu}
        </td>
            </tr>
            
            
  
        </table>
    <!-- 검색메뉴 -->
    <tr>
        <td colspan="5" align="center">
            <form class="form-inline">
                <select class="form-control" id="search">
                    <option value="all">전체</option>
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="subject_content">제목+내용</option>
                </select>
        <input class="form-control"    id="search_text" value="${ param.search_text}">
        <input class="btn btn-primary" type="button" value="검색"
                    onclick="find();">
            </form>
        </td>
    </tr>
    </div>







</div>





<div class="wrap_btn">
    <span class="txt_solution"> 원하시는 답변을 찾지못하셨다면, 고객센터로 문의해 주세요. </span>
    <div>
        <input  class="btn" type="button" value="문의하기"
                onclick="insert_form();">
    
            
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


    <!-- Favicon -->
    <link rel="icon" href="../../../img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../../css/style.css">
    <!-- 고객센터Stylesheet -->
    <link rel="stylesheet" href="../../../css/cs/cs.css">

    <!-- ##### All Javascript Script ##### -->

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