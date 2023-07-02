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
public class UpdateGallery extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
           // Initializing HttpSession Obj.
            HttpSession s = request.getSession();
            // getting session Atrribute
            Gallery gallery = (Gallery) s.getAttribute("updateGallery");
            // removing Session atttribute
            s.removeAttribute("updateGallery");
            // getting session Atrribute
            Admin admin = (Admin) s.getAttribute("currentAdmin");
            if (admin != null) {
                // getting value from paramenters..
                String evant = request.getParameter("evant");
                Part part = request.getPart("image");
                // Declaring Variables
                 String newImageName, oldImageName, emptyFile;
                // storing file name in 3 different variables
                newImageName = part.getSubmittedFileName();
                emptyFile = part.getSubmittedFileName();
                oldImageName = gallery.getImageName();
                // when gallery image not updated
                if (emptyFile == null || emptyFile.isEmpty()) {
                    // this stament is usefull when user choosen any file and deault.png will be set.
                    newImageName = oldImageName; 
                } else {
                    // this statement makes file name unique to the user.
                    newImageName = gallery.getId() + newImageName; 
                }
//                <----- save Gallery details in current gallery object----->
                gallery.UpdateGallery(evant,newImageName);
                //<-----update database---->
                GalleryDao galleryDao = new GalleryDao(ConnectionProvider.getConnection());
                boolean b = galleryDao.UpdateGallery(gallery);
                // when gallery updated successfully.
                if(b){
                   // set path
                    String path = request.getRealPath("/") + File.separator + "Gallery-img" + File.separator + newImageName;
                   // Admin not updated gallery image
                    if (emptyFile == null || emptyFile.isEmpty()) {
                        Message msg = new Message("<center>Gallery updated.....</center>", "success", "alert-success");
                        s.setAttribute("msg", msg);
                    }// when Admin udated Gallery Image
                    else{
                        // Saving update image in disk
                        if (Helper.SaveFile(part.getInputStream(), path)) {
                            Message msg = new Message("<center>The Gallery has been successfully updated.<center>", "success", "alert-success");
                            s.setAttribute("msg", msg);
                        } // when image failed to save in disk
                        else {
                            Message msg = new Message("<center>The Gallery image not saved.. </center>", "error", "alert-danger");
                            s.setAttribute("msg", msg);
                        }
                    }
                }//when course failed to update in database
                else{
                    Message msg = new Message("<center>The Galley Inforamtion is not saved in db.<center>", "error", "alert-danger");
                     s.setAttribute("msg", msg);
                     }
            // redirect page
                response.sendRedirect("Admin_files/Gallery.jsp");
            }// when Admin obj. is null
            else{// redirect page
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
