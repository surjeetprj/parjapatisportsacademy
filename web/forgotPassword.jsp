<%@page import="com.e.sports.entities.Message"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> 
           Forgot Password</title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
    </head>
    <body>
        <!--header of the page-->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <%@include file="normal_navbar.jsp" %>
        <!--nav bar end-->
       <main class="d-flex align-items-center banner-background_2" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-lg-4 offset-sm-1">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br><p>Recover password!</p>
                            </div>
                            <!--// MESSAGE RESPONSE-->
                            <%@include file="Common_Files/Message_response.jsp" %>
                            <div class="card-body">
                                <form action="ForgotPassword" method="post">
                                    <div class="form-group">
                                        <label style="color:blue">Enter registered Email address</label>
                                        <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">    
                                    </div>
                                    <div class="container text-center mt-1" >
                                        <input type="submit" class="btn btn-primary">
                                    </div>
                                </form>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    

</html>
