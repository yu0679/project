<%@ page language='java' contentType='text/html;charset=UTF-8'  pageEncoding='UTF-8' %>

<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>


<style>

</style>
<script>

        function comment_del(comment_idx,q_idx){

            if(confirm("정말 삭제하시겠습니까?")==false) return;


            //여기서 삭제처리 하면 된다(Ajax)
            $.ajax({
                url     : "/manager/man_comment_delete",
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

        <!-- for(CommentVo vo: list ) -->
        <c:forEach var="vo"  items="${ list }">
        <div class="comment_name" >
                <label>${ vo.mem_name }(${ vo.mem_id })</label>
                        <input    type="button" value="x" 
                            onclick="comment_del('${vo.comment_idx}','${ vo.q_idx }');">
            </div>
        <div class="comment_regdate">(${ fn:substring(vo.comment_regdate,0,16)  })</div>
        <br>
        <div class="comment_content">${ vo.comment_content }</div>
        </c:forEach>


        <!-- 댓글입력창 -->
        <c:if test="${ empty list }">
        
            <textarea id="comment_content" 
                    placeholder=""></textarea>   
    </c:if>
</div>
</body>
</html>