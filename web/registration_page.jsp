<%@page import="com.e.sports.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registration Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

        </style>
    </head>
    <body>
        <!--INCLUDING HEADER AND NORMAL NAV BAR-->
        <%@include file="header.jsp" %>
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background_2  p-5" >
            <div class="container" style="margin-bottom:20px;">
                <div calss="row">
                    <div class="col-md-6 offset-lg-3">
                        <div class="card">
                            <div class="card-header text-center primary-background text-white">
                                <span class="fa fa-3x fa-user-circle"></span>
                                <br><p>Register here!</p>
                            </div>
                             <!--// MESSAGE RESPONSE-->
                             <%@include file="Common_Files/Message_response.jsp" %>
                            <div class="card-body">
                                <form name="reg_from" id="reg-form" action="RegisterServlet" method="POST" onSubmit="formValidation();">
                                    <div>
                                        <label for="username">First Name</label>
                                        <input type="text" name="first_name" id="first_name"  class="form-control" id="fist_name" placeholder="First Name">
                                    </div>  
                                    <div >
                                        <label for="username">Last Name</label>
                                        <input type="text" name="last_name" class="form-control" id="last_name" placeholder="Last Name">
                                    </div> 
                                    <div class="form-group">
                                        <label for="contact">Contact No.</label>
                                        <input type="number" name="contact" id="contact" min="000000000" max="9999999999" class="form-control"  placeholder="Contact No.">
                                    </div>
                                    <div class="form-group " >
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" id="email"  class="form-control" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div> 
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" id="firstpassword"  class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Confirm Password</label>
                                        <input type="password"  class="form-control" id="secondpassword" placeholder="Confirm Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Select gender</label><br>
                                        <input type="radio"  name="user_gender" id="gender1" value="male">Male
                                        <input type="radio"  name="user_gender" id="gender2" value="female">Female
                                    </div> 
                                    <div class="form-group ">
                                        <label>Date of Birth</label>
                                        <input type="date" name="dob" id="birthDate" class="form-control" placeholder="D.O.B.">  
                                    </div>
                                    <div class="form-group">
                                        <label>Age</label>
                                        <input type="number" name="age" id="newAge" class="form-control" placeholder="Age">  
                                    </div> 
                                     <!--address-->
                                    <div class="form-group">
                                        <label>House No.</label>
                                        <input type="number" name="houseNo" id="houseNO" class="form-control"  placeholder="House No.">  
                                    </div>
                                    <div class="form-group">
                                        <label>Area</label>
                                        <input type="text" name="area" id="area"  class="form-control"  placeholder="Area">  
                                    </div>
                                    <div class="form-group">
                                        <label>City</label>
                                        <input type="text" name="city" id="city" class="form-control"  placeholder="City">  
                                    </div>
                                    <div class="form-group">
                                        <label>State </label>
                                        <input type="text" name="state" id="state" class="form-control"  placeholder="State">  
                                    </div>
                                    <div class="form-group">
                                        <label>Pincode</label>
                                        <input type="number" name="pincode" id="pincode"  class="form-control" placeholder="Pincode">  
                                    </div>
                                    <div class="form-check ml-4">
                                <input type="checkbox" name="check" id="mycheck"class="form-check-input" >
                                <label class="form-check-label" for="exampleCheck1">Agree terms & conditions</label>
                            </div>
                            <br>
                            <center><button type="submit" class="btn btn-primary mb-2" >Submit</button></center>
                        </form>
                            </div>
                        </div> 
                        </div>
                    </div>
                </div> 
            </div>
        </main>
        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
        <script>
            // On submit validations
                function formValidation() {
//                getting elements value by thier id
                var firstName = document.getElementById("first_name").value;
                var email = document.getElementById("email").value;
                var firstpassword = document.getElementById("firstpassword").value;
                var secondpassword = document.getElementById("secondpassword").value;
                var contact = document.getElementById("contact").value;
                var gender1 = document.getElementById("gender1");
                var gender2 = document.getElementById("gender2");
                var birthDayDate = document.getElementById("birthDate").value;
                var houseNO = document.getElementById("houseNO").value;
                var area = document.getElementById("area").value;
                var city = document.getElementById("city").value;
                var state = document.getElementById("state").value;
                var pincode = document.getElementById("pincode").value;
                var checkBox = document.getElementById("mycheck");
                // is first name empty
                if(firstName.length < 1){
                     alert("First name can't be blank.");
                    event.preventDefault();
                }
                // check contact number lenghth
                else if(contact.length < 10 || contact.lenth>10){
                   alert("Contact number must be filled with 10 digit");
                    event.preventDefault();
                
                }
                // is email empty
               else if(email.length < 1){
                     alert("Please fill Email Id.");
                    event.preventDefault();
                }
//                is email is formatted
                else if((email.indexOf("@") === -1) || (email.indexOf(".") === -1))
                {
                    alert("Email address not valid ,please try agian.");
                    event.preventDefault(); 
                }
                // is passeord empty
                else if(firstpassword.length<8){
                    alert("Password must be at least 8 characters");
                    event.preventDefault();
                }
                // is first password and conform password mached
                else if(firstpassword !== secondpassword){
                    alert("Password must be same!");
                    event.preventDefault();
                }
//                is gander not checked
                else if((gender1.checked === false) && (gender2.checked === false)){
                    alert("Please check gender!");
                    event.preventDefault();
                }
                // is Date of birth empty
                else if(birthDayDate.length < 1){
                    alert("Please fill date of birth!");
                    event.preventDefault();
                }
                // is house No. empty
                else if(houseNO.length < 1){
                    alert("Please fill House NO.");
                    event.preventDefault();
                }
                // is area field empty
                else if(area.length < 1){
                    alert("Please fill Your Area.");
                    event.preventDefault();
                }
//                is city field empty
                else if(city.length < 1){
                    alert("Please fill Your City.");
                    event.preventDefault();
                }
//                is state field empty
                else if(state.length < 1){
                    alert("Please fill Your State.");
                    event.preventDefault();
                }
//                is pincode field empty
                else if(pincode.length < 1){
                    alert("Please fill Your Pincode.");
                    event.preventDefault();
                }
                // is terms and condition checked
                else if(checkBox.checked === false){
                    alert("Please check terms & conditions.");
                    event.preventDefault();
                }
                else {
                }
            }
            // AUTO FILL AGE
            document.getElementById("birthDate").onchange = function () {getAge() };  
           // function to get age in years by date of birth
            function getAge() {
                var birthDayDate = document.getElementById("birthDate").value;
                const ageInYears = moment().diff(new Date(birthDayDate), 'years');
                var x = document.getElementById("newAge");
                x.value = ageInYears;
                console.log(ageInYears);
            }</script>
    </body>
</html>
