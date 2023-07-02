package com.e.sports.servlets;
import com.e.sports.dao.GalleryDao;
import com.e.sports.entities.Admin;
import com.e.sports.entities.Gallery;
import com.e.sports.entities.Message;
import com.e.sports.helper.ConnectionProvider;
import com.e.sports.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig
public class AddToGallery extends HttpServlet {    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Intializing HttpSession obj
           HttpSession s = request.getSession();
           Admin admin = (Admin) s.getAttribute("currentAdmin");
           if(admin != null){
               String evant = request.getParameter("evant");
                Part part = request.getPart("image");
                 String imageName = part.getSubmittedFileName();
                 // Save info. to gallery object
                 Gallery gallery = new Gallery(imageName,evant);
                // INITIALIZING GalleryDao WITH CONNECTION
                 GalleryDao galleryDao = new GalleryDao(ConnectionProvider.getConnection());
                boolean b = galleryDao.SaveGallery(gallery);
                // when gallery successfully inserted in db
                if(b){
                    // set path
                    String path = request.getRealPath("/") + File.separator + "Gallery-img" + File.separator + imageName;
                    if (Helper.SaveFile(part.getInputStream(), path)) {
                            Message msg = new Message("<center>The information has been successfully saved.<center>", "success", "alert-success");
                            s.setAttribute("msg", msg);
                        } else {
                            Message msg = new Message("<center>The Gallery image not saved.. </center>", "error", "alert-danger");
                            s.setAttribute("msg", msg);
                        }
                // when gallery falled to insert in db    
                }else{
                    Message msg = new Message("<center>The information not saved in db.<center>", "success", "alert-success");
                     s.setAttribute("msg", msg);
                     }
                 response.sendRedirect("Admin_files/Gallery.jsp");
              }
              else{
               response.sendRedirect("Admin_files/Gallery.jsp");
           }
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
