<%@page import="com.e.sports.entities.User"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Schedule</title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            .bg-image {
                background-image: url("img/tennis Court bg image.jpg");
                background-size: cover;
                background-position: center;
                height: 100%;
                width: 100%;
            }
        </style>
    </head>
    <body class="body">
        <!--Header of the page-->
        <%@include file="header.jsp" %>
        <!--End of the header-->
        <!--nav bar-->
        <%//getting current user from session
            User user = (User) session.getAttribute("currentUser");
            if (user == null) {
        %>
        <%@include file="normal_navbar.jsp" %>
        <%} else {%>
        <%@include file="logedin_user_navbar.jsp" %>
        <%}%>
        <!--<--- Showing Schedule ---->
        <div class="bg-image">
            <div style="display: grid;
                 grid-template-columns: 1fr 1fr; /* Two columns with equal width */
                 grid-gap: 1vh; color:white; font-size: 1rem; padding-top: 40px;   /* Add some spacing between the columns */">
                <div style="margin-left: auto; margin-right: auto;">
                    <h2 style="color:red;">Indoor Game Schedule</h2>
                    <table border="2px" class="table">
                        <tr>
                            <th>Games</th>
                            <th>Day</th>
                            <th>Time</th>
                        </tr>
                        <%
                            final Connection con = ConnectionProvider.getConnection();
                            String query = "SELECT c_name, days, timing FROM schedule_mst INNER JOIN course_mst ON schedule_mst.c_id=course_mst.c_id WHERE course_mst.c_category='Indoor Games' ORDER BY c_name; ";
                            PreparedStatement p = con.prepareStatement(query);
                            ResultSet rs = p.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td> <%= rs.getString(1)%> </td>
                            <td><%= rs.getString(2)%></td>
                            <td><%= rs.getString(3)%></td>
                        </tr>
                        <% }%>
                    </table>
                </div>
                 <div style="margin-left: auto; margin-right: auto;">
                    <h2 style="color:red;">Indoor Game Schedule</h2>
                    <table border="2px" class="table">
                        <tr>
                            <th>Games</th>
                            <th>Day</th>
                            <th>Time</th>
                        </tr>
                        <%

                            String query2 = "SELECT c_name, days, timing FROM schedule_mst INNER JOIN course_mst ON schedule_mst.c_id=course_mst.c_id WHERE course_mst.c_category='Outdoor Games' ORDER BY c_name; ";
                            PreparedStatement p2 = con.prepareStatement(query2);
                            ResultSet rs2 = p2.executeQuery();
                            while (rs2.next()) {
                        %>
                        <tr>
                            <td> <%= rs2.getString(1)%> </td>
                            <td><%= rs2.getString(2)%></td>
                            <td><%= rs2.getString(3)%></td>
                        </tr>
                        <% }%>
                    </table>
                    </div>
            </div>         
  </div>
         <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>
    </body>
         <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    </body>
</html>
