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
    <!-- 고객센터Stylesheet -->
    <link rel="stylesheet" href="../../../css/cs/insertcs.css">


    <script type="text/javascript">
  
        function del(f){
          
            var idx   = f.idx.value;
            var c_pwd = f.c_pwd.value.trim();
            
            if(c_pwd==''){
                alert('삭제 비밀번호를 입력하세요!');
                f.c_pwd.value='';
                f.c_pwd.focus();
                return;
            }
            
            
            //서버로 비밀번호 맞는지 여부 확인(Ajax) : check_pwd.do?idx=5&c_pwd=1234
            $.ajax({
                url		: "check_pwd.do",                 //VisitCheckPwdAction
                data		: { 'idx': idx, 'c_pwd': c_pwd }, //parameter
                dataType 	: 'json',
                success	: function(res_data){
                    // res_data = {"result": true} or {"result": false}
                    
                    if(res_data.result==false){
                        alert('비밀번호가 틀렸습니다');
                        return;
                    }
                    
                    //삭제수행(확인)
                    if(confirm("정말 삭제하시겠습니까?")==false)return;
                    
                    //삭제수행
                    location.href="delete.do?idx=" + idx;
                    
                    
                },
                error		: function(err){
                    
                    alert(err.responseText);
                    
                }
            });
        }//end-del
        
        
        
        function modify_form(f){
            
            var idx   = f.idx.value;
            var c_pwd = f.c_pwd.value.trim();
            
            if(c_pwd==''){
                alert('수정 비밀번호를 입력하세요!');
                f.c_pwd.value='';
                f.c_pwd.focus();
                return;
            }
            
            
            //서버로 비밀번호 맞는지 여부 확인(Ajax) : check_pwd.do?idx=5&c_pwd=1234
            $.ajax({
                url		: "check_pwd.do",                 //VisitCheckPwdAction
                data		: { 'idx': idx, 'c_pwd': c_pwd }, //parameter
                dataType 	: 'json',
                success	: function(res_data){
                    // res_data = {"result": true} or {"result": false}
                    
                    if(res_data.result==false){
                        alert('비밀번호가 틀렸습니다');
                        return;
                    }
                   
                    
                    //수정폼 띄우기
                    location.href="modify_form.do?idx=" + idx;
                    
                    
                },
                error		: function(err){
                    
                    alert(err.responseText);
                    
                }
            });
          
        }
      
      </script>
      
      
      
      <!-- 검색메뉴 -->
      <script type="text/javascript">
        
         /* jQuery초기화 */
         $(document).ready(function(){
             
             if("${ not empty param.search }" == "true"){
                 
                 $("#search").val('${ param.search }');
             }
             
             //전체검색
             if("${ param.search eq 'all' }" =="true"){
                
                 $("#search_text").val("");
             }
             
         });
        
        
         function find(f){
          
             var search 		= f.search.value;
             var search_text 	= f.search_text.value.trim();
             
             if(search!='all' && search_text==''){
                 alert('검색어를 입력하세요!!');
                 f.search_text.value='';
                 f.search_text.focus();
                 return;
             }
             
             f.action = "list.do";// VisitListAction
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
                        <h2>고성민</h2>님

                    </div>
               
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i> 홈 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: block;">
                                    <li><a href="/manager/main">매니저 홈</a></li>
                                    <li><a href="/main">드로잉썸 바로가기</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-edit"></i> 일반회원 관리 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" >

                                    <li><a href="#">일반회원 목록</a></li>
                                    <li><a href="#">메세지 보내기</a></li>
                                    <li><a href="#">메일 발송</a></li>
                                    <li><a href="#">SMS  발송</a></li>

                                </ul>
                            </li>
                            <li><a><i class="fa fa-desktop"></i> 관리자회원 관리 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="#">관리자회원 목록</a></li>
                                    <li><a href="#">괸리자회원 승인 대기 목록</a></li>
                                    <li><a href="#">메세지 보내기</a></li>
                                    <li><a href="#">메일 발송</a></li>
                                    <li><a href="#">SMS  발송</a></li>

                                </ul>
                            </li>
                            
                            <li><a><i class="fa fa-desktop"></i> 1:1 문의하기 <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">

                                    <li><a href="/manager/question_list">문의내역</a></li>

                                </ul>
                            </li>
                            <li><a href="./calendar.jsp">캘린더</a></li>
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
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                
                                <img src="../manager/images/img.jpg" alt="">John Doe
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="javascript:;"> Profile</a></li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="badge bg-red pull-right">50%</span>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li><a href="javascript:;">Help</a></li>
                                <li><a href="login.jsp"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                            </ul>
                        </li>

                        <li role="presentation" class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-green">6</span>
                            </a>
                            <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                <li>
                                    <a>
                                        <span class="image"><img src="images
                                            /img.jpg" alt="Profile Image" /></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <div class="text-center">
                                        <a>
                                            <strong>See All Alerts</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
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
        <!-- top tiles -->
        <div id="box">
    
            
            <h3 class="title"> 1:1 문의 내역 </h3>
            
            
            <!-- 검색메뉴 -->
            <div style="text-align: center; margin-top: 30px;">
            
               <form class="form-inline">
                     <select class="form-control" name="search"  id="search">
                        <option value="all">전체</option>
                        <option value="name">이름</option>
                        <option value="content">내용</option>
                        <option value="name_content">이름+내용</option>
                        <option value="regdate">작성일자(YYYY-MM-DD)</option>
                     </select>       
                     <input  class="form-control" name="search_text" id="search_text" 
                             value="${ param.search_text }">
                             
                     <input  class="btn btn-info" type="button" value="검색"
                             onclick="find(this.form);" >
               </form>
            </div>
            
            <div style="margin-bottom: 10px; margin-top: 20px;">
               <button class="btn btn-primary" 
                       onclick="location.href='insert_form.do'">글올리기</button>
            </div>
            
          
            <!-- 데이터가 없는경우 -->
            <c:if test="${ empty list }">
            
              <div id="empty_message">데이터가 없습니다</div>
            
            </c:if> 
          
          
            <!-- 방명록 내용 --> 
            <!--  for(VisitVo vo : list)  -->
            <c:forEach var="vo"  items="${ list }">
               
               <div class="panel panel-primary">
                  <div class="panel-heading"><h5><b>${ vo.name }</b>님의 글(${ vo.ip })</h5></div>
                  <div class="panel-body">
                     
                     <div class="content">${ vo.content }</div>
                     <div class="regdate"><label>작성일자 : ${ vo.regdate }</label></div>
                    
                     <form class="form-inline">
                         <input type="hidden" name="idx"  value="${ vo.idx }">
                         <div class="pwd">
                            <label>비밀번호(${ vo.pwd }) : </label>
                            <input class="form-control" type="password"  name="c_pwd">
                            
                            <input class="btn btn-info"   type="button" value="수정"
                                   onclick="modify_form(this.form);" >
                            <input class="btn btn-danger" type="button" value="삭제"
                                   onclick="del(this.form);">
                            
                         </div>
                     </form>
                     
                  </div>
               </div>
               
               
            </c:forEach>
          </div>
    
    
    </div>
    <!-- body div end -->





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
