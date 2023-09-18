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
    <title>드로잉썸(Drawing SSum)</title>

    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.jpg">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="../../css/style.css">
    <!-- 고객센터Stylesheet -->
    <link rel="stylesheet" href="../../../css/cs/insertcs.css">


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







<script>



    function send(f){

        let subject = f.subject.value.trim();
        let contents  = f.contents.value.trim();



        if(subject==''){
            alert("제목을 입력해 주세요");
            f.subject.value='';
            f.subject.focus();
            
            return;
        }

        if(contents ==''){
            alert("내용을 입력해 주세요");
            f.contents .value='';
            f.contents .focus();
            
            return;
        }

        if($("input[name='agree']:checked").length == 0 ){

            alert("개인정보 수집·이용에 대한 안내 동의가 필요합니다.");
            
            return;
}

        f.action = "cs_question_insert";
        f.submit();

        // //Ajax insert ->결과수신->success(Model띄우기)->이전페이지
        // $.ajax({
        //     async: false,
        //     url  : 'cs_question_insert',
        //     data : {'contents': contents, 'subject':subject},
        //     dataType: 'json',
        //     success : function(res_data){
                
        //             location.href='cs?category_num=c001&modal=yes';

        //     },
        //     error : function(err){
        //         alert(err.responseText);
        //     }
        // });


        //location.href='cs?category_num=c001&modal=yes';
        


        
        

    }
    $(document).ready(function () {
    // 파일 업로드 입력 폼 선택
    var inputFile = $('#infoFile');

    // 파일이 선택되었을 때 이벤트 핸들러 등록
    inputFile.change(function () {
        // 선택된 파일 가져오기
        var file = this.files[0];
        if (file) {
            // 업로드된 파일 크기 계산 (단위: MB)
            var fileSizeMB = file.size / (1024 * 1024); // 바이트를 메가바이트로 변환

            if (fileSizeMB > 10) {
                // 업로드된 파일 크기가 50MB를 초과하는 경우 경고 메시지 표시
                alert('파일 크기는 10MB 이하여야 합니다.');
                // 파일 업로드 초기화
                inputFile.val('');
            } else {
                // 업로드된 용량 표시 업데이트
                $('#uploadSize').text(fileSizeMB.toFixed(2) + 'MB');

                // 업로드 진행 상황 표시 업데이트 (사용자 정의)
                // 여기서는 업로드된 파일의 크기를 최대 용량인 50MB로 나눠 진행 상황을 표시합니다.
                var progress = (fileSizeMB / 10) * 100;
                $('#uploadProgress').css('width', progress + '%');
            }
        } else {
            // 선택된 파일이 없으면 초기화
            $('#uploadSize').text('0MB');
            $('#uploadProgress').css('width', '0%');
        }
    });
});

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

                                <li><a href="#">코스 그리기</a></li>

                                <li><a href="#">국내</a>
                                </li>

                                <li><a href="#">해외</a>
                                </li>
                                <li><a href="../../single-post.html">피드</a></li>
                                <li><a href="#">고객센터</a>
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
<!-- ##### Treading Post Area End ##### -->
<!-- 이후부터 내용 변경하세요-->



<article class="cont_public" id="mArticle">
    <h2 class="screen_out" id="kakaoBody"> 고객센터 본문 </h2>
    <h3 class="tit_public"> 문의하기 </h3>
    <span class="txt_required">
            *필수입력 사항
        </span>
    

    <!-- request -->
    
        <div class="question_cont">
            <form method="POST" enctype="multipart/form-data">
                <fieldset>




                        <!-- 문의내용 입력필드-->
                        
<dl class="info_question">
    <dt>
        <label class="lab_info" for="subject">
            문의 제목 *
            <span class="screen_out">필수입력 사항</span>
        </label>
    </dt>
    <dd>
        <div class="wrap_item wrap_id">
            <span class="txt_placeholder"></span>
            <input autocomplete="off" class="input" id="subject" name="q_subject" aria-required="true" type="text" maxlength="20"
            placeholder="제목을 입력해 주세요(20자 이내)"
        >
        </div>


    </dd>
