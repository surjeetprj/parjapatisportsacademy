<%-- 
    Document   : Feedback_NormalUser
    Created on : 9 May, 2023, 6:49:15 PM
    Author     : surje
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> 
            Feedback
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
        <!--nav bar-->
         <%@include file="normal_navbar.jsp" %>
         <!--end of nav bar-->
        <main class="d-flex align-items-center banner-background_2" style="height:80vh">
            <div class="container mb-4">
                <div class="row">
                    <div class="col-md-4 offset-lg-4 offset-sm-1">

                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <br><p>Your Feedback!</p>
                            </div>
                            <div>
                                <!--// MESSAGE RESPONSE-->
                                <%@include file="Common_Files/Message_response.jsp" %>
                            </div>
                            <div class="card-body">
                                <form action="AddFeedbackNormalUser" method="post" onSubmit=" return validateForm();">
                                    <div class="form-group">   
                                        <textarea type="text" rows="6" name="comment" id="comment_1" required class="form-control" id="exampleInputEmail1" placeholder="Type your Relevant Feedback within 150 words....!!"></textarea>   
                                    </div>
                                    <div class="container text-center" >
                                        <input type="submit" class="btn btn-primary">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
         <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>   
        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script>
            function validateForm(){
           var feedback = document.getElementById("comment_1").value;
           // is feedback length greater than 150 words
            if(feedback.length >150){
                alert("Your feedback should be within 150 words.! ");
                return false;
            }
            else{return true;}
        }
            </script>
    </body>
</html>
