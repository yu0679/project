<%@ page language="java" contentType="text/html; charset=UTF-8" %> <%@ taglib
prefix='c' uri='http://java.sun.com/jsp/jstl/core' %> <%@ taglib prefix='fmt'
uri='http://java.sun.com/jsp/jstl/fmt' %> <%@ taglib prefix='fn'
uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>드로잉썸 | 매니저</title>
    <!-- Bootstrap -->
    <link
      href="../../../vendors/bootstrap/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome -->
    <link
      href="../../../vendors/font-awesome/css/font-awesome.min.css"
      rel="stylesheet"
    />
    <!-- NProgress -->
    <link href="../../../vendors/nprogress/nprogress.css" rel="stylesheet" />
    <!-- iCheck -->
    <link
      href="../../../vendors/iCheck/skins/flat/green.css"
      rel="stylesheet"
    />

    <!-- bootstrap-progressbar -->
    <link
      href="../../../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
      rel="stylesheet"
    />
    <!-- JQVMap -->
    <link href="../../../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
    <!-- bootstrap-daterangepicker -->
    <link
      href="../../../vendors/bootstrap-daterangepicker/daterangepicker.css"
      rel="stylesheet"
    />

    <!-- Custom Theme Style -->
    <link href="../../../css/admin/custom.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="../../../css/admin/question_list.css" />
    <style>
      h1 {
        text-align: center;
        font-family: "Helvetica Neue", Roboto, Arial, "Droid Sans", sans-serif;
        padding-bottom: 50px;
      }
      #box {
        width: 1600px;
        margin: auto;
        margin-top: 100px;
      }
      .pagination > .active > a,
      .pagination > .active > a:focus,
      .pagination > .active > a:hover,
      .pagination > .active > span,
      .pagination > .active > span:focus,
      .pagination > .active > span:hover {
        z-index: 3;
        color: #fff;
        cursor: default;
        background-color: #92a8d1;
        border-color: #92a8d1;
      }
      .btn-primary {
        color: #fff;
        background-color: #92a8d1;
        border-color: #92a8d1;
      }
      th {
        background-color: #92a8d1;
        text-align: center;
      }
      tr {
        height: 50px;
      }
      td {
        text-align: center;
      }
    </style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0">
              <a href="/manager/main" class="site_title"
                ><i class="fa fa-paw"></i> <span>Drawing SSum</span></a
              >
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
            <div
              id="sidebar-menu"
              class="main_menu_side hidden-print main_menu"
            >
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li>
                    <a
                      ><i class="fa fa-home"></i> 홈
                      <span class="fa fa-chevron-down"></span
                    ></a>
                    <ul class="nav child_menu">
                      <li><a href="/manager/main">매니저 홈</a></li>
                      <li><a href="/main">드로잉썸 바로가기</a></li>
                    </ul>
                  </li>
                  <li>
                    <a
                      ><i class="fa fa-edit"></i> 일반회원 관리
                      <span class="fa fa-chevron-down"></span
                    ></a>
                    <ul class="nav child_menu">
                      <li><a href="/manager/man_member_list">일반회원 목록</a></li>
                       
                       
                       
                    </ul>
                  </li>
                  <li>
                    <a
                      ><i class="fa fa-desktop"></i> 사업자회원 관리
                      <span class="fa fa-chevron-down"></span
                    ></a>
                    <ul class="nav child_menu">
                      <li>
                        <a href="/manager/man_ceo_list">사업자회원 목록</a>
                      </li>
                      <li>
                        <a href="/manager/check_ceo">사업자회원 승인 대기 목록</a>
                      </li>
        
                       
                       
                    </ul>
                  </li>

                  <li>
                    <a
                      ><i class="fa fa-desktop"></i> 1:1 문의
                      <span class="fa fa-chevron-down"></span
                    ></a>
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
            <h1 id="title">문의내역</h1>

            <table class="table">
              <tr class="success">
                <th>번호</th>
                <th width="70%">제목</th>
                <th>작성자</th>
                <th>작성일자</th>
                <th>조회수</th>
              </tr>
              <!-- Data가 없는경우 -->
              <c:if test="${ empty list }">
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
                  <td>${vo.no}(${ vo.q_idx })</td>
                  <td>
                    <div class="subject">
                      <!-- 답글에 대한 처리(들여쓰기/ㄴ) -->
                      <!--1인것부터 q_depth 만큼 공백을만들어라  -->
                      <c:forEach begin="1" end="${vo.q_depth}">
                        &nbsp;&nbsp;&nbsp;
                      </c:forEach>
                      <!-- c:if c:forEach (JSTL) -->
                      <c:if test="${ vo.q_depth != 0 }"> ㄴ </c:if>
                      <!-- 사용중인 게시물 -->
                      <c:if test="${ vo.q_use eq 'y'}">
                        <!-- page가 비어 있으면? 페이지를 1 로 줘라  : <= 그렇지 않으면 page를 줘라-->
                        <a
                          href="man_question_view?q_idx=${vo.q_idx}&page=${ (empty param.page) ? 1 : param.page}&search=${ param.search }&search_text=${ param.search_text }"
                          >${vo.q_subject}</a
                        >

                        <!-- 댓글 뱃지 -->
                        <c:if test="${ vo.comment_count > 0}">
                          <span class="badge">답변완료</span>
                        </c:if>
                      </c:if>

                      <!-- 삭제된 게시물 -->
                    </div>
                  </td>
                  <td>${ vo.mem_name }</td>
                  <td>${ fn:substring(vo.q_regdate,0,16) }</td>
                  <td>${ vo.q_readhit }</td>
                </tr>
              </c:forEach>
              <!-- 검색메뉴 -->
              <tr>
                <td colspan="5" align="center">
                  <form class="form-inline">
                    <select class="form-control" id="search">
                      <option value="all">전체</option>
                      <option value="name">이름</option>
                      <option value="subject">제목</option>
                      <option value="content">내용</option>
                      <option value="name_subject_content">
                        이름+제목+내용
                      </option>
                    </select>

                    <input
                      class="form-control"
                      id="search_text"
                      value="${ param.search_text}"
                    />
                    <input
                      class="btn btn-primary"
                      type="button"
                      value="검색"
                      onclick="find();"
                    />
                  </form>
                </td>
              </tr>

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
