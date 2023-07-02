package com.e.sports.servlets;
import com.e.sports.dao.UserDao;
import com.e.sports.entities.Message;
import com.e.sports.entities.User;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@MultipartConfig
public class RegisterServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {     
            // getting value from parameter 
            String check = request.getParameter("check");
            if (check == null) {
                out.println("box not checked");
            } else {
                // getting rest of parameters value..
                String name = request.getParameter("first_name");
                String lastName = request.getParameter("last_name");
                long contact = Long.parseLong(request.getParameter("contact"));
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("user_gender");
                String dob = request.getParameter("dob");
                int age = Integer.parseInt(request.getParameter("age"));
                int houseNo = Integer.parseInt(request.getParameter("houseNo"));
                String area = request.getParameter("area");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                int pincode = Integer.parseInt(request.getParameter("pincode"));
                //create user object and set all data to that object.
                User user = new User(name, lastName, contact, email, password, gender, dob, age, houseNo, area, city, state, pincode);
                //create user dao object.
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                 // when user details inserted successfully in database
                if (dao.saveUser(user)) {
                    //Set Acknowledment message.
                    Message msg = new Message("<center>You have successfully registered ! <br> plz login.. </center>","success","alert-success");
                  HttpSession s= request.getSession();
                  s.setAttribute("msg", msg);
                  // redirect page
                   response.sendRedirect("login_page.jsp");
                }//when user datails failed to insert in database 
                else {
                    // Set Acknowledmetn message
                   Message msg = new Message("<center>Something went Wrong !!  <br> please try agian ! </center>","error","alert-danger");
                  HttpSession s= request.getSession();
                  s.setAttribute("msg", msg);
                  // redirect page
                   response.sendRedirect("registration_page.jsp");
                }
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
