<%@ page language='java' contentType='text/html;charset=UTF-8'  pageEncoding='UTF-8' %>

<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn'   uri='http://java.sun.com/jsp/jstl/functions' %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentelella Alela! | </title>
    <!-- Favicon -->
    <link rel="icon" href="../../img/core-img/favicon.jpg">
<style>




h1 {
    font: 400 25px Helvetica,Arial,sans-serif;
    letter-spacing: -.05em;
    line-height: 20px;
    margin: 10px 0 30px;
}

</style>


    <!-- Bootstrap -->
    <link href="../../../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../../../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../../../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../../../vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../../../css/admin/custom.min.css" rel="stylesheet">
  </head>
  
  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">

            <c:if test="${param.error}">
              <div>
                Invalid username and password.
              </div>
            </c:if>

            <c:if test="${param.logout}">
              <div>
                  You have been logged out.
              </div>
            </c:if>
            
            <form action="/manager/man_login" method="POST">
              <h1>Manager</h1>
              <div>
                <input type="text" class="form-control"  placeholder="Username" name="username" required=""/>
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" name="password" required="" />
              </div>
            <div>
                <input class="btn btn-default submit" type="submit" value="Login" style="margin-left: 140px;"                >
            </div>

            

              <div class="separator">
             

                
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i>Drawing SSum</h1>
                </div>
              </div>
              
          </section>
        </div>
      </div>
    </div>

  </body>
</html>
