<%@page import="com.e.sports.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.dao.UserDao"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //GETTING ADMIN OBJ. FORM SESSION
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registered Users</title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    </head>
    <body> 
        <!--HEADER AND NAV BAR-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>
        <!--// showing Payment Status.-->
        <div class="container mt-4 mb-4">
            <div class="row mr-auto">
                <div class="col-ms-12 col-md-12">
                    <h3 class="text-center" style=" color:red;text-decoration-color: black; text-decoration-line:underline; font-family: face-arial;">Registered Users</h3>
                    <table  class="table table-striped text-center">
                        <tr>
                            <th>#User Id</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>D.O.B.</th>
                            <th>Contact no.</th>
                            <th>Email Id</th>
                            <th>Image</th>
                            <th>House no.</th>
                            <th>Area</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Pincode</th>
                        </tr>
                        <%
                            int start=0, recordCount=5;
                            int pgNO = request.getParameter("pgNo")==null?0:Integer.parseInt( request.getParameter("pgNo"));
                            start = pgNO*recordCount; 
                            // initialising obj and creating connection to db
                            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                            List<User> userList = null;
                            userList = userDao.GetUsers(start,recordCount);
                            int total = userDao.TotalRecords();
//                            System.out.println("total Records= "+total); 
                            for (User u : userList) {
                        %>
                        <tr>
                            <td><%= u.getId() %></td>
                            <td><%= u.getName() %></td>
                            <td><%= u.getLastName() %></td>
                            <td><%= u.getGender() %></td>
                            <td><%=u.getAge() %></td>
                            <td><%=u.getDob() %></td>
                            <td><%=u.getContact() %></td>
                            <td><%=u.getEmail() %></td>
                            <td><a href="../pics/<%=u.getImage() %>" target=" " class="btn btn-info text-white">View</a></td>
                            <td><%=u.getHouseNo() %></td>
                            <td><%=u.getArea() %></td>
                            <td><%=u.getCity() %></td>
                            <td><%=u.getState() %></td>
                            <td><%=u.getPincode() %></td>
                            </tr>
                        <%}%>    
                    </table>
                        <div class="container" style="display: flex; justify-content: flex-end;">
                            <p style="color:blue; margin-right:2rem;">Total no. of Records:<%=total%></p>
                            <p style="color:blue; margin-right:2rem;">Page No:<%=pgNO+1%></p> <!-- incr. by 1 as it starts from 0 -->
                            <div style=" color: white; margin-right: 2rem;"><a href="Registered_Users.jsp?pgNo=<%=pgNO-1%>" class="btn btn-dark <%= (start==0)?"disabled":""%> ">Previous</a></div>
                            <div style="  color: white"><a href="Registered_Users.jsp?pgNo=<%=pgNO+1%>" class="btn btn-dark <%= (start+recordCount>=total)?"disabled":" " %> ">Next</a></div>
                        </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    </body>
</html>
