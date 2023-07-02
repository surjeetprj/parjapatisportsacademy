<%@page import="com.e.sports.dao.EnrolledUserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.entities.Courses"%>
<%@page import="com.e.sports.dao.CourseDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Index page</title>
        <!--css-->
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
        <%@include file="normal_navbar.jsp" %>
        <!--//Outdoor games...-->
        <!--image sliders-->
        <div>
        <%@include file="image_slider.html" %>
        </div>
        <div style="background-color:darkgray; color: white; text-align: center; font-size: 5vh; height:8vh">Our Courses</div>
        <div class="container mt-4 mb-4">
            <!--// SHOWING OUTDOOR GAMES-->
         <!--Cards-->
        <div class="row">
        <%
            // Initializing CourseDao Object with Connection to database
            CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
            // Initializing EnrolledUserDao Object with Connection to database
             EnrolledUserDao EnUserDao = new EnrolledUserDao (ConnectionProvider.getConnection());
            // Intializing list
             List<Courses> listCourse = null;
            // getting courses from db
            listCourse = courseDao.GetCourse("Outdoor Games");
            for (Courses c : listCourse) { 
        %>        
        <div class="col-md-3">
            <div class="card">
                <img class="card-img-top" src="Course-img/<%=c.getImage() %>" alt="Card image cap" height="239vh" width="180vh">
                <div class="card-body">
                    <h5 class="card-title text-center"> <%=c.getName() %> </h5>
                    <p class="card-text"><%=c.getDetails() %></p>
                </div>
                <div class="card-footer">
                    <div style="display: flex; justify-content: flex-start; align-item:center;">
                    <% 
                    int totalPurchase=EnUserDao.TotalPurchase(c.getId());
                    %>
                        <h6 style="color: red;">
                       Buyers purchased : <%= totalPurchase%>
                    </h6>
                    </div>
                    <div style="display: flex; justify-content: flex-end;   ">
                    <h6 class="m-2 ">₹<%=c.getPrice() %></h6>
                    <a href="BuyCourse.jsp"  class="btn btn-success" >Buy</a>
                    </div>
                </div>
            </div> 
        </div>  
        <%
            }
        %>
        </div>
        </div>
<!--// Indoor Games...-->
 <div class="container mt-4">
         <!--Cards-->
        <div class="row">
        <%
            // getting courses form db
            listCourse = courseDao.GetCourse("Indoor Games");
            for (Courses c : listCourse) { 
        %>        
       <div class="col-md-3">
            <div class="card">
                <img class="card-img-top" src="Course-img/<%=c.getImage() %>" alt="Card image cap" height="239vh" width="180vh">
                <div class="card-body">
                    <h5 class="card-title text-center"> <%=c.getName() %> </h5>
                    <p class="card-text"><%=c.getDetails() %></p>
                </div>
                 <div class="card-footer">
                    <div style="display: flex; justify-content: flex-start; align-item:center;">
                    <% // getting total number of purchased users
                    int totalPurchase=EnUserDao.TotalPurchase(c.getId());
                    %>
                        <h6 style="color: red;">
                       Buyers purchased : <%= totalPurchase%>
                    </h6>
                    </div>
                    <div style="display: flex; justify-content: flex-end;   ">
                    <h6 class="m-2 ">₹<%=c.getPrice() %></h6>
                    <a href="BuyCourse.jsp"  class="btn btn-success" >Buy</a>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
         %>
        </div>
        </div>
        <!--// Including footer-->
        <%@include file="Footer.jsp" %>
        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    <body>
</html>
