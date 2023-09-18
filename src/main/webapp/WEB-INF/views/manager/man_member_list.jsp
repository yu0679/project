<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>드로잉썸 | 매니저</title>
<!-- Bootstrap -->
<link href="../../../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="../../../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- NProgress -->
<link href="../../../vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../../../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- bootstrap-progressbar -->
<link href="../../../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
<!-- JQVMap -->
<link href="../../../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
<!-- bootstrap-daterangepicker -->
<link href="../../../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="../../../css/admin/custom.min.css" rel="stylesheet">

<style>



#box{
    width: 1600px;
    margin: auto;
    margin-top: 100px;
    padding: 7px 10px;

}

h1{
    text-align: center;
    padding-bottom: 50px;
}


</style>




</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="/manager/main" class="site_title"><i class="fa fa-paw"></i> <span>Drawing SSum</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                
                      <div class="profile_info">
                    <span>안녕하세요,</span>
                    <h2>${admin_user.mem_name} &nbsp; 님</h2>

                </div>
               
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> 홈 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="/manager/main">매니저 홈</a></li>
                                    <li><a href="/main">드로잉썸 바로가기</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-edit"></i> 일반 회원관리 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" >

                                    <li><a href="/manager/man_member_list">일반회원 목록</a></li>
                                     
                                     
                                    

                                </ul>
                            </li>
                            <li><a><i class="fa fa-desktop"></i> 관리자 회원관리 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="/manager/man_ceo_list">사업자회원 목록</a></li>
                                    <li><a href="/manager/check_ceo">사업자회원 승인 대기 목록</a></li>
                                     
                                     
                                     

                                </ul>
                            </li>
                            
                            <li><a><i class="fa fa-desktop"></i> 1:1 문의하기 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">

                                    
<li><a href="/manager/man_question_list">문의내역</a></li>
                                    
                                </ul>
                            </li>
                            
                        </ul>
                    </div>
        

                </div>
                <!-- /sidebar menu -->


            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">

                                ${admin_user.mem_name}
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">

                                <li><a href="/manager/man_logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                </li>
                            </ul>
                        </li>


                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            
<div id="box">
    <h1 id="title" style="font-weight: bold;">일반 회원관리</h1>


    <table class="table"  style="text-align: center;">
    
    <!-- title  -->
    <tr class="success"  >
        <th>회원번호</th>
        <th>회원사진</th>
        <th>이    름</th>
        <th>아이디</th>
        <th>닉네임</th>
        <th>주소</th>
        <th>우편번호</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>포인트</th>
        <th>파트너</th>
        <th>가입일자</th>
        <th></th>
        <th></th>


    </tr>
    
    
    <c:if test="${ empty list }">
        <tr>
            <td colspan="10">
            <div id="empty_message">가입된 회원정보가 없습니다</div>
            </td>
        </tr> 
    </c:if>
    
    <!-- for(MemberVo vo : list)      -->
    <c:forEach var="vo"  items="${ list }">
        <tr>
            <td>${ vo.mem_idx }</td>
            <td>${ vo.mem_photo }</td>
            <td>${ vo.mem_name }</td>
            <td>${ vo.mem_id }</td>
            <td>${ vo.mem_nickname }</td>
            <td>${ vo.mem_addr }</td>
            <td>${ vo.mem_zipcode }</td>
            <td>${ vo.mem_phone }</td>
            <td>${ vo.mem_email }</td>
            <td>${ vo.mem_point }</td>
            <td>${ vo.mem_partner }</td>
            <td>${ vo.mem_regidate.split(" ")[0] }</td>



         
        

    </tr> 
    </c:forEach>
    
    
    </table>
    
    
    
    
    </div>
            </div>




                    

<!-- jQuery -->

<script src="../../../vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../../../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../../vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../../../vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="../../../vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="../../../vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="../../../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="../../../vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="../../../vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="../../../vendors/Flot/jquery.flot.js"></script>
<script src="../../../vendors/Flot/jquery.flot.pie.js"></script>
<script src="../../../vendors/Flot/jquery.flot.time.js"></script>
<script src="../../../vendors/Flot/jquery.flot.stack.js"></script>
<script src="../../../vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="../../../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="../../../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="../../../vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="../../../vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="../../../vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="../../../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="../../../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="../../../vendors/moment/min/moment.min.js"></script>
<script src="../../../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="../../../js/custom.min.js"></script>

</body>
</html>
