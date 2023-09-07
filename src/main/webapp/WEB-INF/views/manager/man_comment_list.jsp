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
                /* 댓글창 */
        #comment_content{
        width: 80%;
        height:200px;
        resize: none;
        padding: 5px;
        float: left;
        }
        .comment_name{
            font-size: 10px;
            position: relative;
        }
        
        .comment_regdate{
            font-size: 10px;
            color: rgb(173, 170, 170);
        }

        .comment_content{
            font-size: 11px;
            color: black;
        }

    </style>

<script>

        function comment_del(comment_idx,q_idx){

            if(confirm("정말 삭제하시겠습니까?")==false) return;


            //여기서 삭제처리 하면 된다(Ajax)
            $.ajax({
                url     : "man_comment_delete",
                data    : {
                            "comment_idx" : comment_idx,
                            "comment_page": global_comment_page,
                            "q_idx"       : q_idx
                          },
                dataType: "json",
                success : function(res_data){
                    //res_data = {"result" : "success", "comment_page": "2" }

                    if(res_data.result == "success"){
                        comment_list(res_data.comment_page);
                    }
                },
                error   : function(err){
                    alert(err.responseText);
                }
            });

        } 

    </script>


</head>
<body>
    

    <!-- 페이징메뉴 -->


    <div id="c_menu">

     <!-- 댓글입력창 -->
<c:if test="${ empty list }">
     <div>
        <textarea id="comment_content" 
                    placeholder=""></textarea>   
        <input    id="comment_btn" type="button" value="답변하기"
                    onclick="comment_insert();"   >
    </div>
</c:if>



    <!-- for(CommentVo vo: list ) -->
    <c:forEach var="vo"  items="${ list }">
       <div class="comment_name" >
            <label>${ vo.mem_name }(${ vo.mem_id })</label>

            <!-- 로그인유저와 글쓴이가 동일하면 보여줘라 -->
            <c:if test="${ user.mem_idx eq vo.mem_idx }">
                <div style="position: absolute; right: 5px;">
                    <input type="button" value="x" 
                           onclick="comment_del('${vo.comment_idx}','${ vo.q_idx }');">
                </div>
            </c:if>
        </div>
       <div class="comment_regdate">${ fn:substring(vo.comment_regdate,0,16)  }</div>
       <div class="comment_content">${ vo.comment_content }</div>
       <hr>
    </c:forEach>
<div>

</body>
</html>