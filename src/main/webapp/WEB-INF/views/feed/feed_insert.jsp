<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>


<!DOCTYPE html>
<html lang="en">

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script>

        function oneday(){

            let d_num = 1;

            $.ajax({


                url : "../day/plus",
                data: {"d_num" :1},
                success : function(day_data){

                    alert('성공');
               var dayPlus = "";

               dayPlus +=`<div id="feed_insert_day"+${p_idx}>
              <input type="hidden" id="${user.mem_idx}" name="${user.mem_idx}" value="${user.mem_idx}">
                
            <div style="font-size: 30px; margin-top: -5%;">1일차
            
            
          
                <input class="btn btn-info" name="popup_test" style="margin-left: 210px; margin-top: 6%; font-size: 20px; color: black;" 
                type="button" value="장소+" onclick="popup_loc()">

                <input class="btn btn-info" name="memo_popup" style="margin-left: 446px; margin-top: 62px; font-size: 20px; color: black;"
                type="button" value="메모+" onclick="popup_memo()">
            </div>
            
         
            <div id="place_insert_day">
                       
                     <span id="p_name" style="margin-left: 90px; font-size: 25px; margin-top: 5px;"></span> 
                    <li id="p_name0" style="margin-left: 90px; font-size: 25px; margin-top: 5px;"></li> 
                    <li id="p_name1" style="margin-left: 90px; font-size: 25px; margin-top: 5px;"></li> 
                    
                         
                         <!-- <span id=p_idx></span> 
                        
                        <input type="hidden" id="p_lat">
                        <input type="hidden" id="p_log">
        
                       
                        <input class="btn btn-danger" type="button" style="margin-left: 450px;" value="삭제" onclick="place_delete()">
                       
                        &nbsp;&nbsp;&nbsp; -->
            </div>
         
      
                    <!-- <div id="memo_content" name="memo_content" style="width: 300px; height: 100%; font-size: 20px; margin-left: 750px; table-layout: fixed;"></div> -->
                
            </div>

            <textarea readonly id="memo_content" style="width: 500px; height: 300px; padding: 5px; 
                                            margin-top: -95px; margin-left: 615px; font-size: 20px; border: 1px solid #F7CAC9;
                                             border-radius: 10px; resize: none;"> </textarea> `;
                        
                                             alert("폼띄우기성공")

                },

                error : function(err){
                
                alert(err.responseText);

        }


            });
        }




    function popup_loc(){
        var url = "location_search";
        var name = "popup_test";
        var option = "height=550 width=800, top = 100, left = 200, location = no, scrollbars = yes";
        var parent = window.open(url, name, option);


    }


    
    // function place_delete(int p_idx){

    //     let p_idx = document.getElementById("p_idx").innerHTML;

    //     if(confirm('정말 삭제 하시겠습니까?')==false)return;

    //     location.href="/place/delete/p_idx=" + p_idx;

    // }

    function place_delete(){

        let p_idx = document.getElementById("p_idx").innerHTML;

        if(confirm('정말 삭제 하시겠습니까?')==false)return;


        $.ajax({

        url  : "../place/delete",
        data : { "p_idx":p_idx  }, 
        success	: function(res_data){ 

           // alert('삭제성공');

            $("#p_name").html(res_data)
                //let html="";

                html +=`<span id="p_name" style="margin-left: 250px; font-size: 25px; margin-top: 5px;">${p_name}</span>
                         <span id="p_idx">${p_idx}</span>`;

            //     `<div id="place_insert_day+${p_idx}">
                       
            //            <span id="p_name" style="margin-left: 250px; font-size: 25px; margin-top: 5px;"></span>
            //                <span id="p_idx">${p_name}</span>
           
                          
            //                <input class="btn btn-danger" type="button" style="margin-left: 50px;" value="삭제" onclick="place_delete()">
                          
            //                &nbsp;&nbsp;&nbsp;
            //    </div>`;
                    
                           

            //<span id="p_name+p_idx" style="margin-left: 250px; font-size: 25px; margin-top: 5px;">프로스트</span>

            //$("#delete_p_name").html(res_data.p_name);

            },

            error		: function(err){
                
                alert(err.responseText);

        }

              });
             

            }
     
       function popup_memo(){

            
            //global_p_idx = p_idx;
            
            var window_width = $(window).width();   //browser폭
            var popup_width  = $("#popup").width(); //popup폭
            
            //팝업윈도우가 중앙에 올수 있도록 left위치 계산
            var left = window_width/2 - popup_width/2;
            $("#popup").css("left", left);
            $("#popup").show();
               
        }//end:memo_popup()
      
      </script> 

<script>
    function img_home_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/main";
        
    }
    function main_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/main";
        
    }

    function insert_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="../feed/feed_insert";
        
    }

    function feed_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/feed/feed";
        
    }

    function my_feed_page(){

        if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	  location.href="/feed/my_feed";
        
    }

    // function main_page(){

    //     if(confirm("작성중 이동시 정보가 저장되지 않습니다.\n이동하시겠습니까?")==false)return;
	  
	//   location.href="/main";
        
    // }



