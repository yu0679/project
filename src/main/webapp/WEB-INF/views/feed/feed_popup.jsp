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
   
     width: 100%;
     height: 100%;
     border: 2px solid white;
    
     background: white;
     color: white;  
     position: absolute; 
     top: 0px;
     position: fixed;
     z-index: 1000;
     display: none;
     
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

      width: 1500px;
      height: 100%;
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


<body>

  <div id="popup">
     <div style="text-align: right;">
        
        
        <input class="btn btn-danger"  type="button"  value="x" onclick="hide_popup();">
     </div>
     
     <a href="/main"><img src="../../img/core-img/DrawingSSum.png" alt="" style="width: 300px; height: 100px; margin-left: 200px;"></a>
      
     <div id="feed_subjects">
         <p id="feed_subject">제목</p>
         <p id="feed_content">내용</p>
         <p id="feed_regdate">등록일자</p>

    </div>
     <div  id="div_job"  style="text-align: center; display:none; ">
        <input class="btn btn-info"   type="button" value="수정"
               onclick="modify_form();"> 
        <input class="btn btn-danger" type="button" value="삭제" 
               onclick="del_photo();"> 
     </div>
  </div>

</body>
</html>