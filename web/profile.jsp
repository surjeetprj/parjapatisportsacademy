<%@page import="com.e.sports.dao.EnrolledUserDao"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.entities.Courses"%>
<%@page import="com.e.sports.dao.CourseDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.e.sports.entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> 
            <%= user.getName()%>
        </title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--header of the page-->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <%@include file="logedin_user_navbar.jsp" %>
        <!--nav bar end-->
        <!--// MESSAGE RESPONSE-->
        <%@include file="../Common_Files/Message_response.jsp" %>
        <div class="container mb-4"style="min-height: 250px;">
            <div class="bg-light">
                <h4><font-face>Your Courses</font-face></h4>
            </div>    
            <div class="row">
                <% 
                // initialisin Dao object
                EnrolledUserDao enUserDao = new EnrolledUserDao(ConnectionProvider.getConnection());
                List<Integer> list = new ArrayList<>();
                // geting list of course id  where user enrolled
                list = enUserDao.GetCidByUid(user.getId());
                CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
                for(Integer cId : list){
                 Courses course = new Courses();
                 course = courseDao.getCourseById("select * from course_mst where c_id="+cId); 
                %>
                <div class="col-md-3">
                    <div class="card mt-3">
                    <img class="card-img-top" src="Course-img/<%= course.getImage() %>" alt="Card image cap" height="225vh" width="225vh">
                    <div class="card-body">
                        <h5 class="card-title"><%= course.getName() %></h5>
                        <% // getting expiry date 
                        String expiryDate = enUserDao.GetExpiryDate(cId, user.getId());
                        %>
                        <h6 style="float :right;">Expiry Date: <font color="red"><%= expiryDate %></font></h6>
                     </div>
                    </div>
                </div>
              <%} %>
              <% if(list.size() == 0){%>
              <p>Your are not enrolled !!</p>
                <%}%>
            </div>
        </div>
            <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>
        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script src="JavaScript/UserProfile.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    </body>
</html>
<%}%>
