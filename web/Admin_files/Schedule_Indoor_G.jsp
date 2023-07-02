<%@page import="com.e.sports.entities.Courses"%>
<%@page import="com.e.sports.dao.ScheduleDao"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.entities.Schedule"%>
<%@page import="com.e.sports.dao.CourseDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Message"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="../error_page.jsp" %>
<%  // Getting Admin Obj.From session
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indoor Games Schedule</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
         <!--// MESSAGE RESPONSE-->
        <%@include file="../Common_Files/Message_response.jsp" %>
         <!--BUTTON TO ADD SCHEDULE-->
        <div class="mr-3 mt-3" style="text-align: right;">
            <button type="button"  class="btn btn-secondary" id="btn-add-course">Add Schedule</button>
        </div>
        <!--<-----   Show Schedule  ---->
        <div id="show-course" class="container">
            <div>
                <h3 class="text-center" style=" color:red;text-decoration-color: greenyellow; text-decoration-line:underline;font-family: face-arial">Indoor Games Schedule</h3>
                <table class="table table-striped text-center"> 
                    <%    // getting Indoot Game schedule form data base.
                        ScheduleDao scheduleDao = new ScheduleDao(ConnectionProvider.getConnection());
                        List<Schedule> scheduleList = null;
                        scheduleList = scheduleDao.GetSchedule("Indoor Games");
                        for (Schedule s : scheduleList) {
                    %>
                    <tr>
                        <td><%= s.getcId()%></td>
                        <td><%= s.getCourseName()%></td>
                        <td><%= s.getCourseCategory()%></td>
                        <td><%= s.getDays()%></td>
                        <td><%= s.getTiming()%></td>
                        <td><a href="Update_Schedule.jsp?c-id=<%=s.getcId()%>&c-category=Indoor Games" class="btn btn-success text-white" >Update</a></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
        <!--<--- Add New Schedule ---->
        <div id="add-course"class="container mt-3 mb-4" style="width: 80vh; display:none; padding: 5px; border:black 1px solid; border-radius: 5px; ">
            <!--// show courses to add schedule to corresponding course.-->
            <h4 class="text-center" style="text-decoration-color: greenyellow; text-decoration-line:underline;"><font face-arial color="red">Update Schedule</font></h4>
            <table  class="table table-striped">
                <tr>
                    <th>Course Id</th>
                    <th>Course Name</th>
                    <th>Add Schedule</th>
                </tr>
                <%
                // INITIALIZING CourseDao OBJ. WITH CONNECTION TO DATABASE
                    CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
                    List<Courses> listCourse = null;
                    // getting courses form db
                    listCourse = courseDao.GetCourse("Indoor Games");
                    for (Courses c : listCourse) {
                        // if schedule not added retruns true
                        if (!scheduleDao.CheckSchedule(c.getId())) {
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getName()%></td>
                    <td><a href="InsertNewSchedule.jsp?c-id=<%= c.getId()%>&c-category=<%=c.getCategory()%>" class="btn btn-success text-white btn-sm">Click here</a></td>
                </tr>
                <%
                    } else {%>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getName()%></td>
                    <td><font color="green">Schedule Already Added</font></td>
                </tr>
                <% }
                    }
                %>
            </table>
        </div>  
    </body>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    <script>
                    $(document).ready(function(){
            // show and hide "add new Schedule" and "show Schedule" 
            let addStatus = true;
                    $("#btn-add-course").click(function(){
            if (addStatus === true) {
            $("#add-course").show();
                    $("#show-course").hide();
                    $("#btn-add-course").text("Back");
                    addStatus = false;
             }
            else{
            $("#add-course").hide();
                    $("#show-course").show();
                    $("#btn-add-course").text("Add Schedule");
                    addStatus = true;
             }
            })
            });
     </script>
     </html>


