<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8'%>

<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn'  uri='http://java.sun.com/jsp/jstl/functions'%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>드로잉썸(Drawing SSum)</title>

    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.jpg">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../css/style.css">

    <link rel="stylesheet" href="../css/accommodation/payment.css">
    

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/css/uikit.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/js/uikit-icons.min.js"></script>

    
<style type="text/css">


    #top{
                margin-top: 50px;
                margin-bottom: 50px;
            }
       
    
    
    
      #box{
          width: 800px;
          margin: auto;
          margin-top: 60px;
      }
      
      button,input[type='button']{
           width: 150px;
      }
     
     
       table{
        border: 1px solid black;
        border-left: 1px solid white;
        border-right: 1px solid white;
        border-bottom: 1px solid lightgrey;
           border-collapse: collapse;
         
       } 
       
    
       
       th{
           
        width: 500px;
        height: 50px;
        text-align: right;
        padding:10px;
          
        background-color: white;
        border: 1px solid black;
        border-left: 1px solid white;
        border-right: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
           border-collapse: collapse;
       
       }
       
       td{
       
        text-align: center;
        width: 1000px;
        height: 50px;
          
           border: 1px solid black;
        border-left: 1px solid lightgrey;
        border-right: 1px solid white;
        border-bottom: 1px solid lightgrey;
           border-collapse: collapse;
           
       }
      
      #style1{
       text-align : center;
       height: 150px;  
           
      }
     
      
      .imgs_wrap{
	min-height:200px;
	border:1px solid #888;
    }



      
     
    </style>
    
    <script>
        function send(f){

            let room_name = f.room_name.value.trim();
            let room_price = f.room_price.value.trim();
            let room_people = f.room_people.value.trim();
            let room_service = f.room_service.value.trim();
            let room_cancel = f.room_cancel.value.trim();
            

            f.action = "room_insert.do";
            f.submit();

        }

    </script>


   <!-- 파일업로드 CSS -->
   <style>
      #att_zone{
            width: 660px;
            min-height:150px;
            padding:10px;
            border:1px dotted #00f;
        }
        #att_zone:empty:before{
            content : attr(data-placeholder);
            color : #999;
            font-size:.9em;
        }

   </style>






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
  <div class="top-header-area bg-img bg-overlay" style="background-image: url(../../img/bg-img/header.jpg);">
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

                              <li><a href="#">숙소상품등록</a></li>

                              <li><a href="#">쿠폰등록</a>
                              </li>

                              <li><a href="#">해외</a>
                              </li>
                              <li><a href="../../single-post.html">피드</a></li>
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


	

  <div>
        <form  method="POST" enctype="multipart/form-data">  
            <input type="hidden" name="acc_idx"  value="${param.acc_idx}">
            <div id="box" >
              <div ><h4 style= "text-align : left ">방상품등록</h4> </div>
              
               <table>
                <tr>
                    <th bgcolor = gainsboro >방이름</th>
                    <td><input class="uk-input uk-form-width-large" type="text"  aria-label="Large" id="room_name" name="room_name"  value="${param.room_name }" style= "border: 1px solid lightgrey">
                    <br>
                    </td>
                </tr>
                <tr>
                    <th  bgcolor=gainsboro>가격</th>
                    <td><input class="uk-input uk-form-width-large"   aria-label="Large"  id="room_price" name="room_price"   style= "border: 1px solid lightgrey"  >
                    <br>
   
                    </td>

                </tr>
                <tr>
                    <th  bgcolor=gainsboro>수용가능 인원</th>
                    <td><input class="uk-input uk-form-width-large"   aria-label="Large"  id="room_people" name="room_people"   style= "border: 1px solid lightgrey"  >
                    <br>
   
                    </td>

                </tr>
                
<!-- ##############  사진:시작 ################-->
                <tr>
                      <th bgcolor = gainsboro >방사진</th>
                      <td  style="height: 200px">
                       
                        <div id='image_preview'>
                            <input type='file' id='btnAtt' multiple='multiple'  name="room_photo_name"/>
                            <div id='att_zone' 
                                  data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                        </div>
                        <!-- <script src="js/fileupload.js"></script> -->
