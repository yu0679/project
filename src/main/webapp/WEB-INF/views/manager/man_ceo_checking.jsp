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
    <script>
        
        function approve(mem_idx){
            if(confirm('승인하시겠습니까?')==true){
                location.href='approve?mem_idx='+mem_idx;
            }
        }

        function reject(mem_idx){
            let rejectmsg = prompt("반려 사유를 작성하세요.");

            if(rejectmsg==null){
                return;
            }

            $.ajax({
                async:false,
                type:'post',
                url:'reject',
                data:{"mem_idx":mem_idx, "rejectmsg":rejectmsg},
                dataType: "json",
                success : function (res_data) {
                    alert(res_data.result);
                    location.href="check_ceo";
                }
                ,
                error:function (err){
                    alert(err.responseText);
                }
            })
        }


        function send_reject(f){

            let rejectmsg = prompt("반려 사유를 작성하세요.");

            if(rejectmsg==null){
                return;
            }

            f.rejectmsg.value=rejectmsg;


            f.action = "reject";
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
                            <li><a><i class="fa fa-edit"></i> 일반회원 관리 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" >

                                    <li><a href="/manager/man_member_list">일반회원 목록</a></li>
                                    
                                     
                                    

                                </ul>
                            </li>
                            <li><a><i class="fa fa-desktop"></i> 사업자회원 관리 <span class="fa fa-chevron-down"></span></a>
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
        <div class="right_col" role="main">
            
<div id="box">
    <h1 id="title">승인 요청 관리자 목록</h1>


    <table class="table">
    
    <!-- title  -->
    <tr class="success">

        <th></th>
        <th>대표사진</th>
        <th>아이디</th>
        <th>상호명</th>
        <th>대표자명</th>
        <th>우편번호</th>
        <th>주소</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>승인여부</th>



    </tr>
    
    
    <c:if test="${ empty list }">
        <tr>
            <td colspan="10">
            <div id="empty_message" style="margin-left: 40%; margin-top: 5%; font-weight: bold">승인 요청 중인 사업자가 존재하지 않습니다.</div>
            </td>
        </tr> 
    </c:if>
    
    <!-- for(MemberVo vo : list)      -->
    <c:forEach var="vo"  items="${ list }" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${ vo.mem_photo }</td>
            <td>${ vo.mem_id }</td>
            <td>${ vo.mem_nickname }</td>
            <td>${ vo.mem_name }</td>
            <td>${ vo.mem_zipcode }</td>
            <td>${ vo.mem_addr }</td>
            <td>${ vo.mem_phone }</td>
            <td>${ vo.mem_email }</td>

            <td>
                    <input class="btn btn-success" type="button"  value="승인"
                            onclick="approve('${vo.mem_idx}')">
                           
                     <form>
                         <input type="hidden" name="rejectmsg" id="rejectmsg">
                         <input type="hidden" name="mem_idx" value="${vo.mem_idx}">
                        <input class="btn btn-danger"  type="button"  value="반려"
                               onclick="send_reject(this.form);">
                     </form>
            </td>

    </tr> 
    </c:forEach>

    </table>

    
    </div>
            </div>
          <br />
            




                    <div class="row">


                        <!-- Start to do list -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>To Do List <small>Sample tasks</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">

                                    <div class="">
                                        <ul class="to_do">
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Schedule meeting with new client </p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Create email address for new intern</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Create email address for new intern</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                                            </li>
                                            <li>
                                                <p>
                                                    <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End to do list -->

                        <!-- start of weather widget -->
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Daily active users <small>Sessions</small></h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Settings 1</a>
                                                </li>
                                                <li><a href="#">Settings 2</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="temperature"><b>Monday</b>, 07:30 AM
                                                <span>F</span>
                                                <span><b>C</b></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="weather-icon">
                                                <canvas height="84" width="84" id="partly-cloudy-day"></canvas>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="weather-text">
                                                <h2>Texas <br><i>Partly Cloudy Day</i></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="weather-text pull-right">
                                            <h3 class="degrees">23</h3>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="row weather-days">
                                        <div class="col-sm-2">
                                            <div class="daily-weather">
                                                <h2 class="day">Mon</h2>
                                                <h3 class="degrees">25</h3>
                                                <canvas id="clear-day" width="32" height="32"></canvas>
                                                <h5>15 <i>km/h</i></h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="daily-weather">
                                                <h2 class="day">Tue</h2>
                                                <h3 class="degrees">25</h3>
                                                <canvas height="32" width="32" id="rain"></canvas>
                                                <h5>12 <i>km/h</i></h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="daily-weather">
                                                <h2 class="day">Wed</h2>
                                                <h3 class="degrees">27</h3>
                                                <canvas height="32" width="32" id="snow"></canvas>
                                                <h5>14 <i>km/h</i></h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="daily-weather">
                                                <h2 class="day">Thu</h2>
                                                <h3 class="degrees">28</h3>
                                                <canvas height="32" width="32" id="sleet"></canvas>
                                                <h5>15 <i>km/h</i></h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="daily-weather">
                                                <h2 class="day">Fri</h2>
                                                <h3 class="degrees">28</h3>
                                                <canvas height="32" width="32" id="wind"></canvas>
                                                <h5>11 <i>km/h</i></h5>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="daily-weather">
                                                <h2 class="day">Sat</h2>
                                                <h3 class="degrees">26</h3>
                                                <canvas height="32" width="32" id="cloudy"></canvas>
                                                <h5>10 <i>km/h</i></h5>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- end of weather widget -->
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

        
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