<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.dao.FeedbackDao"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% //GETTING ADMIN OBJ. FROM SESSION
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> 
           Feedback Normal User 
        </title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--Including header and admin nav bar-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>   
        <!--<-----   Show Feedbacks  ---->
        <div id="show-gallery">
        <div  class="container mt-4">
            <h3 class="text-center" style=" color:red;text-decoration-color: black; text-decoration-line:underline; font-family: face-arial;">Normal User Feedbacks</h3>
            <table class="table table-striped text-center">
                <tr>
                    <th>#Feedback Id</th>
                    <th>Comment</th>
                </tr>
                <%  
                    int start=0, recordCount=5;
                    int pgNO = request.getParameter("pgNo")==null?0:Integer.parseInt( request.getParameter("pgNo"));
                    start = pgNO*recordCount; 
                    // INITIALIZING FEEDBACKDAO WITH CONNECTION TO DB
                    FeedbackDao feedbackDao = new FeedbackDao(ConnectionProvider.getConnection());
                    List<Feedback> feedList = null;
                    feedList = feedbackDao.GetFeedbackNormalUser(start,recordCount);
                    // GET TOTAL NUMBER OF RECORDS
                     int total = feedbackDao.TotalRecordsNormalUser();
                    for(Feedback f: feedList){%>
                    <tr>
                        <td><%=f.getId()%></td>
                        <td><%=f.getComment() %></td>   
                    </tr>
                   <% }%>
            </table>
                   <div class="container" style="display: flex; justify-content: flex-end;">
                            <p style="color:blue; margin-right:2rem;">Total no. of Records:<%=total%></p> <!-- Incremented by 1 as it starts from 0 -->
                            <p style="color:blue; margin-right:2rem;">Page No:<%=pgNO+1%></p> 
                            <div style=" color: white; margin-right: 2rem;"><a href="Feedback_NormalUser.jsp?pgNo=<%=pgNO-1%>" class="btn btn-dark <%= (start==0)?"disabled":""%> ">Previous</a></div>
                            <div style="  color: white"><a href="Feedback_NormalUser.jsp?pgNo=<%=pgNO+1%>" class="btn btn-dark <%= (start+recordCount>=total)?"disabled":" " %> ">Next</a></div>
                    </div>
        </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
</html>

