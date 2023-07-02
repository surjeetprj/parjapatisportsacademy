<%@page import="com.e.sports.entities.User"%>
<% User userNav = (User)session.getAttribute("currentUser"); 
if(!response.isCommitted()){
if(userNav == null){ response.sendRedirect("login_page.jsp");}
else{
%>
<!--nav bar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <!--    <a class="navbar-brand" href="index.jsp">Home</a>-->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav_hover"> <a class="nav-link text-white" href="profile.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                    <li class="nav-item dropdown nav_hover">
                        <a class="nav-link dropdown-toggle text-white"  id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o "></span> Courses </a>
                        <div class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item text-white" href="IndoorGames.jsp">Indoor Games </a>
                            <a class="dropdown-item text-white" href="OutdoorGames.jsp">Outdoor Games</a>
                             </div>
                    </li>

                    <li class="nav-item nav_hover">
                        <a class="nav-link text-white" href="Schedule.jsp"><span class="fa fa-calendar" aria-hidden="true"></span> Schedule</a>
                    </li>
                    <li class="nav_hover"> <a class="nav-link text-white" href="Show_Gallery.jsp"><apan class="fa fa-file-image-o"></apan> Gallery</a></li>
                     <li class="nav_hover"><a class="nav-link text-white" href="About_Us.jsp"> <span class="fa fa-address-card"></span> About Us</a></li>
                       <li class="nav_hover"><a class="nav-link text-white" href="Feedback.jsp"> <span class="fa fa-comment-o"></span> Feedback</a></li>
                </ul>
                <ul class="navbar-nav mr-rigth">
                    <li class="nav-item active nav_hover" >
                        <a class="nav-link" href="profile-modal" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span>
                         <%  if(userNav != null){ out.println(userNav.getName()); } %>
                        </a>
                    </li>
                    <li class="nav-item active nav_hover">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav> 
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade"  id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog"  role="document" >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">E-Parjpati Sports Academy</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= userNav.getImage()%>" class="img-fluid" style="border-radius:50%; max-width: 150px;" >
                            <h5 class="modal-title" id="exampleModalLabel" mt-3><%= userNav.getName()%></h5>
                            <!--profile details-->
                            <div id="profile-detail">
                                <div id="personal-details">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">ID:</th>
                                                <td><%= userNav.getId()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Name:</th>
                                                <td><%= userNav.getName()%> <%=userNav.getLastName()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Contact no. :</th>
                                                <td><%= userNav.getContact()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Email:</th>
                                                <td><%= userNav.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender:</th>
                                                <td><%= userNav.getGender()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">D.O.B:</th>
                                                <td><%= userNav.getDob()%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="address-details" style="display:none;">
                                    <table class="table">
                                        <th scope="row">House no:</th>
                                        <td><%= userNav.getHouseNo()%></td>
                                        </tr>
                                        <tr>
                                        <tr>
                                            <th scope="row">Area :</th>
                                            <td><%= userNav.getArea()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">City :</th>
                                            <td><%= userNav.getCity()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">State :</th>
                                            <td><%= userNav.getState()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Pincode :</th>
                                            <td><%= userNav.getPincode()%></td>
                                        </tr>
                                    </table>
                                </div>
                                <center> <button type="submit" id="view-details-btn"class="btn btn-outline-primary">View Address</button></center>  
                            </div>
                            <!--edit profile-->
                            <div id="profile-edit" style="display: none !important;">
                                <h4 class="mt-3">Please Edit Carefully !</h4>
                                <form action="EditProfileServlet" method="post" enctype="multipart/form-data" onSubmit="formValidation();">
                                    <table class="table">
                                        <tr>
                                            <td>Id: </td>  
                                            <td><%= userNav.getId()%></td>  
                                        </tr>
                                        <tr>
                                            <td>First Name: </td>  
                                            <td><input type="text" class="form-control" name="user_firstName" id="first_name" value="<%= userNav.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Last Name: </td>  
                                            <td><input type="text" class="form-control"  name="user_lastName" id="last_name" value="<%= userNav.getLastName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Contact: </td>  
                                            <td><input type="number" class="form-control"  name="user_contact" id="contact" min="0000000000" max="9999999999"  value="<%= userNav.getContact()%>" ></td>
                                        </tr>
                                        <tr>
                                            <td>Email: </td>  
                                            <td><input type="email" class="form-control"  name="user_email" id="email" value="<%= userNav.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password: </td>  
                                            <td><input type="password" class="form-control" id="password"  name="user_password" value="<%= userNav.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Gender: </td>  
                                            <td><%= userNav.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>D.O.B.: </td>  
                                            <td><input type="text" class="form-control"  name="user_dob" id="birthDate" value="<%= userNav.getDob()%>"></td>
                                        </tr>
                                        <tr>
                                            <td><label>Age</label></td>
                                            <td><input type="number" name="age" id="newAge" class="form-control" value="<%= userNav.getAge() %>"></td>  
                                        </tr>
                                        <tr>
                                            <td>House no.: </td>  
                                            <td><input type="number" class="form-control"  name="user_houseNo" id="houseNO" value="<%= userNav.getHouseNo()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Area: </td>  
                                            <td><input type="text" class="form-control"  name="user_area" id="area" value="<%= userNav.getArea()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>City: </td>  
                                            <td><input type="text" class="form-control"  name="user_city" id="city" value="<%= userNav.getCity()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Sate: </td>  
                                            <td><input type="text" class="form-control"  name="user_state" id="state" value="<%= userNav.getState()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Pincode: </td>  
                                            <td><input type="number" class="form-control"  name="user_pincode" id="pincode" value="<%= userNav.getPincode()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>New Profile: </td>
                                            <td><input type="file" class="form-control" name="user_image"></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>   
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary" >Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile model--> 
        <!--// JavaScript-->
        <script>
            function formValidation() {
//                getting elements value by thier id
                var firstName = document.getElementById("first_name").value;
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;
                var contact = document.getElementById("contact").value;
                var birthDayDate = document.getElementById("birthDate").value;
                var houseNO = document.getElementById("houseNO").value;
                var area = document.getElementById("area").value;
                var city = document.getElementById("city").value;
                var state = document.getElementById("state").value;
                var pincode = document.getElementById("pincode").value;
                
               // validating fields of the form
                if(firstName.length < 1){
                     alert("First name can't be blank.");
                    event.preventDefault();
                }
                else if(contact.length < 10 || contact.lenth>10){
                   alert("Contact number must be filled with 10 digit");
                    event.preventDefault();
                }
               else if(email.length < 1){
                     alert("Please fill Email Id.");
                    event.preventDefault();
                }
                else if((email.indexOf("@") === -1) || (email.indexOf(".") === -1))
                {
                    alert("Email address not valid ,please try agian.");
                    event.preventDefault(); 
                }
                else if(password.length<8){
                    alert("Password must be at least 8 characters");
                    event.preventDefault();
                }
                else if(birthDayDate.length < 1){
                    alert("Please fill date of birth!");
                    event.preventDefault();
                }
                else if(houseNO.length < 1){
                    alert("Please fill House NO.");
                    event.preventDefault();
                }
                else if(area.length < 1){
                    alert("Please fill Your Area.");
                    event.preventDefault();
                }
                else if(city.length < 1){
                    alert("Please fill Your City.");
                    event.preventDefault();
                }
                else if(state.length < 1){
                    alert("Please fill Your State.");
                    event.preventDefault();
                }
                else if(pincode.length < 1){
                    alert("Please fill Your Pincode.");
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
            }
            </script>
<%}} %>