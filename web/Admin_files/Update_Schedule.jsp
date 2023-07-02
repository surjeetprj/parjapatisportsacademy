<%@page import="com.e.sports.entities.Schedule"%>
<%@page import="com.e.sports.dao.ScheduleDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Admin"%>
<%
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert New Schedule</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--INCLUDING HEADER AND ADMIN NAVBAR-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>
        <%
            int cId = Integer.parseInt(request.getParameter("c-id"));
            String category = request.getParameter("c-category");
            // storing cId into session..
            session.setAttribute("UpdateScheduleCid", cId);
            session.setAttribute("UpdateScheduleCategory", category);
            // stablishing connection of database to schedudule dao
            ScheduleDao scheduleDao = new ScheduleDao(ConnectionProvider.getConnection());
            Schedule schedule = null;
            schedule = scheduleDao.GetScheduleByCid(cId);
        %>
        <div  class="container mt-3" style="width:80vh; padding:5px; background-color: #fff; border:1px solid black; border-radius: 5px;">
            <h4 class="text-center mt-3"><font face-arial color=red>Update Schedule </font></h4>
            <form class="form-group" action="../UpdateSchedule" method="post">
                <table class="table text-center">
                    <tr>
                        <th>Course Id</th>
                        <td name="course_id"><b><%= schedule.getcId() %></b> </td>
                    </tr>
                    <tr>
                        <th>Days</th>
                        <td><input type="text" placeholder="eg. mon-sat" name="days" required="" value="<%= schedule.getDays() %>" class="form-control"></input></td>
                    </tr>
                    <tr>
                        <th>Timing</th>
                        <td><input type="text" placeholder="eg. 8am to 10am" name="timing" required="" value="<%= schedule.getTiming() %>" class="form-control"></input></td>
                    </tr>
                </table>
                <div class="container text-center">
                    <button type="submit" class="btn btn-success">Save</button>   
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    </body>
</html>
