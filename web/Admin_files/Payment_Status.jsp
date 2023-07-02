<% // Getting Admin obj. from session
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<%@page import="com.e.sports.entities.Fee"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.dao.FeeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Status</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body> 
        <!--including header and amdin navbar-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>
        <!--// showing Payment Status.-->
        <div class="container mt-4 mb-4">
            <div class="row mr-auto">
                <div class="col-ms-12 col-md-12">
                    <h3 class="text-center" style=" color:red;text-decoration-color: black; text-decoration-line:underline; font-family: face-arial;">Payment Status</h3>
                    <table  class="table table-striped text-center">
                        <tr>
                            <th>#Payment Id</th>
                            <th>User Id</th>
                            <th>User Name</th>
                            <th>Course Id</th>
                            <th>Course Name</th>
                            <th>Course Price(₹)</th>
                            <th>Payment Status</th>
                        </tr>
                        <%
                            int start=0, recordCount=5;
                            int pgNO = request.getParameter("pgNo")==null?0:Integer.parseInt( request.getParameter("pgNo"));
                            start = pgNO*recordCount; 
                            // initialising obj and creating connection to db
                            FeeDao feeDao = new FeeDao(ConnectionProvider.getConnection());
                            List<Fee> feeList = null;
                            feeList = feeDao.GetFeeStatus(start,recordCount);
                            // GET TOTAL NUMBER OF RECORDS
                            int total = feeDao.TotalRecords();
//                            System.out.println("total Records= "+total); 
                            for (Fee f : feeList) {
                        %>
                        <tr>
                            <td><%=f.getpId()%></td>
                            <td><%=f.getuId()%></td>
                            <td><%=f.getUserName()%></td>
                            <td><%=f.getcId()%></td>
                            <td><%=f.getCourseName()%></td>
                            <td><%= f.getCoursePrice()%></td>
                            <td style="text-transform: uppercase; color:<%=(f.ispStatus()==true)?"green":"red"%>"> <%=f.ispStatus()%></td>
                        </tr>
                        <%
                            }
                        %> 
                    </table>
                        <div class="container" style="display: flex; justify-content: flex-end;">
                            <p style="color:blue; margin-right:2rem;">Total no. of Records:<%=total%></p> <!-- Incremented by 1 as it starts from 0 -->
                            <p style="color:blue; margin-right:2rem;">Page No:<%=pgNO+1%></p> 
                            <div style=" color: white; margin-right: 2rem;"><a href="Payment_Status.jsp?pgNo=<%=pgNO-1%>" class="btn btn-dark <%= (start==0)?"disabled":""%> ">Previous</a></div>
                            <div style="  color: white"><a href="Payment_Status.jsp?pgNo=<%=pgNO+1%>" class="btn btn-dark <%= (start+recordCount>=total)?"disabled":" " %> ">Next</a></div>
                        </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    </body>
</html>
