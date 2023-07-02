<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.dao.CourseDao"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page import="com.e.sports.entities.Courses" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% // Getting Admin feom session
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update course Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--Header and Admin Nav Bar-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>
        
        <h3 class="text-center mt-1" style="text-decoration-line: underline;"><font face-arial>Update Course</h3>
        <%  String id = request.getParameter("C-id");
            // INITIALIZING CourseDao OBJ. WITH CONNECTION TO DATABASE
             CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
            String sql = "select * from course_mst where c_id=" + id;
            Courses course = new Courses();
            course = courseDao.getCourseById(sql);
            // save this course in session ...
            session.setAttribute("updateCourse",course);
        %>
        <div  class="container" style="width:80vh; padding:5px; background-color: #fff; border:1px solid black; border-radius: 5px;">
            <h4 class="text-center mt-3"><font face-arial color=red>Please Edit Carefully !</font></h4>
            <form action="../UpdateCourse" method="post" enctype="multipart/form-data" class="text-center">
                <table class="table" style="">
                    <tr>
                        <th>Course Id: </th>  
                        <td><b><%= course.getId()%></b></td>  
                    </tr>
                    <tr>
                        <th>Course Name: </th>  
                        <td><input type="text" class="form-control" name="course_name" required="" value="<%= course.getName()%>"></td>
                    </tr>
                    <tr>
                        <th>Course Details: </th>  
                        <td><textarea  class="form-control"  name="course_details"required="" ><%= course.getDetails()%></textarea></td>
                    </tr>
                    <tr>
                        <th>Course Duration: </th>  
                        <td><input type="number" class="form-control"  name="course_duration" required="" value="<%= course.getDuration()%>"></td>
                    </tr>
                    <tr>
                        <th>Course Price: </th>  
                        <td><input type="number" class="form-control"  name="course_price" required="" value="<%= course.getPrice()%>"></td>
                    </tr>
                    <tr>
                        <th>Old Course Image:</th>
                       <% String url = "../Course-img/"+course.getImage(); %>
                       <td><a href=<%= url %> target="_blank" class="btn btn-info btn-sm text-white " >Click Here</a></td>  
                    </tr>
                    <tr>
                        <th>New Course Image: </th>  
                        <td><input type="file" class="form-control"  name="course_image"></td>
                    </tr>
                    <tr>
                        <th>Course Category: </th>  
                        <td><b><%= course.getCategory() %></b></td>
                    </tr>
                </table>
                <div class="container">
                    <button type="submit" class="btn btn-success">Save</button>   
                </div>
            </form>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
</html>
