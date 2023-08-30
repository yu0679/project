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
   
     width: 500px;
     height: 500px;
     border: 2px solid #F7CAC9;
    
     background: white;
     color: white;  
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

<style>
#memo_subject{

  border: 1px solid red;
  border-radius: 30px;
  width: 600px;
  height: 500px;
}

</style>


</head>


<body>
  <link rel="stylesheet" href="../../css/feed/feed_search.css">
  <div id="popup">
     <div style="text-align: right;">
        <input class="btn btn-danger"  type="button"  value="x" onclick="hide_popup();">
     </div>

     <img src="../../img/core-img/DrawingSSum.png" alt="" style="width: 300px; height: 100px; margin-left: 2px; border: 1px solid white;">
      
    
  
                
      <label style="font-size: 30px;">내  용</label>
      <textarea class="form-control" rows="8" id="feed_insert_memo_content" 
      placeholder="잊지 말아야 할것이 있나요? 여기에 메모해 주세요."></textarea>
  


     



  
  </div>

</body>
</html>