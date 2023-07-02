<%@page import="com.e.sports.entities.Admin"%>
<%
    Admin adminNav = (Admin) session.getAttribute("currentAdmin");
%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav_hover"> <a class="nav-link text-white" href="Admin_profile.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
           <li class="nav-item dropdown nav_hover">
                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square-o "></span> Courses </a>
                <div class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item text-white" href="Courses_Indoor_G.jsp">Indoor Games </a>
                    <a class="dropdown-item text-white" href="Courses_Outdoor_G.jsp">Outdoor Games</a>
                </div>
            </li>
            <li class="nav-item dropdown nav_hover">
                <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-calendar "></span> Schedule </a>
                <div class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item text-white" href="Schedule_Indoor_G.jsp">Indoor Games Schedule </a>
                    <a class="dropdown-item text-white" href="Schedule_Outdoor_G.jsp">Outdoor Games Schedule</a>
                </div>
            </li>
            <li class="nav_hover"> <a class="nav-link text-white" href="Gallery.jsp"> <span class="fa fa-file-image-o"></span> Gallery</a></li>
            <li class="nav_hover"> <a class="nav-link text-white" href="Payment_Status.jsp"> <i class="bi bi-wallet-fill"></i> Payment Status</a></li>
             <li class="nav-item dropdown nav_hover">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-user-plus "></span> Users </a>
        <div class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-white" href="Registered_Users.jsp">Registered Users </a>
          <a class="dropdown-item text-white" href="Enrolled_Users.jsp">Enrolled Users</a>
        </div>
      </li>
      <li class="nav-item dropdown nav_hover">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-comment-o"></span> Feedback </a>
        <div class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-white" href="Feedback_NormalUser.jsp">Normal Users Feedback </a>
          <a class="dropdown-item text-white" href="Feedback_RegisteredUser.jsp">Registered Users Feedback </a>
        </div>
      </li>
     </ul>
        <ul class="navbar-nav mr-rigth" id="profile-link-logOutBotton" style="display: none;">
            <li class="nav-item active nav_hover" >
                <a class="nav-link" href="profile-modal" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span>
                    <%               if (adminNav != null) {%><%= adminNav.getName()%><% }
                    %>
                </a>
            </li>
            <li class="nav-item active nav_hover">
                <a class="nav-link" href="../AdminLogoutServlet"> <span class="fa fa-user-plus"></span>Logout</a>
            </li>
        </ul>
    </div>
    <!-- Button trigger modal -->
    <!-- Modal -->
    <div class="modal fade"  id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog"  role="document" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">E-parjapati Sports Acadamy</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <h5 class="modal-title" id="exampleModalLabel" mt-3> <%if (adminNav != null) {%><%=adminNav.getName().toUpperCase()%><% }%></h5>
                        <!--profile details-->
                        <div id="profile-detail">
                            <div id="personal-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%if (adminNav != null) {%><%=adminNav.getEmail()%><% }%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Name:</th>
                                            <td><%if (adminNav != null) {%><%=adminNav.getName()%><% }%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Contact no. :</th>
                                            <td><%if (adminNav != null) {%><%=adminNav.getContact()%><% }%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </nav>
                    <script>
                        // toggle admin profile link and logout button
                        profileLinkButton = document.getElementById("profile-link-logOutBotton");
                        pathName = window.location.pathname;
                        if (("/E_Sports/Admin_files/Admin_login.jsp" === pathName)) {    
                        }
                        else {
                            profileLinkButton.style.display = "flex";
                        }
                    </script>