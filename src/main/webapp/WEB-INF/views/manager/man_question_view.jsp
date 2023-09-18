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

#c_menu{
    height: 100%;
    width: 100%;
    display: table;

}
#comment_btn{
    margin-top: 3px;
    float: right;
    height: 100px;
    width: 18%;
    
}


#comment_display{
    margin-top: 30px;
    float: left;
    width: 80%;
    height: 150px;
    display: table;
}

#x_btn{
float: right;

}
.comment_content{
    width: 100%;
    height: 100%;
    display: table-row;
    
    word-break:normal;
/*word-break의 기본값으로 단어 단위로 끊어서 줄바꿈*/
word-break:break-all;
/*특수문자를 제외하고 강제로 줄바꿈*/
word-break:break-word;
/*특수문자를 포함하고 강제 줄바꿈*/
}


#comment_content{
    width: 80%;
    height: 150px;
    resize: none;
   
}

#box{
    
    width: 100%;
    margin: auto;
    margin-top: 100px;
    padding: 7px 10px;

}

.photo img{
    width: 80%;
}

h1{
    text-align: center;
    padding-bottom: 50px;
}

#btn-ss{
    float: right;
    
}

.panel-primary {
                            border-color: #92A8D1;
                        }

                        .panel-primary>.panel-heading {
                            background-color: #92A8D1;
                            border-color: #92A8D1;
                        }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function del(q_idx){

    // if(confirm("정말 삭제하시겠습니까?")==false)return;

    // location.href="delete.do?b_idx=" + b_idx +"&page=${ param.page }&search=${param.search}&search_text=${ param.search_text }"; 

    location.href="man_question_delete?q_idx=" + q_idx +"&page=${ param.page }&search=${param.search}&search_text=${ param.search_text }"; 
   
}



// 댓글작성
let global_comment_page = 1;

function comment_insert(){
  

    let comment_content = $("#comment_content").val().trim();

    if(comment_content==""){
        $("#comment_content").val("");
        $("#comment_content").focus();
        return;
    }

    //댓글쓰기
    $.ajax({

        url   : "man_comment_insert",
        data  : {
                    "q_idx"          : "${ vo.q_idx }",
                    "comment_content": comment_content,
                    "mem_idx"        : "${ admin_user.mem_idx }",
                    "mem_id"         : "${ admin_user.mem_id }",
                    "mem_name"       : "${ admin_user.mem_name }"
                },
        dataType : "json",
        success  : function(res_data){
            //res_data = {"result" : "success" }
            //res_data = {"result" : "fail" }
            if(res_data.result=="success"){
            
            //이전 댓글내용삭제
            $("#comment_content").val("");
            //댓글목록을 재요청
            comment_list(1);
 // "답변하기" 버튼 숨김 상태를 웹 스토리지에 저장
          
            }

        },
        error    : function(err){
            alert(err.responseText);
        }
    });
}

//댓글조회
function comment_list(comment_page) {
    $.ajax({
        url: "man_comment_list",
        data: {
            "q_idx": "${ vo.q_idx }",
            "page": comment_page
        },
        success: function (res_data) {
            global_comment_page = comment_page;
            
            // 댓글 영역 넣어준다
            $("#comment_display").html(res_data);

      
        },
        error: function (err) {
            alert(err.responseText);
        }
    });
}


</script> 


<script>
    
    //현재 html문서배치완료되면 댓글목록 가져와서 출력
    $(document).ready(function(){
        
    
    // 페이지가 처음 로드될 때 댓글 목록을 가져와서 표시
    comment_list(1);

    });

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
<div class="right_col" role="main"   style="height:1500px;">
            


	<div id="box">
        <h4>${ vo.mem_name }님의 문의내역</h4>
   <div class="panel panel-primary">
           
            <div class="panel-heading"><h4> ${ vo.q_subject }</h4></div>
            <div class="panel-body">
                <!-- 제목 -->
                
                <br><br>
                <!-- 내용 -->
             
                <div class="mystyle" id="content">
                <label>${ vo.q_content }</label>
                <br><br>
                <div class="photo">
                    <img src="../../../upload/${ vo.q_filename }" >
                </div>
                
                </div>

                <!-- 작성일자/IP -->
                <br>
                <label>작성일자</label>
                <div class="mystyle" >   
                <label>${ fn:substring(vo.q_regdate,0,16) } </label>
                </div>
                <br>
                <label>IP</label>
                <div class="mystyle">
                <label>${ vo.q_ip}</label>
                


            <div id="btn-ss">
                <!-- 작업버튼 -->
                <input  class="btn btn-primary" type="button" value="목록보기"
                        onclick="location.href='man_question_list?page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'">

                <!-- 글쓴이인 경우만 활성화 -->

    
                <input  class="btn btn-danger"  type="button" value="삭제하기"
                        onclick="del('${ vo.q_idx }');">
            </div>
                
            </div>
        
        </div>

<!-- 댓글출력영역 -->
<div id="comment_display">


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
