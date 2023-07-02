<%@page import="com.e.sports.entities.Gallery"%>
<%@page import="com.e.sports.dao.GalleryDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="com.e.sports.entities.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
          Update Gallery
        </title>
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
        <!--UPDATE GALLERY-->
       <h3 class="text-center mt-1" style="text-decoration-line: underline;"><font face-arial>Update Gallery</h3>
        <%   
        int id = Integer.parseInt(request.getParameter("C-id"));
        // INITIALIZING GALLERYDAO WITH CONNECTION TO DB
        GalleryDao galleryDao = new GalleryDao(ConnectionProvider.getConnection());
        Gallery gallery = galleryDao.getGallleryById(id);
        // save this gallery in session ...
            session.setAttribute("updateGallery",gallery);
        %>
        <div  class="container" style="width:60vh; padding:5px; background-color: #fff; border:1px solid black; border-radius: 5px;">
            <h4 class="text-center mt-3"><font face-arial color=red>Please Edit Carefully !</font></h4>
            <form action="../UpdateGallery" method="post" enctype="multipart/form-data" class="text-center">
                <table class="table" >
                    <tr>
                        <th>Image Id</th>
                        <td><%=gallery.getId()%></td>
                    </tr>
                    <tr>
                        <th>Evant </th>
                        <td><input name="evant" class="form-control" value="<%=gallery.getEvantName()%>"</td>
                    </tr>
                   <tr>
                        <th>Old Image:</th>
                       <% String url = "../Gallery-img/"+gallery.getImageName(); %>
                        <td><a href=<%= url %> target="_blank" class="btn btn-info btn-sm text-white " >Click Here</a></td>  
                    </tr>
                    <tr>
                        <th>New Image: </th>  
                        <td><input type="file" class="form-control"  name="image"></input></td>
                    </tr> 
                </table> 
                <div class="container">
                    <button type="submit" class="btn btn-success">Save</button>   
                </div>
            </form>
        </div>    
    </body>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
</html>
