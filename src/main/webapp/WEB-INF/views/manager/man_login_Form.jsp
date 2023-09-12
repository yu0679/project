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

            <div th:if="${param.error}">
              Invalid username and password.
          </div>
          <div th:if="${param.logout}">
              You have been logged out.
          </div>
            
            <form th:action="@{/manager/man_login}" method="POST">
              <h1>Manager</h1>
              <div>
                <input type="text" class="form-control"  placeholder="Username" name="username" required="" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" name="password" required="" />
              </div>
            <div>
                <a class="btn btn-default submit" type="submit">Login</a>
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
