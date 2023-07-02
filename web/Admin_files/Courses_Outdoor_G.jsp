<%@page import="java.util.List"%>
<%@page import="com.e.sports.entities.Courses"%>
<%@page import="com.e.sports.dao.CourseDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Message"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="../error_page.jsp" %>
<%  // GAETTING ADMIN OBJ FROM CURRENT SESSION
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
       <!--INCLUDING HEADER AND ADMIN NAV BAR-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>
        <!--// MESSAGE RESPONSE-->
        <%@include file="../Common_Files/Message_response.jsp" %>   
        <div class="mr-3 mt-3" style="text-align: right;">
            <button type="button"  class="btn btn-secondary" id="btn-add-course">Add Course</button>
        </div>       
  <!--<-----   Show Outdoor Games Courses  ---->
        <div id="show-course" class="container">
            <h3 class="text-center" style=" color:red;text-decoration-color: black; text-decoration-line:underline; font-family: face-arial;">Outdoor Games Courses</h3>
            <table class="table table-striped text-center">
                <tr>
                    <th>#Course Id</th>
                    <th>Course Name</th>
                    <th>Course Details</th>
                    <th>Course Duration (months)</th>
                    <th>Course Price(₹)</th>
                    <th>Course Image</th>
                    <th>Course Category</th>
                    <th>Action</th>
                </tr>
                <%  
                // INITIALIZING CourseDao OBJ. WITH CONNECTION TO DATABASE
                    CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
                    List<Courses> courseList = null;
                    // GETTING LIST TYPE DATA TYPE FROM COURSEDAO OBJ.
                    courseList = courseDao.GetCourse("Outdoor Games");
                    for(Courses c: courseList){%>
                    <tr>
                        <td><%=c.getId()%></td>
                        <td><%=c.getName()%></td>
                        <td><%=c.getDetails()%></td>
                        <td><%=c.getDuration()%></td>
                        <td><%=c.getPrice()%></td>
                        <td><a href="../Course-img/<%=c.getImage() %>" target=" " class="btn btn-info btn-sm text-white">View</a></td>
                        
                        <td><%=c.getCategory()%></td>
                        <td><a href="./Update_course.jsp?C-id=<%=c.getId()%>" class="btn btn-success btn-sm text-white m-1">Update</a>
                                <a  href="../DeleteCourseServlet?C-id=<%=c.getId()%>&C-img=<%=c.getImage()%>&ctgry=<%=c.getCategory()%>" onClick='deleteAlert()' class="btn btn-danger btn-sm m-1 text-white" >Delete</a></td>
                    </tr>
                   <% }%>
              
            </table>
        </div>
        <!--<--- Add New Course ---->
        <div id="add-course"class="container mt-3 mb-4" style="width: 70vh; display:none; padding: 5px; background-color: #fff; border:1px solid black; border-radius: 5px; ">
            <div class="container text-center" ><h3><font face-areal color="red"> Add New Course</font></h3></div><hr color="black">
            <form action="../AddNewCourse" method="post" enctype="multipart/form-data" class="container text-center">
                <select class="form-group" name="category" required>
                    <option selected>Outdoor Games</option>
                </select>
                <br>
                <div class="form-group">
                    <input type="text" placeholder="Course name" name="name" required class="form-control"S></input>
                </div>    
                <div class="form-group">
                    <textarea  placeholder="Course details"  name="details" required="" class="form-control"S></textarea>
                </div>     
                <div class="form-group">
                    <input type="number" placeholder="Duration in months" name="duration" required="" class="form-control"S></input>
                </div>    
                <div class="form-group">
                    <input type="number" placeholder="Price in Rs." name="price" required="" class="form-control"S></input>
                </div>    
                <div class="form-group" >
                    <label>Course Image</label><br>
                    <input type="file"  name="image" class="form-control"></input>
                </div> 
                <input type="submit" value="Save" class="btn btn-success">
            </form>
            </div>
                </body>
                <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
                <script>
                    $(document).ready(function(){
            // show and hide "add new course" and "show courses" 
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
                    $("#btn-add-course").text("Add Course");
                    addStatus = true;
            }
            })
            });
            </script>   
            <script>
//           java script to show confirm delete alert !!!!
            function deleteAlert(){
               if( confirm("Do you want to Delete this Course ") == true){     
               }else{
                   event.preventDefault();   
               }  
            }
           </script>
   </html>
