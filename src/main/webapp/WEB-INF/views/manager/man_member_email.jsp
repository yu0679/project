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

#emailContent{
    width: 918px;
    height: 602px;
}
</style>

<script>

function send_mem_email(f){

let rejectmsg = prompt("내용을 입력하세요");

if(rejectmsg==null){
    return;
}


f.emailContent.value = rejectmsg;



f.action = "email";
f.submit();
}
</script>



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
                            
                            <li><a><i class="fa fa-desktop"></i> 1:1 문의 <span class="fa fa-chevron-down"></span></a>
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
        <div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>이메일 발송</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <form id="emailForm" class="form-horizontal form-label-left">

                    <!-- 받는 이메일 주소 입력 필드 -->
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">받는 이메일 주소</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="email" id="email" name="email" required="required" class="form-control">
                        </div>
                    </div>

                    <!-- 이메일 내용 입력 필드 -->
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="emailContent">이메일 내용</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea id="emailContent" name="emailContent" required="required" class="form-control" rows="5"></textarea>
                        </div>
                    </div>

                    <!-- 전송 버튼 -->
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                            
                            <button type="button" class="btn btn-success" >이메일 전송</button
                                onclick="send_mem_email(this.form);">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /이메일 발송 템플릿 -->
    
    
    
    
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
