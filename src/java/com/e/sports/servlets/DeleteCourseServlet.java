package com.e.sports.servlets;
import com.e.sports.dao.CourseDao;
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
public class DeleteCourseServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // GET COURSE CATEGORY FROM PARAMETER
               String category = request.getParameter("ctgry");
            //getting Admin Obj from sesssion.
            HttpSession s = request.getSession();
            Admin admin = (Admin) s.getAttribute("currentAdmin");
            if (admin != null) {
                int id = Integer.parseInt(request.getParameter("C-id"));
                String imageName = request.getParameter("C-img");
                // delte course from database..
                CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
                boolean f = courseDao.DeleteCourseById(id);
                // image file path
                String path = request.getRealPath("/") + File.separator + "Course-img" + File.separator + imageName;
                // when course deleted successfully from Database.
                if (f) {
                    Message msg = new Message("<center>Course deleted Successfully.....</center>", "success", "alert-success");
                    s.setAttribute("msg", msg);
                    //delete image file from disk
                    if (!imageName.equals("default.png")) {
                        boolean b;
                        b = Helper.DeleteFile(path);
                    } else {
                        }
                }
                // when course failed to delete from database
                else {
                    Message msg = new Message("<center>Course not deleted Successfully.....</center>", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
//                redirect page according to course category
                if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Courses_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Courses_Outdoor_G.jsp");}
            }else{
             if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Courses_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Courses_Outdoor_G.jsp");}
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
