<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function find_addr() {

new daum.Postcode({
    oncomplete: function (data) {

        $("#mem_zipcode").val(data.zonecode);
        $("#addr1").val(data.address);

    }
}).open();
}

function ajaxFileUpload() {
            $("#ajaxFile").click();
        }

        function setThumbnail(event) {
            var reader = new FileReader();

            reader.onload = function (event) {


                $("#myimg").attr("src", event.target.result);
            };

            reader.readAsDataURL(event.target.files[0]);
        }

</script>
<script>



$(document).ready(function($) {

$(".scroll_move").click(function(event){         

        event.preventDefault();

        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

});

});
</script>
<style type="text/css">

  #popup{
   
     width: 1350px;
     height: 100%;
     border: 2px solid #F7CAC9;
     
    
     background: white;
     color: black;  
     position: absolute; 

     position: fixed;
     z-index: 1000;
     display: none;
     border-radius: 5px;
     
  }
  
  #popup > img{
     width: 288px;
     height: 280px;
     border: 1px solid #cccccc;
     outline: 1px solid white;
     margin-top: 10px;
     margin-bottom: 10px;
  }
  
  #popup > p{
    
    border: 1px solid #cccccc;
    padding: 5px;
  }
  
  #feed_content{
    min-height: 60px;
  }


  #feed_subjects{

      width: 150px;
      height: 100px;
      border: 5px solid #F7CAC9;
      margin: 0 auto;
      margin-top: 5px;
      border-radius: 30px;
      
      background-color: white;
  }

</style>

<script type="text/javascript">

  function hide_popup(){

	  $("#popup").hide();
	  
  }

</script>




</head>


<body >
   <link rel="stylesheet" href="../../../css/feed/feed_search.css">
  <div id="popup" style="overflow-X:hidden">
     <div style="text-align: right;">
        <input class="btn btn-danger"  type="button"  value="x" onclick="hide_popup();">
     </div>

     <img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 300px; height: 100px; margin-left: 2px; border: 1px solid white;">
      

     <div>

      <img src="../../img/profile-img/루피.jpg" style="width: 100px; height:100px; margin-left: 950px; margin-top: 10px; border-radius: 50px;" >
      <input type="file" id="ajaxFile" name="photo" style="display:none;" onchange="setThumbnail(event);">
      <div><input class="uk-button uk-button-default uk-button-small" type="button" value="사진 수정"
                  style="width: 59px;background: white; border: 1px solid lightgray; border-radius: 5px; height: 30px; font-size: smaller;
margin-top: 10px; margin-bottom: 3px; margin-left: 973px"
                  onclick="ajaxFileUpload();"></div>
  </div>   
  
  <br>
  <div style="font-size: 20px; margin-left: 10px; padding: 5px;">
  
      <div>
          <span >아이디</span><span  style="margin-right: 70px"></span>
  
          
              
                  <span><input type="text"  placeholder="wooseong1001"></span>  
             
      </div>
      <hr>
      <div>
          <span>닉네임</span><span  style="margin-right: 70px"></span>
  
          
         
              <span><input type="text"  placeholder="야캬캬"></span>
  
          
  
      </div>
  
      <hr>
  
  
      <div>
          <span>이름</span><span  style="margin-right: 84px"></span>
  
          <span><input type="text" placeholder="진우승"></span>
  
      </div>
  
      <hr>
      <div>
         
              <span rowspan="3">주소</span><span  style="margin-right: 84px"></span>
    
      </div>
  
      <div style="margin-left: 128px;">

            <input type="text" name="mem_zipcode" id="mem_zipcode" style="width: 57px" readonly class="addr">
                    <input type="button" value="우편번호"
                           onclick="find_addr()"
                           style="width: 105px; background:white; border: 1px solid lightgray; height: 30px; font-size: smaller;"><br>
                

                <input type="text" name="mem_addr" id="addr1" style="width: 350px;" readonly class="addr" placeholder="서울시 구로구 석천빌딩">기본주소<br>
            
            
                <input type="text" name="mem_addr" id="addr2" style="width: 350px; margin-bottom: 30px"
                           class="addr"  placeholder="석천빌딩 7층 인크레파스">나머지주소
                
                          
  
      </div>
      <hr>
  
  
      <div>
          <span>휴대전화</span><span class="star" style="margin-right: 40px"></span>
  
         
  
              <span><input type="text" " placeholder="010-1111-1111"></span>
      </div>
  
      <hr>
      <div>
         <span>이메일</span><span style="margin-right: 55px"></span>
          
              <span><input type="text" style="width: 285px;" placeholder="wooseong1001@naver.com"></span>
         
  
      </div>
  
      <hr>
          <div>
          <span>파트너 ID</span>
          <span style="margin-right: 31px"></span>
          
          <span><input type="text"  placeholder="qweqwe123"></span>
  
  
          </div>
  
  
  </div>
  
  <hr>
  <div id="mypage_modify">
      <input class="btn btn-danger" type="button" style="margin-left: 560px; font-size: 20px; margin-top: 10px;" value="등록하기" onclick="mypage_modify('${ vo.p_idx }');">
  
     
  </div>


     



  
  </div>

</body>
</html>