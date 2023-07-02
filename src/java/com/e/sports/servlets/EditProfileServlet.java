package com.e.sports.servlets;
import com.e.sports.dao.UserDao;
import com.e.sports.entities.Message;
import com.e.sports.entities.User;
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
public class EditProfileServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            //<----get the user from sesssion..------>,
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            if (user != null) {
                //getting value from parameters
                String firstName = request.getParameter("user_firstName");
                String lastName = request.getParameter("user_lastName");
                long contact = Long.parseLong(request.getParameter("user_contact"));
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String dob = request.getParameter("user_dob");
                int age = Integer.parseInt(request.getParameter("age"));
                int houseNo = Integer.parseInt(request.getParameter("user_houseNo"));
                String area = request.getParameter("user_area");
                String city = request.getParameter("user_city");
                String state = request.getParameter("user_state");
                int pincode = Integer.parseInt(request.getParameter("user_pincode"));
                Part part = request.getPart("user_image");
                // Declaring variables.
                String newImageName, oldImageName, emptyFile;
                // storing file name in 3 defferent variables
                newImageName = part.getSubmittedFileName();
                emptyFile = part.getSubmittedFileName();
                oldImageName = user.getImage();
                // when user not updated profile image
                if (emptyFile == null || emptyFile.isEmpty()) {
                    // this stament is usefull when user choosen any file and deault.png will be set.
                    newImageName = oldImageName;
                }
                // when user updated profile image
                else {
                    // this statement makes file name unique to the user.
                    newImageName = user.getId() + newImageName; }
//            <----- save updated information in current user object----->
                user.EditProfile(firstName, lastName, contact, email, password, dob,age, houseNo, area, city, state, pincode, newImageName);
                //<-----update database---->
                UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                boolean ans = userDao.updateUser(user);
                // when user profile information update successfully.
                if (ans) {
//                // <---image path after updating the user...---->
                    String newPath = request.getRealPath("/") + File.separator + "pics" + File.separator + user.getImage();
                    String oldPath = request.getRealPath("/") + File.separator + "pics" + File.separator + oldImageName;
                    if (emptyFile == null || emptyFile.isEmpty()) {
                        Message msg = new Message("<center>Profile details  updated.....</center>", "success", "alert-success");
                        s.setAttribute("msg", msg);
                    } else {
                        // statement for delete old image file from disk
                        if (!oldImageName.equals("default.png")) {
                            boolean b;
                            b = Helper.DeleteFile(oldPath);
//                        
                        } else { }
                        //statement to save new image file into disk and sending acknowledgment to the user..  
                        if (Helper.SaveFile(part.getInputStream(), newPath)) {
                            Message msg = new Message("<center>Profile details  updated.....</center>", "success", "alert-success");
                            s.setAttribute("msg", msg);
                        } else {
                            Message msg = new Message("<center>file not saved...</center>", "error", "alert-danger");
                            s.setAttribute("msg", msg);
                            user.setImage(oldImageName);
                        }
                    }
                } 
                // when user details failed to update in databse.
                else {
                    Message msg = new Message("<center>Profile detail not updated...</center>", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                    user.setImage(oldImageName);
                }
                //redirect page
                response.sendRedirect("profile.jsp");
            }
            // when Admin Obj. is null
            else{
                response.sendRedirect("profile.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
