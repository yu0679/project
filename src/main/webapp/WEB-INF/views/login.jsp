<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Title</title>

  <link rel="stylesheet" href="../../css/login.css">

  <script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
      container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
      container.classList.remove("right-panel-active");
    });
  </script>
</head>
<body>

<div id="loginForm">
  <div class="container" id="container">
    <div class="form-container sign-up-container">
      <form action="#">
        <h1 class="hh">Create Account</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your email for registration</span>
        <input type="text" placeholder="Name" class="iii"/>
        <input type="email" placeholder="Email" class="iii"/>
        <input type="password" placeholder="Password" class="iii"/>
        <button>Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in-container">
      <form action="#">
        <h1 class="hh" style="color: black">Sign in</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span style="color: dimgray">or use your account</span>
        <input type="email" placeholder="Email" class="iii"/>
        <input type="password" placeholder="Password" class="iii"/>
        <a href="#" class="aa" style="color: dimgray">아이디나 비밀번호를 잊으셨나요?</a>
        <button>로그인</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1 class="hh">Welcome Back!</h1>
          <p class="pp">To keep connected with us please login with your personal info</p>
          <button class="ghost" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h5 style="margin-bottom: 0">함께 그리는 Something!</h5>
          <h1 class="hh">Drawing SSUM</h1>
          <p class="pp">지금 바로 회원가입하시고<br>다양한 혜택을 누리세요!</p>
          <button class="ghost" id="signUp">회원가입</button>
        </div>
      </div>
    </div>
  </div>
</div>


</body>
</html>