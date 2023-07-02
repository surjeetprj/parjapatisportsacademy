package com.e.sports.servlets;
import com.e.sports.dao.GalleryDao;
import com.e.sports.entities.Admin;
import com.e.sports.entities.Message;
import com.e.sports.helper.ConnectionProvider;
import com.e.sports.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class DeleteGalleryServlet extends HttpServlet { 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // getting Admin Obj. from session
            HttpSession s = request.getSession();
            Admin admin = (Admin) s.getAttribute("currentAdmin");
            if (admin != null) {
                int id = Integer.parseInt(request.getParameter("C-id"));
                String imageName = request.getParameter("C-img");
                 // delete gallery cell from database..
                GalleryDao galleryDao = new GalleryDao(ConnectionProvider.getConnection());
                boolean b = galleryDao.DeleteGallery(id);
                // image file path
                String path = request.getRealPath("/") + File.separator + "Gallery-img" + File.separator + imageName;
                // when Course deleted successfully from database
                if (b) {
                    //delete image file from disk
                     boolean t;
                        t = Helper.DeleteFile(path);
                    if(t){
                        // Acknowledment message..
                    Message msg = new Message("<center>Gallery cell deleted Successfully.....</center>", "success", "alert-success");
                    s.setAttribute("msg", msg);
                    } else { Message msg = new Message("<center>Gallery image is not deleted Successfully from disk.....</center>", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                    }
                } 
                // when course failed to delete from database
                else {
                    Message msg = new Message("<center>Gallery cell not deleted Successfully.....</center>", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
                // redirect page...
               response.sendRedirect("Admin_files/Gallery.jsp");
            }else{
                response.sendRedirect("Admin_files/Gallery.jsp");
            }
        }
    }@Override
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