</script>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Drawing SSum</title>

    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../css/style.css">

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
    <div class="top-header-area bg-img bg-overlay" style="background-image: url(../../../img/bg-img/header.jpg);">
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
        <a href="#" onclick="img_home_page();">  <img src="../../img/core-img/DrawingSSum.png" alt="" style="width: 500px; height: 130px"></a>
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
                                <li><a href="#" onclick="main_page();">Home</a></li>

                                <li><a href="#" onclick="insert_page();">코스 그리기</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="#" onclick="feed_page();">피드</a></li>
                                <li><a href="#">고객센터</a>
                            </ul>

                            <!-- 로그인/회원가입 -->
                            <c:if test="${empty sessionScope.user}">
                                <!-- 로그인/회원가입 -->
                                <div class="login-area">
                                    <a href="/member/login">Login / Register</a>
                                </div>
                            </c:if>

                            <c:if test="${not empty sessionScope.user}">
                                <div class="login-area">
                                    <a href="/member/logout">Logout</a>
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
    <a href="#" onclick="my_feed_page();">내 피드</a>
    <br>
    <br>
    <br>
    <a href="#">내 예약</a><br>
    <br>
    <br>
    <a href="#">내 쿠폰</a><br>
    <br>
    <br>
    <a href="/mypage/mypage">내 정보</a>

</div>
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->



<!-- 내용 삽입 부분-->

<!-- 메모추가 펍업 -->
 <%@include file="feed_memo_popup.jsp"%> 


<link rel="stylesheet" href="../../css/feed/feed_search.css">
<input type="hidden" name="mem_idx" value="${param.mem_idx}">

<div id="insert_outline">
    <form>
        <div id="feed_insert_theme">
            <input type="hidden" id="${user.mem_idx}" name="${user.mem_idx}" value="${user.mem_idx}">
            <div style="font-size: 30px;">어떤 코스를 그리시나요?</div><br>
            <label style="margin-left: 180px;">
                <input role="switch" type="checkbox" />
                <span>#데이트</span>
              </label>
              &nbsp; &nbsp; &nbsp;
             

            <label>
                <input role="switch" type="checkbox" />
                <span>#맛집</span>
              </label>
              &nbsp; &nbsp; &nbsp;

            <label>
                <input role="switch" type="checkbox" />
                <span>#힐링</span>
              </label>
              &nbsp; &nbsp; &nbsp;
              
            <label>
                <input role="switch" type="checkbox" />
                <span>#추억</span>
              </label>
              &nbsp; &nbsp; &nbsp;
            <label>
                <input role="switch" type="checkbox" />
                <span>#가족</span>
              </label>
              &nbsp; &nbsp; &nbsp;

            <label>
                <input role="switch" type="checkbox" />
                <span>#우정</span>
              </label>
              <hr>


              <div style="font-size: 30px; padding: 5px;">
                <label id="p_addr"></label><label>여행</label>
            </div>
          

 
            <div id="feed_insert_date">
                시작날짜 :
               <input style="border: 1px solid white;" type="date" value="날짜">
               마지막날짜 :
               <input style="border: 1px solid white;" type="date" value="날짜">
            </div>
            <hr>

            <div id="feed_insert_map">
                지도 api
            </div>
            <hr>

            
            <input class="btn btn-info" type="button" value="1일차+" style="margin-left: 500px;"  onclick="oneday()">

       <!-- <div id="feed_insert_day"+${p_idx}>
            <input type="hidden" id="${user.mem_idx}" name="${user.mem_idx}" value="${user.mem_idx}">
                
            <div style="font-size: 30px; margin-top: -5%;">1일차
            
            
          
                <input class="btn btn-info" name="popup_test" style="margin-left: 210px; margin-top: 6%; font-size: 20px; color: black;" 
                type="button" value="장소+" onclick="popup_loc()">

                <input class="btn btn-info" name="memo_popup" style="margin-left: 446px; margin-top: 62px; font-size: 20px; color: black;"
                type="button" value="메모+" onclick="popup_memo()">

            </div>
            
         
            <div id="place_insert_day">
                       
                     <span id="p_name" style="margin-left: 90px; font-size: 25px; margin-top: 5px;"></span> 
                    <li id="p_name0" style="margin-left: 90px; font-size: 25px; margin-top: 5px;"></li> 
                    <li id="p_name1" style="margin-left: 90px; font-size: 25px; margin-top: 5px;"></li> 
                    
                         
                         <span id=p_idx></span> 
                        
                        <input type="hidden" id="p_lat">
                        <input type="hidden" id="p_log">
        
                       
                        <input class="btn btn-danger" type="button" style="margin-left: 450px;" value="삭제" onclick="place_delete()">
                       
                        &nbsp;&nbsp;&nbsp;
            </div>
         
      
                  
                
            </div>

            <textarea readonly id="memo_content" style="width: 500px; height: 300px; padding: 5px; 
                                            margin-top: -95px; margin-left: 615px; font-size: 20px; border: 1px solid #F7CAC9;
                                             border-radius: 10px; resize: none;"> </textarea> 

            <hr>
            

          
            <hr>

            <div id="feed_insert_mainSubject">
                
                    <label style="font-size: 30px;">내  용</label>
                    <textarea class="form-control" rows="8" id="feed_insert_content" 
                    placeholder="
                    

                                                                어떤 여행이 되고 싶나요?"></textarea>
                
            </div>

            
        </div> -->
                <div>
                    <label><input class="btn btn-info" type="button"  style="margin-bottom: -920px; margin-left: 550px; font-size: 15px;" value="등록하기" 
                        onclick="insert(this.form)"></label>
                    
                </div>
                




    </form>
</div>



<!-- Footer/ 수정금지-->
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
                        <li><a href="#" onclick="main_page();">Home</a></li>

                                <li><a href="#" onclick="insert_page();">코스 그리기</a></li>
                                <li><a href="#">국내</a></li>
                                <li><a href="#">해외</a></li>
                                <li><a href="#" onclick="feed_page();">피드</a></li>
                                <li><a href="#">고객센터</a>
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