</dl>

<dl class="info_question" >
    <dt>
        <label class="lab_info" for="contents" >
            문의 내용
        </label>
    </dt>
 
</dl>
<div  class="wrap_item wrap_tf click_event" >
    <textarea class="inp_info tf_info" cols="24" rows="50" id="contents" name="q_content" required="required" style=" line-height:normal "  aria-required="true"></textarea>
</div>




<!-- 첨부파일 필드-->
                        
<!-- 개인정보 첨부파일 필드-->

<!-- // 개인정보 첨부파일 필드-->
<div>
<dl class="info_question">
    <dt>
        <label class="lab_info" for="infoFile">
            파일 첨부
        </label>
    </dt>
    <dd id="fileList">
        <div class="wrap_upload wrap_file" id="fileInput">
            <span class="txt_placeholder">첨부파일 추가</span>
            <span class="ico_cs ico_file"></span>
            <input class="inp_file" id="infoFile" name="photo" data-required="false" data-file-idx="0" type="file">
        </div>
        <div class="wrap_file_info" data-file-info-idx="0"></div>
        <div class="wrap_thumbnail" data-thumb-div-idx="0" style="display: none;"></div>
        <div class="wrap_upload wrap_bar">
            <strong class="screen_out">업로드된 용량</strong>
            <span class="info_range">
                <span class="range_on" style="width:0%"  id="uploadProgress"></span>
              </span>
            <span class="txt_upload"  id="uploadSize">0MB</span>
        </div>
        <p class="desc_info">10MB까지 등록 가능합니다.</p>
    </dd>
</dl>
</div>

                        <!-- 동의 안내 영역-->
                        
<!-- 만 14세 미만 동의 안내 -->

<!-- // 만 14세 미만 동의 안내 -->

<div class="info_agree" id="info_agree">
    <h4 class="tit_agree">개인정보 수집·이용에 대한 안내</h4>

    <strong class="desc_agree_sub">(필수) 개인정보 수집·이용에 대한 안내</strong>
    <p class="desc_agree">???는 이용자 문의를 처리하기 위해 다음과 같이 개인정보를 수집 및 이용하며, 이용자의 개인정보를 안전하게 취급하는데 최선을 다하고 있습니다.</p>

    <table class="tbl_privacy">
        <caption class="ir_caption">개인정보 수집·이용에 대한 안내</caption>
        <colgroup>
            <col>
            <col>
            <col>
        </colgroup>
        <thead>
        <tr>
            <th scope="col" style="width:270px;">수집항목</th>
            <th scope="col" style="width:220px;" class="tbl_border_left">수집목적</th>
            <th scope="col" style="width:260px;" class="tbl_border_left">보유기간</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>이메일 주소, 휴대폰 번호</td>
                <td class="tbl_border_left" rowspan="1">문의・요청・불편사항 확인 및 처리결과 회신</td>
                <td class="tbl_border_left txt_bold">3년간 보관 후 지체없이 파기</td>
            </tr>
            
        </tbody>
    </table>
    <p class="desc_agree">위 동의를 거부 할 권리가 있으며, 동의를 거부하실 경우 문의 처리 및 결과 회신이 제한됩니다.</p>

    <p class="desc_more">더 자세한 내용에 대해서는 <a class="link_blue" href="http://www.kakao.com/ko/privacy" target="_blank">??? 개인정보처리방침</a>을 참고하시기 바랍니다.</p>

    <div class="wrap_check">
        <span class="item_check">
          <input class="inp_check agreement" id="agree" name="agree" type="checkbox">
          <label class="lab_check" for="agree"><span class="ico_cs required_check">
          </span>위 내용에 동의합니다.</label>
        </span>
    </div>

    
</div>


                        <div class="wrap_btn">
                            <input class="btn_cs btn_cs2" type="button"  style="background-color:#F7CAC9"  onclick="send(this.form);" value="문의접수">
                        </div>
                    
                </fieldset>
            </form>
        </div>
    
    <!-- //request -->
</article>




<!-- Footer/ 수정금지-->
<!-- ##### Footer Area Start ##### -->
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




</body>

</html>