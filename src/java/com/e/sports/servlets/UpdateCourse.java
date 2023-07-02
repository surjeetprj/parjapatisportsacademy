package com.e.sports.servlets;
import com.e.sports.dao.CourseDao;
import com.e.sports.entities.Admin;
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
@MultipartConfig
public class UpdateCourse extends HttpServlet { 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // Initializing HttpSesion Obj.
            HttpSession s = request.getSession();
            //getting Course from session
            Courses course = (Courses) s.getAttribute("updateCourse");
            String category = course.getCategory(); // this value is used send response
            // removing attibute form session
            s.removeAttribute("updateCourse");
            Admin admin = (Admin) s.getAttribute("currentAdmin");
            if (admin != null) {
                // getting values form Parameters..
                String name = request.getParameter("course_name");
                String details = request.getParameter("course_details");
                int duration = Integer.parseInt(request.getParameter("course_duration"));
                int price = Integer.parseInt(request.getParameter("course_price"));
                Part part = request.getPart("course_image");

                String newImageName, oldImageName, emptyFile;
                // storing file name in 3 different variables
                newImageName = part.getSubmittedFileName();
                emptyFile = part.getSubmittedFileName();
                oldImageName = course.getImage();
                // when course image not updated
               if (emptyFile == null || emptyFile.isEmpty()) {
                   // this stament is usefull when user choosen any file and deault.png will be set.
                    newImageName = oldImageName; 
                }// when course Image updated 
               else {
                   // this statement makes file name unique to the user.
                    newImageName = course.getId() + newImageName; 
                }
               // save updated course information in Courses Obj.
                course.UpdateCourses(name, details,duration, price, newImageName);
                //<-----update database---->
                CourseDao courseDao = new CourseDao(ConnectionProvider.getConnection());
                // update course in database
                boolean ans = courseDao.updateCourse(course);
                // when course is updated successufully in database
                if (ans) {
//                // <---image path after updating course...---->
                    String newPath = request.getRealPath("/") + File.separator + "Course-img" + File.separator + newImageName;
                    String oldPath = request.getRealPath("/") + File.separator + "Course-img" + File.separator + oldImageName;
                    // when course image not updated by admin
                    if (emptyFile == null || emptyFile.isEmpty()) {
                        // Set Acknowledment message
                        Message msg = new Message("<center>Course updated.....</center>", "success", "alert-success");
                        s.setAttribute("msg", msg);
                    } // when couse image updated by admin
                    else {
                        // statement for delete old image file from disk
                        if (!oldImageName.equals("default.png")) {
                            Helper.DeleteFile(oldPath);
                        } else { }
                        //statement to save new image file into disk and sending acknowledgment to the user..  
                        if (Helper.SaveFile(part.getInputStream(), newPath)) {
                            Message msg = new Message("<center>Course updated.....</center>", "success", "alert-success");
                            s.setAttribute("msg", msg);
                        } else {
                            Message msg = new Message("<center>file not saved...</center>", "error", "alert-danger");
                            s.setAttribute("msg", msg);
                            course.setImage(oldImageName);
                        }
                    }
                } // when failed to update course details in Database
                else {
                    Message msg = new Message("<center>Course not updated...</center>", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                    course.setImage(oldImageName);
                }
                // redirect page corresponding to their course category
                if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Courses_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Courses_Outdoor_G.jsp");}
            
            }else{if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Courses_Indoor_G.jsp");
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
