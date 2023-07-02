<%@page import="com.e.sports.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> 
            About
        </title>
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
       <%//getting current user from session
             User user = (User)session.getAttribute("currentUser");
             if(user == null){
            %>
        <%@include file="normal_navbar.jsp" %>
        <%}else{%>
        <%@include file="logedin_user_navbar.jsp" %>
        <%}%>
        <!--nav bar end-->
        <!--ABOUT PAGE CONTENT-->
        <div class="container-fluid" style="display: flex;">
            <div class="row">
                <div class="col-lg-6 col-sm-4 col-md-4">
                    <div class="mt-4"><img width="100%" height="auto" src="Gallery-img/istockphoto-1148219796-612x612.jpg"></div>   
                </div>
                <div class="col-lg-6 col-sm-4 col-md-4 ">
                    <div class="mt-2"> <h1 style="text-transform: capitalize;text-shadow: 2px 2px 6px white;">
                             About Us
                    </h1>  
                    <p style="display: block;text-indent: 2rem;
        text-align:start;
        line-height: 24px;
        color:#030e12; 
        font-size:bold;">
Welcome to our Sports Academy! We are a premier sports training facility dedicated to helping athletes of all levels achieve their goals and reach their full potential.
<br>
<b>Our Founder </b><br>
Our academy was founded by John Smith, a former professional athlete who has a passion for helping others achieve their athletic dreams. After retiring from his successful career as a pro athlete, John wanted to give back to the sports community by providing a facility where athletes could receive world-class training and support.
<br>
<b>Who We Are</b><br>
Our team of highly experienced coaches and trainers are passionate about teaching and inspiring our students to be the best they can be, both on and off the field. We offer a wide range of programs and training options to suit the individual needs of each athlete. Whether you are just starting out or looking to take your skills to the next level, we have a program that can help you achieve your goals.
<br>
<b>Our Accomplishments</b><br>
Over the years, our Sports Academy has produced many successful athletes who have gone on to achieve great things in their respective sports. We are proud of our students' accomplishments, which include winning state and national championships, earning college scholarships, and even competing at the professional level.
<br>
We also take pride in our community involvement, organizing and participating in events and programs that promote healthy lifestyles and sportsmanship.
<br>
At our Sports Academy, we strive to provide a supportive and encouraging environment where our athletes can learn, grow, and succeed. Thank you for considering our academy as your training destination, and we look forward to helping you achieve your athletic dreams. </p>        
                </div>    
            </div>
        </div>
        </div>
        <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>
         <!--javaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
    </body>
</html>
    