package com.e.sports.servlets;import com.e.sports.dao.CourseDao;
import com.e.sports.entities.Courses;
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
import com.e.sports.entities.Admin;
@MultipartConfig
public class AddNewCourse extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {  
            String category = request.getParameter("category"); // it is used to send response
            HttpSession s = request.getSession(); // initializing session obj
            Admin admin = (Admin) s.getAttribute("currentAdmin");
            if (admin != null) {
                String name = request.getParameter("name");
                String details = request.getParameter("details");
                int duration = Integer.parseInt(request.getParameter("duration"));
                int price = Integer.parseInt(request.getParameter("price"));
                Part part = request.getPart("image");
                String imageName = part.getSubmittedFileName();
                if (imageName == null || imageName.isEmpty()) {
                    imageName = "default.png"; // this stament is usefull when no image file is choosen and deault.png will be set.
                }
                // Initializing Courses obj with constructor
                Courses course = new Courses(name, details,duration, price, imageName, category);
                CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
                boolean ans = courseDao.AddCourse(course);
                if (ans) {
                    // getting file path
                    String path = request.getRealPath("/") + File.separator + "Course-img" + File.separator + imageName;
                    if (!imageName.equals("default.png")) {
                        if (Helper.SaveFile(part.getInputStream(), path)) {
                                Message msg = new Message("<center>The course has been successfully saved.<center>", "success", "alert-success");
                                s.setAttribute("msg", msg);
                        }else {
                                Message msg = new Message("<center>The course image not saved.. </center>", "error", "alert-danger");
                                s.setAttribute("msg", msg);
                        }
                    }else{   Message msg = new Message("<center>The course has been successfully saved.<center>", "success", "alert-success");
                            s.setAttribute("msg", msg);
                           }
                }else {
                    Message msg = new Message("<center>The course not saved in databse.. </center>", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
                if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Courses_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Courses_Outdoor_G.jsp");}
            } else {
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