<!-- fileupload script start  -->
                        <script>
                            ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
                            imageView = function imageView(att_zone, btn){
                            
                                var attZone = document.getElementById(att_zone);
                                var btnAtt = document.getElementById(btn)
                                var sel_files = [];
                                
                                // 이미지와 체크 박스를 감싸고 있는 div 속성
                                var div_style = 'display:inline-block;position:relative;'
                                            + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
                                // 미리보기 이미지 속성
                                var img_style = 'width:100%;height:100%;z-index:none';
                                // 이미지안에 표시되는 체크박스의 속성
                                var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                                            + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
                            
                                btnAtt.onchange = function(e){
                                var files = e.target.files;
                                var fileArr = Array.prototype.slice.call(files)
                                for(f of fileArr){
                                    imageLoader(f);
                                }
                                }  
                                
                            
                                // 탐색기에서 드래그앤 드롭 사용
                                attZone.addEventListener('dragenter', function(e){
                                e.preventDefault();
                                e.stopPropagation();
                                }, false)
                                
                                attZone.addEventListener('dragover', function(e){
                                e.preventDefault();
                                e.stopPropagation();
                                
                                }, false)
                            
                                attZone.addEventListener('drop', function(e){
                                var files = {};
                                e.preventDefault();
                                e.stopPropagation();
                                var dt = e.dataTransfer;
                                files = dt.files;
                                for(f of files){
                                    imageLoader(f);
                                }
                                
                                }, false)
                                
                            
                                
                                /*첨부된 이미리즐을 배열에 넣고 미리보기 */
                                imageLoader = function(file){
                                sel_files.push(file);
                                var reader = new FileReader();
                                reader.onload = function(ee){
                                    let img = document.createElement('img')
                                    img.setAttribute('style', img_style)
                                    img.src = ee.target.result;
                                    attZone.appendChild(makeDiv(img, file));
                                }
                                
                                reader.readAsDataURL(file);
                                }
                                
                                /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
                                makeDiv = function(img, file){
                                var div = document.createElement('div')
                                div.setAttribute('style', div_style)
                                
                                var btn = document.createElement('input')
                                btn.setAttribute('type', 'button')
                                btn.setAttribute('value', 'x')
                                btn.setAttribute('delFile', file.name);
                                btn.setAttribute('style', chk_style);
                                btn.onclick = function(ev){
                                    var ele = ev.srcElement;
                                    var delFile = ele.getAttribute('delFile');
                                    for(var i=0 ;i<sel_files.length; i++){
                                    if(delFile== sel_files[i].name){
                                        sel_files.splice(i, 1);      
                                    }
                                    }
                                    
                                    dt = new DataTransfer();
                                    for(f in sel_files) {
                                    var file = sel_files[f];
                                    dt.items.add(file);
                                    }
                                    btnAtt.files = dt.files;
                                    var p = ele.parentNode;
                                    attZone.removeChild(p)
                                }
                                div.appendChild(img)
                                div.appendChild(btn)
                                return div
                                }
                            }
                            )('att_zone', 'btnAtt')
                            
                            </script>   



                    
<!-- fileupload script end -->
                      </td>
                </tr>
<!-- ##############  사진:끝 ################-->
                
                

               <tr>
                      <th  bgcolor=gainsboro>방 서비스</th>
                      <td><input class="uk-input uk-form-width-large"   aria-label="Large"  id="room_service" name="room_service"  style= "border: 1px solid lightgrey">
                      <br>
                      </td>
                  </tr>
                  
                  <tr>
                      <th  bgcolor=gainsboro>방 취소규정</th>
                      <td><input class="uk-input uk-form-width-large" type="text"  aria-label="Large"  name="room_cancel"   style= "border: 1px solid lightgrey" ></td>
                  </tr>
    
                 </table>
                      
                      
                  <div style="text-align: center;">
                          <br>
                            
                              <input class="uk-button uk-button-primary uk-button-large" type="button"  value="등록하기"
                                      onclick="send(this.form); return false;">     
                                     
                              <input class="uk-button uk-button-secondary uk-button-large" type="button"  value="숙소 목록보기"
                                     onclick="location.href='roomlist'">
                    </div>
                  </div> 
         </form>  	
        </div>


            <footer class="footer-area">
              <hr>
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



