<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/css/uikit.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.16.22/dist/js/uikit-icons.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>






    <style type="text/css">




        #top{
            margin-top: 50px;
            margin-bottom: 50px;
        }




        #box{
            width: 800px;
            margin: auto;
            margin-top: 60px;
        }

        button,input[type='button']{
            width: 150px;
        }


        table{
            border: 1px solid black;
            border-left: 1px solid white;
            border-right: 1px solid white;
            border-bottom: 1px solid lightgrey;
            border-collapse: collapse;


        }



        th{

            width: 500px;
            height: 50px;
            text-align: right;
            padding:10px;

            background-color: white;
            border: 1px solid black;
            border-left: 1px solid white;
            border-right: 1px solid lightgrey;
            border-bottom: 1px solid lightgrey;
            border-collapse: collapse;

        }

        td{

            text-align: center;
            width: 1000px;
            height: 50px;

            border: 1px solid black;
            border-left: 1px solid lightgrey;
            border-right: 1px solid white;
            border-bottom: 1px solid lightgrey;
            border-collapse: collapse;

        }

        #style1{
            text-align : center;
            height: 150px;

        }


    </style>




    <script type = "text/javascript">

        function check_id(){
            //
            var mem_id= $("#mem_id").val();

            var reg_id = /^[a-zA-Z]([0-9|a-z|A-Z]){7,11}$/;


            if(!reg_id.test(mem_id)){
                //   alert("아이디는 영문자, 숫자 8-12 글자로 입력가능합니다.");
                $("#id_message").html("아이디는 영문자, 숫자 8-12 글자로 입력가능합니다.").css("color","red");
                return;
            }

            //서버: 아이디 중복체크
            $.ajax({

                url : "../member/check_id.do",         //MemberCheckIdAction
                data: {"mem_id" : mem_id},    //parameter=> check_id.
                dataType : "json",
                success : function(res_data){
                    //res_data={"result":true} or {"result" : false}
                    if(res_data.result==true){

                        $("#id_message").html("사용가능한 아이디 입니다").css("color","blue");

                    }else{

                        $("#id_message").html("이미 사용중인 아이디 입니다").css("color","red");


                    }

                },

                error : function(err){

                    alert(err.responseText);


                }


            })

        } //end-check_id

        function check_pwd(){

            var mem_pwd= $("#mem_pwd").val();
            var reg_pwd=/^(?=.*[a-zA-Z])(?=.*[\~\․\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\|\\\;\:\\'\"\<\>\,\.\?\/])(?=.*[0-9]).{7,15}$/;


            if(!reg_pwd.test(mem_pwd)){
                $("#pwd_message").html("비밀번호는 영문자로 시작, 숫자 및 특수기호 !@#$%^&*-_+=? 포함 8-15 글자입니다.").css("color","red");

                return;
            }


            $("#pwd_message").html("사용가능한 비밀번호 입니다").css("color","blue");


        }

        function check_pwd_check(){
            var mem_pwd= $("#mem_pwd").val();
            var mem_pwd_check=$("#mem_pwd_check").val();

            if(mem_pwd_check!=mem_pwd){
                $("#pwd_check_message").html("비밀번호가 일치하지 않습니다").css("color","red");

                return;

            }

            $("#pwd_check_message").html("비밀번호가 일치합니다").css("color","blue");



        }





        function check_e_mail(){

            var mem_e_mail = $("#mem_e_mail").val();
            var reg_e_mail = /^[a-zA-Z]{1}[a-zA-Z0-9.\-_]+@[a-z0-9]{1}[a-z0-9\-]+[a-z0-9]{1}\.(([a-z]{1}[a-z.]+[a-z]{1})|([a-z]+))$/

            if(!reg_e_mail.test(mem_e_mail)){
                $("#e_mail_message").html("이메일을 형식에 맞게 입력해주세요").css("color","red");

                return;
            }
            $("#e_mail_message").html("사용가능한 이메일 입니다").css("color","blue");

        }

        function find_addr(){

            new daum.Postcode({
                oncomplete: function(data) {

                    $("#mem_zipcode").val(data.zonecode);
                    $("#mem_addr").val(data.address);

                }
            }).open();
        }



        function send(f) {

            var mem_photo = f.mem_photo.value;
            var mem_id = f.mem_id.value.trim();
            var mem_pwd = f.mem_pwd.value.trim();
            var mem_pwd_check = f.mem_pwd_check.value.trim();
            var mem_name = f.mem_name.value.trim();
            var mem_e_mail = f.mem_e_mail.value.trim();
            var mem_num = f.mem_num.value.trim();
            var mem_addr = f.mem_addr.value.trim();
            var mem_detailed_addr = f.mem_detailed_addr.value.trim();
            var mem_zipcode = f.mem_zipcode.value.trim();



            if (mem_pwd_check==''){

                alert('비밀번호를 확인하세요')
                f.mem_pwd_check.value='';
                f.mem_pwd_check.focus();
                return;
            }


            if (mem_name==''){

                alert('이름을 입력하세요')
                f.mem_name.value='';
                f.mem_name.focus();
                return;
            }



            if (mem_num==''){

                alert('번호 입력하세요')
                f.mem_num.value='';
                f.mem_num.focus();
                return;
            }
            if (mem_addr==''){

                alert('주소를 입력하세요')
                f.mem_addr.value='';
                f.mem_addr.focus();
                return;
            }

            if (mem_detailed_addr==''){

                alert('상세주소를 입력하세요')
                f.mem_detailed_addr.value='';
                f.mem_detailed_addr.focus();
                return;
            }

            f.action="../member/registra.do";
            f.submit();
        }



    </script>

    <script type="text/javascript">


        function ajaxFileUpload() {
            $("#ajaxFile").click();
        }

        function setThumbnail(event) {
            var reader = new FileReader();

            reader.onload = function(event) {


                $("#myimg").attr("src",event.target.result);
            };

            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

</head>

<body>





<form  method="POST" enctype="multipart/form-data">
    <div id="box" >
        <div ><h4 style= "text-align : left ">회원가입</h4> </div>

        <table>

            <tr>
                <th bgcolor = gainsboro >사진</th>
                <td  style="height: 200px">

                    <center><img src="../image/profileimg.png" width="250" height="300" id="myimg" > </center>
                    <input type="file" id="ajaxFile" name="mem_photo"  style="display:none;" onchange="setThumbnail(event);">
                    <input  class="uk-button uk-button-default uk-button-small" type="button"  value="사진 추가"  style= "border: 1px solid grey "   onclick="ajaxFileUpload();"></td>
            </tr>

            <tr>
                <th bgcolor = gainsboro >아이디</th>
                <td><input class="uk-input uk-form-width-large" type="text"  aria-label="Large" id="mem_id" name="mem_id"  value="${param.mem_id }" style= "border: 1px solid lightgrey" placeholder="*아이디는 영문자, 숫자 8-12 글자로 입력가능합니다."
                           onkeyup="check_id();">
                    <br>
                    <span id="id_message"></span>

                </td>
            </tr>
            <tr>
                <th  bgcolor=gainsboro>비밀번호</th>
                <td><input class="uk-input uk-form-width-large"   aria-label="Large" type="password" id="mem_pwd" name="mem_pwd"   style= "border: 1px solid lightgrey" placeholder="*비밀번호는 영문자로 시작, 숫자 및 특수기호 !@#$%^&*-_+=? 포함 8-15 글자입니다."
                           onkeyup="check_pwd();">
                    <br>
                    <span id="pwd_message"></span>
                </td>
            </tr>

            <tr>
                <th  bgcolor=gainsboro>비밀번호 확인</th>
                <td><input class="uk-input uk-form-width-large"   aria-label="Large" type="password" id="mem_pwd_check" name="mem_pwd_check"  style= "border: 1px solid lightgrey"
                           onkeyup="check_pwd_check();">
                    <br>
                    <span id="pwd_check_message"></span>
                </td>
            </tr>

            <tr>
                <th  bgcolor=gainsboro>이름</th>
                <td><input class="uk-input uk-form-width-large" type="text"  aria-label="Large"  name="mem_name"   style= "border: 1px solid lightgrey" ></td>
            </tr>

            <tr>
                <th  bgcolor=gainsboro>이메일</th>
                <td><input class="uk-input uk-form-width-large" type="text"  aria-label="Large"  id= "mem_e_mail" name="mem_e_mail"  style= "border: 1px solid lightgrey"
                           onkeyup="check_e_mail();" >
                    <br>
                    <span id="e_mail_message"></span>
                </td>
            </tr>

            <tr>
                <th  bgcolor=gainsboro>휴대폰 번호</th>
                <td><input class="uk-input uk-form-width-large" type="text" aria-label="Large"  name="mem_num"  style= "border: 1px solid lightgrey" ></td>
            </tr>

            <tr>
                <th  bgcolor=gainsboro>우편번호</th>
                <td><input class="uk-input uk-form-width-large"  aria-label="Large"  id="mem_zipcode"  name=" mem_zipcode"  style= "border: 1px solid lightgrey " size="300" >
                    <br>
                    <input class="uk-button uk-button-default uk-button-small" type="button"   value="검색"  style= "border: 1px solid grey "
                           onclick="find_addr();"> </td>
            </tr>

            <tr>
                <th  bgcolor=gainsboro>주소</th>
                <td><input class="uk-input uk-form-width-large"  aria-label="Large"  id="mem_addr"  name="mem_addr"  style= "border: 1px solid lightgrey " size="300" >

            </tr>
            <tr>
                <th  bgcolor=gainsboro>상세주소</th>
                <td><input class="uk-input uk-form-width-large" type="text" aria-label="Large"  id="mem_detailed_addr" name="mem_detailed_addr"  style= "border: 1px solid lightgrey" ></td>
            </tr>


        </table>


        <div style="text-align: center;">
            <br>
            <!--  <input class="btn btn-primary" type="button"  value="로그인"
                    onclick="send(this.form);"> -->

            <!-- <button> or <input type="image"> onsubmit()자동호출
                 onsubmit()방지 : onclick="send(this.form); return false;"
            -->
            <input class="uk-button uk-button-primary uk-button-large" type="button"  value="회원가입"
                   onclick="send(this.form); return false;">

            <input class="uk-button uk-button-secondary uk-button-large" type="button"  value="목록보기"
                   onclick="location.href='list.do'">
        </div>
    </div>
</form>

</body>
</html>