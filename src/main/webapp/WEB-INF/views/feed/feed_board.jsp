<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap3.x 설정 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




<style type="text/css">

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


</head>


<body >

   <link rel="stylesheet" href="../../../css/feed/feed_search.css">

  <div>

    
     <a href="/main"><img src="../../../img/core-img/DrawingSSum.png" alt="" style="width: 300px; height: 100px;"></a>


     <div id="insert_outline"  style="overflow: auto; width: 1400px;">
         <form>
           <div id="feed_insert_theme">
            <c:forEach var="vo" items="${total_list}">
               <p>
                <label style="font-size: 50px; color: #F7CAC9;" >${vo.p_addr.substring(0,2)}여행</label>
                <div style="font-size: 40px;  " >제목</div>
                <div style="font-size: 30px; border: 5px solid  #F7CAC9; border-radius: 15px;">${vo.b_subject}</div>
                <hr>
                <div style="font-size: 30px; ">내용</div>
                <textarea style="width:1200px; height: 260px; font-size: 30px; resize: none; border: 5px solid  #F7CAC9; border-radius: 15px;" readonly>${vo.b_content}</textarea>
                <div style="margin-left: 900px; font-size: 30px;">시작일:${vo.b_start.substring(0,10)}</div>
                <div style="margin-left: 900px; font-size: 30px;">종료일:${vo.b_end.substring(0,10)}</div>

                    <c:forEach var="day" items="${vo.day_list}">
                      <div style="font-size: 30px; border: 5px solid #F7CAC9; border-radius: 15px;">${day.d_num}일차
                      <li style="font-size: 30px; ">${vo.p_name}</li>
                    </div>
                    <!-- <div style="font-size: 30px; ">메모</div>
                  <textarea style="width:1200px; height: 260px; font-size: 30px; resize: none; border: 5px solid  #F7CAC9; border-radius: 15px;" readonly>${vo.memo_content}</textarea>
                         -->
                    
                    </p>
                  </c:forEach>
              </c:forEach>

               <!-- <c:forEach var="vo" items="${total_list}">
                 <div style="font-size: 30px;">${vo.b_subject}</div><br>
                  <div></div>
                   <hr>
     
     
                   <div style="font-size: 30px; padding: 5px; color: #F7CAC9;">
                     <label >${vo.p_addr.substring(0,2)}여행</label>
                 </div>
                 
                 
                 <div id="feed_insert_date">
                   <div>시작일:${vo.b_start.substring(0,10)}</div>
                   <div>종료일:${vo.b_end.substring(0,10)}</div>
                  </div>
                </c:forEach>

                 <hr>
     
                 <div id="feed_insert_map">
                     지도 api
                 </div>
                 <hr>
                 <c:forEach var="vo" items="${total_list}">
                  <div>${vo.d_num}일차</div>
                  <div>${vo.p_name}</div>
                 </c:forEach>

                 <hr>

                 <c:forEach var="vo" items="${total_list}">
                 <div id="feed_insert_mainSubject">
                     
                         <label style="font-size: 30px;">내  용</label>
                         <textarea class="form-control" rows="8" id="feed_insert_content" readonly
                         placeholder="
                         
     
                                                          ${vo.b_content}"></textarea>    
                 </div>
                </c:forEach>
                
                
              -->
              </div>
              
              
            </form>
          </div> 
          <div>
           <label><input class="btn btn-danger" type="button"  style="margin-top: 10px; margin-left: 650px; font-size: 25px;" value="목록보기" 
                 onclick="location.href='../feed/my_feed.do'"></label>
             
         </div>
     
  </div>

</body>
</html>