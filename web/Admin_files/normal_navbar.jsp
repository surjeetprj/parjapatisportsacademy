<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
        <li class="nav_hover"> <a class="nav-link text-white" href="../index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li> 
      <li class="nav-item dropdown nav_hover">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square-o "></span> Courses </a>
        <div class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-white" href="../IndoorGames.jsp">Indoor Games </a>
          <a class="dropdown-item text-white" href="../OutdoorGames.jsp">Outdoor Games</a>
        </div>
      </li>
      <li class="nav-item nav_hover">
          <a class="nav-link text-white" href="../Schedule.jsp"> <span class="fa fa-calendar" aria-hidden="true"></span> Schedule</a>
      </li>
      <li class="nav_hover"> <a class="nav-link text-white" href="../Show_Gallery.jsp"> <span class="fa fa-file-image-o"></span> Gallery</a></li>
       <li class="nav_hover"><a class="nav-link text-white" href="../About_Us.jsp"> <span class="fa fa-address-card"></span> About Us</a></li>
      <li class="nav_hover"><a class="nav-link text-white" href="../Feedback_NormalUser.jsp"> <span class="fa fa-comment-o"></span> Feedback</a></li>
       <li class="nav-item nav_hover">
          <a class="nav-link text-white" href="../login_page.jsp"> <span class="fa fa-user-circle"></span>Login</a>
      </li>
      <li class="nav-item nav_hover">
          <a class="nav-link text-white" href="../registration_page.jsp"> <span class="fa fa-user-plus"></span>SignUp</a>
      </li>
      <li class="nav-item nav_hover" id="admin-login-page">
          <a class="nav-link text-white" href="Admin_files/Admin_login.jsp"> <span class="fa fa-user-plus"></span>Admin Login</a>
      </li>
    </ul>
  </div>
</nav>
<script>
   // code to toggle search input box 
    adminLogin = document.getElementById("admin-login-page");
    pathName = window.location.pathname;
    if(("/E_Sports/Admin_files/Admin_login.jsp" === pathName)){
    adminLogin.style.display = "none";
    }
    else{ searchForm.style.display = "flex";}
</script>