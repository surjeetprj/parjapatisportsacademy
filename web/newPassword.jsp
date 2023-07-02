<!doctype html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Reset password</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            body{margin:auto; padding: 0;background-color:whitesmoke;}

            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dee2e6;
                border: #dee2e6
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0" style="border:1px solid gray;">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Reset Password</strong>
                                </h1>
                            </div>
                            <div>
                                <!--MESSAGE RESPONSE-->
                                <%@include file="Common_Files/Message_response.jsp" %> 
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="NewPassword" method="POST" onsubmit="return validateform();" >
                                    <!-- User Name Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="password" name="password" id="pswd"
                                                   placeholder="&#xf084; &nbsp; New Password"
                                                   class="form-control border-info placeicon">
                                        </div>
                                    </div>
                                    <!-- Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="password" name="confPassword" id="conformPswd"
                                                   placeholder="&#xf084; &nbsp; Confirm New Password"
                                                   class="form-control border-info placeicon"></input>
                                        </div>
                                    </div>
                                    <!-- Log in Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Reset"
                                                   class="btn btn-block btn-info"></input>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
        <script language="JavaScript">
        function validateform()
          {
            var fpswd = document.getElementById("pswd").value;
            var spswd = document.getElementById("conformPswd").value;
            
        if(fpswd.length < 8){
            alert("Password must be at least 8 characters");
            return false;
        }  
        // Check password and conform same or not  
        else if (fpswd === spswd) {
           return true;
        }
        else {
          alert("Password must be same!");
          return false;
        }
     }                                            
        </script>
    </body>
</html>