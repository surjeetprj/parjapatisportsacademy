<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.e.sports.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy Course</title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
    </head>
    <body>
         <%@include file="header.jsp" %>
        <!--End of header-->
        <%@include file="logedin_user_navbar.jsp" %>
        <!--nav bar end-->
        <h1>Make Payment</h1>
        <%
        String id = request.getParameter("c_id");
        String name = request.getParameter("c_name");
        String price = request.getParameter("c_price");
        String duration = request.getParameter("c_duration");
        %>
        <div class="container mb-4" style="min-height:189px;">
            <div>
                <table border="2px" class="table">
                    <tr>
                        <th>Course Id</th>
                        <th>Course Name</th>
                        <th>Total Amount</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= price %></td>
                        <td><a href="BuyCourseServlet?c-id=<%= id%>&c-duration=<%= duration %>" type="button" class="btn btn-success">Pay</a></th>
                     </tr>
                </table>
            </div> 
        </div>
         <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>              
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script src="JavaScript/UserProfile.js"></script>
    </body>     
</html>
