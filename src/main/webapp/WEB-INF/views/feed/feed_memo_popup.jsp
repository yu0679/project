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

<script>

var d_idx;
var d_num;
var memo_idx;
var b_idx;

  function memo_insert(f){

    let memo_content = f.memo_content.value;
    let mem_idx = f.mem_idx.value;

        if(memo_content==''){
            alert("메모를 입력하세요");
            f.memo_content.value='';
            f.memo_content.focus();
            return;
        }
        console.log(b_idx);
        $.ajax({

        url  : "../day/memo_insert",
        data : { "memo_content":memo_content, "mem_idx":mem_idx,"d_num":d_num,"d_idx":d_idx, "b_idx":b_idx}, 
        success	: function(res_data){
          // PlaceVo vo => {  }

            memo_content = res_data.memo_content;
            memo_idx     = res_data.memo_idx;
            d_idx        = res_data.d_idx;
            d_num        = res_data.d_num;
            mem_idx      = mem_idx;

            //alert('등록성공:' + memo_content + 'memo_idx:'+memo_idx);   
           

            $("#memo_content_" + d_num).html(memo_content);
           
            setTimeout(function() {
              $("#popup").hide();
                    }, 500);
       
          
        },
        error		: function(err){
            
            alert(err.responseText);
    
    
    
}


});
}



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
  <form>
   <link rel="stylesheet" href="../../../css/feed/feed_search.css">
  <div id="popup">

  

    <input type="hidden"  name="mem_idx" value="${user.mem_idx}">
    <input type="hidden" id="d_num" name="d_num" value="${d_num}" >
    <input type="hidden" id="d_idx" name="d_idx" value="${d_idx}" >
    <input type="hidden" id="b_idx" name="b_idx" value="${b_idx}">
 
     <div style="text-align: right;">
        <input class="btn btn-danger"  type="button"  value="x" onclick="hide_popup();">
     </div>

     <img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 300px; height: 100px; margin-left: 1px; border: 1px solid white;">
      
    
        
      <textarea class="form-control" rows="8" id="feed_insert_memo_content" name="memo_content"
      placeholder="잊지 말아야 할것이 있나요? 여기에 메모해 주세요."></textarea>

      
      <div style="margin-top: 5px;">
      <input type="button" class="btn btn-info" value="등록하기" onclick="memo_insert(this.form)">
      <input type="button" class="btn btn-danger" value="닫기" onclick="hide_popup()">
    </div>


     


   
  
  </div>
</form>
</body>
</html>