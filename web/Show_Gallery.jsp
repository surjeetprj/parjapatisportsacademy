<%@page import="com.e.sports.entities.Gallery"%>
<%@page import="java.util.List"%>
<%@page import="com.e.sports.dao.GalleryDao"%>
<%@page import="com.e.sports.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="com.e.sports.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gallery</title>
        <!--css-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.1.1/css/all.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/lightbox.css">
    </head>
    <body>
        <!--Header of the page-->
        <%@include file="header.jsp" %>
        <!--End of the header-->
        <!--nav bar-->
        <%//getting current user from session
             User user = (User)session.getAttribute("currentUser");
             if(user == null){
            %>
        <%@include file="normal_navbar.jsp" %>
        <%}else{%>
        <%@include file="logedin_user_navbar.jsp" %>
        <%}%>
        <div class="container  mt-3 mb-4">
            <div class="row">
        <% 
        int start=0, recordCount=6;
        int pgNO = request.getParameter("pgNo")==null?0:Integer.parseInt( request.getParameter("pgNo"));
        start = pgNO*recordCount; 
        // INITIALIZING GALLERYDAO WITH CONNECTION TO DB
         GalleryDao galleryDao = new GalleryDao(ConnectionProvider.getConnection());
         List<Gallery> galleryList = null;
         galleryList = galleryDao.GetGallery(start,recordCount);
         // GET TOTAL NUMBER OF RECORDS
        int total = galleryDao.TotalRecords();
         for(Gallery g: galleryList){
        %>
           <div class="col-lg-4 col-sm-6">
               <div class="p-1">
                   <a href="Gallery-img/<%= g.getImageName()%>" data-lightbox="<%=g.getEvantName() %>" data-title="<%=g.getEvantName() %>" >   
          <img width="100%" height="auto" src="Gallery-img/<%= g.getImageName()%>" alt="Gallery-img/<%=g.getImageName()%>">
          </a>
          </div>
           </div>
      <% 
        }
      %>
      <div class="container mt-3 mb-2 text-center" style="display:flex;justify-content:center;" >
          <p style="color:blue ;font-size:1.5rem; margin-right:2rem;"><%=pgNO+1%> of <%=(total % recordCount == 0)?total/recordCount:total/recordCount+1 %></p>                    
         <div style=" color: white; margin-right: 2rem;"><a href="Show_Gallery.jsp?pgNo=<%=pgNO-1%>" class="btn btn-dark <%= (start==0)?"disabled":""%> "><i class="fa-solid fa-chevron-left"></i></a></div>
         <div style="  color: white"><a href="Show_Gallery.jsp?pgNo=<%=pgNO+1%>" class="btn btn-dark <%= (start+recordCount>=total)?"disabled":" " %> "><i class="fa-solid fa-chevron-right"></i></a></div>
      </div>
    </div>
        </div>
          <!--FOOTER OF THE PAGE-->
         <%@include file="Footer.jsp" %>
        <!--JavaScript-->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
        <script src="JavaScript/lightbox-plus-jquery.js"></script>
    </body>
</html>
