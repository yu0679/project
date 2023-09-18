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
     color: black;  
     position: absolute; 
     top: 0px;
     position: fixed;
     z-index: 1000;
     display: none;
     opacity : 0.9;
     
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


<body >

   <link rel="stylesheet" href="../../../css/feed/feed_search.css">

  <div id="popup" style="overflow-X:hidden">

     <div style="text-align: right;">

        <input class="btn btn-danger" style="font-size: 20px; "  type="button"  value="x" onclick="hide_popup();">
     </div>
     
     <a href="/main"><img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 300px; height: 100px; margin-left: 200px;"></a>


     <div id="insert_outline">
         <form>
             <div id="feed_insert_theme">
                 <div style="font-size: 30px;">어떤 코스를 그리시나요?</div><br>
                 <label style="margin-left: 180px;">
                     <input role="switch" type="radio" />
                     <span>#데이트</span>
                   </label>
                   &nbsp; &nbsp; &nbsp;
                  
     
                 <label>
                     <input role="switch" type="radio" />
                     <span>#맛집</span>
                   </label>
                   &nbsp; &nbsp; &nbsp;
     
                 <label>
                     <input role="switch" type="radio" />
                     <span>#힐링</span>
                   </label>
                   &nbsp; &nbsp; &nbsp;
                   
                 <label>
                     <input role="switch" type="radio" />
                     <span>#추억</span>
                   </label>
                   &nbsp; &nbsp; &nbsp;
                 <label>
                     <input role="switch" type="radio" />
                     <span>#가족</span>
                   </label>
                   &nbsp; &nbsp; &nbsp;
     
                 <label>
                     <input role="switch" type="radio" />
                     <span>#우정</span>
                   </label>
                   <hr>
     
     
                   <div style="font-size: 30px; padding: 5px;">
                     <label>부산여행</label>
                 </div>
               
     
                 <!-- <div id="feed_insert_date">
                     <a href="#" onclick="cal_popup('${ vo.p_idx }');"><label style="font-size: 30px;">날짜</label></a>
                 </div> -->
                 <div id="feed_insert_date">
                    <input style="border: 1px solid white;" type="date" value="날짜">
                 </div>
                 <hr>
     
                 <div id="feed_insert_map">
                     지도 api
                 </div>
                 <hr>
     
                 <div id="feed_insert_day">
                    
     
                     <input class="btn btn-info" style="margin-left: 268px; margin-top: 6%; font-size: 25px; color: black;" type="button" value="">
                         
                         &nbsp;&nbsp;&nbsp;
     
                     <input class="btn btn-info" style="margin-left: 446px; margin-top: 62px; font-size: 25px; color: black;" type="button" value="">
     
                     <div style="font-size: 30px; margin-top: -11%;">1일차</div>
                     
                 </div>
                 <hr>
                 
     
                 <div id="feed_insert_day">
                    
     
                     <input class="btn btn-info" style="margin-left: 268px; margin-top: 6%; font-size: 25px; color: black;" type="button" value="장소+" 
                     onclick="find_addr()">
                         
                         &nbsp;&nbsp;&nbsp;
     
                     <input class="btn btn-info" style="margin-left: 446px; margin-top: 62px; font-size: 25px; color: black;"type="button" value="메모+" 
                      onclick="memo_popup('${ vo.p_idx }');">
     
                     <div style="font-size: 30px; margin-top: -11%;">2일차</div>
                     
                 </div>
                 <hr>
     
                 <div id="feed_insert_mainSubject">
                     
                         <label style="font-size: 30px;">내  용</label>
                         <textarea class="form-control" rows="8" id="feed_insert_content" 
                         placeholder="
                         
     
                                                          어떤 여행이 되고 싶나요?"></textarea>
                     
     
                 </div>
                 
                 <div>
                  <label><input class="btn btn-danger" type="button"  style="margin-top: 230px; margin-left: 550px; font-size: 15px;" value="닫기" 
                        onclick="hide_popup();"></label>
                    
                </div>
                 
     
                   
     
             </div>
     
     
     
         </form>
     </div>
     
  </div>

</body>
</html>