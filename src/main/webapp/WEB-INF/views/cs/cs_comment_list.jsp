<%@ page language='java' contentType='text/html;charset=UTF-8'  pageEncoding='UTF-8' %>

<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <style>
        

    </style>

<script>


    
    // 댓글작성
    let global_comment_page = 1;
    
    function comment_insert(){
        //로그인여부체크
        // if("${ empty user }" =="true"){
            
        //     if(confirm("댓글쓰기는 로그인후 가능합니다\n로그인 하시겠습니까?")==false)return;
    
        //     //로그인폼으로 이동
        //     location.href="../member/login_form.do?url=" 
        //                 + encodeURIComponent(location.href);
        //     return;
        // }
    
        let comment_content = $("#comment_content").val().trim();
    
        if(comment_content==""){
            alert("댓글내용을 작성하세요!!");
            $("#comment_content").val("");
            $("#comment_content").focus();
            return;
        }
    
        //댓글쓰기
    $.ajax({
    
            url   : "cs/comment_insert",
            data  : {
                        "q_idx"          : "${ vo.q_idx }",
                        "comment_content": comment_content,
                        "mem_idx"        : "${ user.mem_idx }",
                        "mem_id"         : "${ user.mem_id }",
                        "mem_name"       : "${ user.mem_name }"
                    },
            dataType : "json",
            success  : function(res_data){
                //res_data = {"result" : "success" }
                //res_data = {"result" : "fail" }
                if(res_data.result=="success"){
                
                //이전 댓글내용삭제
                $("#comment_content").val("");
                //댓글목록을 재요청
                comment_list(1);
                }
    
            },
            error    : function(err){
                alert(err.responseText);
            }
        });
    }
    
    //댓글조회
    function comment_list(comment_page){
    
        $.ajax({
            url   : "/cs_comment_list",  // comment_list.do?q_idx=5&page=1
            data  : {
                    "q_idx":"${ vo.q_idx }",
                    "page" : comment_page
                    },
            success: function(res_data){
            
                global_comment_page = comment_page;
    
                //댓글영역 넣어준다
                $("#comment_display").html(res_data);
    
            },
            error  : function(err){
    
                alert(err.responseText);
    
            }        
    
        });
    }
    
    </script> 
     

</head>
<body>
    



    <div id="c_menu"></div>

    <!-- for(CommentVo vo: list ) -->
    <c:forEach var="vo"  items="${ list }">
       <div class="comment_name" >
            <label>드로잉 썸</label>

            <!-- 로그인유저와 글쓴이가 동일하면 보여줘라 -->
     
        </div>
       <div class="comment_regdate">${ fn:substring(vo.comment_regdate,0,16)  }</div>
       <div class="comment_content">${ vo.comment_content }</div>
       <hr>
    </c:forEach>

</body>
</html>