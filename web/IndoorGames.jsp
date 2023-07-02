<%@page import="com.e.sports.dao.EnrolledUserDao"%>
<%@page import="com.e.sports.entities.User"%>
<%@page import="com.e.sports.dao.CourseDao"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.entities.Courses"%>
<%@page import="com.e.sports.dao.UserDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indoor games</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <!--Header of the page-->
        <%@include file="header.jsp" %>
        <!--End of the header-->
        <!--nav bar-->
        <%//getting current user from session
             User user = (User)session.getAttribute("currentUser");
             if(user == null){
            %>
        <%@include file="normal_navbar.jsp" %>
        <%}else{%>
        <%@include file="logedin_user_navbar.jsp" %>
        <%}%>
        <!--nav bar ends-->
        
        <div class="container mt-4 mb-4">
            <div class="bg-light">
                <h4><font-face>Indoor Games Courses</font-face></h4>
            </div>
         <!--Cards-->
        <div class="row">
            <% 
             
           int uId =1;
            if(user != null){ uId = user.getId(); }
            // initialising dao..
            EnrolledUserDao enUserDao = new EnrolledUserDao(ConnectionProvider.getConnection());
            CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
            List<Courses> listCourse = null;
            // getting courses form db
            listCourse = courseDao.GetCourse("Indoor Games");
            for (Courses c : listCourse) { 
        %>        
        <div class="col-md-3 mt-3">
            <div class="card">
                <img class="card-img-top" src="Course-img/<%=c.getImage() %>" alt="Card image cap" height="239vh" width="180vh">
                <div class="card-body">
                    <h5 class="card-title text-center"> <%=c.getName() %> </h5>
                    <p class="card-text"><%=c.getDetails() %></p>
                    
                </div>
                    <div>
                        <h6 class="ml-3">Duration: <%= c.getDuration() %> months </h6> 
                    </div>
                    
                <div class="card-footer" style="display: flex; justify-content: flex-end;">
                    <% 
                    
                   boolean b = enUserDao.CheckbyUidAndCid(c.getId(), uId);
                    if(!b){
                    %>
                    <h6 class="m-2 ">₹<%=c.getPrice() %></h6>
                    <% String link ="BuyCourse.jsp?c_id="+c.getId()+"&c_name="+c.getName()+"&c_price="+c.getPrice()+"&c_duration="+ c.getDuration(); %>
                    <a href="<%= link%>"  class="btn btn-success" >Buy</a>
                     <% }else{ %>
                       <h6 class="m-2 ">Purchased</h6>
                             <%} %>
                </div>
            </div>
        </div>   
       <%} %>
        </div>
        </div>
        <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>
        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script src="JavaScript/UserProfile.js"></script>
    </body>
</html>
