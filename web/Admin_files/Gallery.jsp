<%@page import="com.e.sports.entities.Gallery"%>
<%@page import="com.e.sports.dao.GalleryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="../error_page.jsp" %>
<%  // getting Admin obj. from session
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("Admin_login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="../css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <!--// HEADER AND NAVBAR-->
        <%@include file="../header.jsp" %>
        <%@include file="Admin_navbar.jsp" %>
         <!--// MESSAGE RESPONSE-->
         <%@include file="../Common_Files/Message_response.jsp" %>
        <div class="mr-3 mt-3" style="text-align: right;">
            <button type="button"  class="btn btn-secondary" id="btn-add-gallery">Add to Gallery</button>
        </div>
        <!--<-----   Show Gallery  ---->
        <div id="show-gallery">
        <div  class="container">
            <h3 class="text-center" style=" color:red;text-decoration-color: black; text-decoration-line:underline; font-family: face-arial;">Indoor Games Courses</h3>
            <table class="table table-striped text-center">
                <tr>
                    <th>#Image Id</th>
                    <th>Image Category</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
                <%  
                    int start=0, recordCount=5;
                    int pgNO = request.getParameter("pgNo")==null?0:Integer.parseInt( request.getParameter("pgNo"));
                    start = pgNO*recordCount; 
                    // INITIALIZING GALLERYDAO WITH CONNECTION TO DB
                    GalleryDao galleryDao = new GalleryDao(ConnectionProvider.getConnection());
                    List<Gallery> galleryList = null;
                    galleryList = galleryDao.GetGallery(start,recordCount);
                    // GET TOTAL NUMBER OF RECORDS
                     int total = galleryDao.TotalRecords();
                    for(Gallery g: galleryList){%>
                    <tr>
                        <td><%=g.getId()%></td>
                        <td><%=g.getEvantName()%></td>
                       <td><a href="../Gallery-img/<%=g.getImageName() %> " target=" " class="btn btn-info btn-sm text-white">View</a></td>
                        <td><a href="./Gallery_Update.jsp?C-id=<%=g.getId()%>" class="btn btn-success btn-sm text-white m-1">Update</a>
                                <a  href="../DeleteGalleryServlet?C-id=<%=g.getId()%>&C-img=<%=g.getImageName()%>" onClick='deleteAlert()' class="btn btn-danger btn-sm m-1 text-white" >Delete</a></td>
                    </tr>
                   <% }%>
            </table>
                   <div class="container mb-2" style="display: flex; justify-content: flex-end;">
                            <p style="color:blue; margin-right:2rem;">Total no. of Records:<%=total%></p> <!-- Incremented by 1 as it starts from 0 -->
                            <p style="color:blue; margin-right:2rem;">Page No:<%=pgNO+1%></p> 
                            <div style=" color: white; margin-right: 2rem;"><a href="Gallery.jsp?pgNo=<%=pgNO-1%>" class="btn btn-dark <%= (start==0)?"disabled":""%> ">Previous</a></div>
                            <div style="  color: white"><a href="Gallery.jsp?pgNo=<%=pgNO+1%>" class="btn btn-dark <%= (start+recordCount>=total)?"disabled":" " %> ">Next</a></div>
                    </div>
        </div>
        </div>
        <!--<--- Add to Gallery ---->
        <div id="add-gallery"class="container mt-3 mb-4" style="width: 60vh; display:none; padding: 5px; background-color: #fff; border:1px solid black; border-radius: 5px; ">
            <div class="container text-center" ><h3><font face-areal color="red"> Add to Gallery</font></h3></div><hr color="black">
            <form action="../AddToGallery" method="post" enctype="multipart/form-data" class="container text-center">   
                <div class="form-group" style="display:flex;  justify-content: space-between;" >
                    <label class="mr-2">Evant: </label>
                    <input type="text" placeholder="Evant Name" name="evant" required="" class="form-control"></input>
                </div>    
                <div class="form-group" style="display:flex;  justify-content: space-between;" >
                    <label class="mr-2">Image: </label>
                    <input type="file"  name="image" required="" class="form-control"></input>
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
            // show and hide "add to gallery" and "show gallery" 
            let addStatus = true;
                    $("#btn-add-gallery").click(function(){
            if (addStatus === true) {
            $("#add-gallery").show();
                    $("#show-gallery").hide();
                    $("#btn-add-gallery").text("Back");
                    addStatus = false;
            }
            else{
            $("#add-gallery").hide();
                    $("#show-gallery").show();
                    $("#btn-add-gallery").text("Add to Gallery");
                    addStatus = true;
            }
            })
            });
            </script>    
            <script>
//           java script to show confirm delete alert !!!!
            function deleteAlert(){
               if( confirm("Do you want to Delete this Gallery Image") === true){      
               }else{
                   event.preventDefault();   
               }   
            }
           </script>
   </html>
