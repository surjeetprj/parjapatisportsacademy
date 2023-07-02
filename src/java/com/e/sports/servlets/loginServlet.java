package com.e.sports.servlets;
import com.e.sports.dao.UserDao;
import com.e.sports.entities.Message;
import com.e.sports.entities.User;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class loginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
      
//            getting user email and password from parameters
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");
            //Initializing UserDao Obj with default constructor
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            // Match user email and password in databse and return User Obj.
            User u =dao.getUserByEmailAndPassword(userEmail, userPassword);
             // when user email and password not matched in database
            if( u==null){
                   // set acknowledment message
                  Message msg = new Message("Invalid details ! try with another","error","alert-danger");
                  HttpSession s= request.getSession();
                  s.setAttribute("msg", msg);
                  // redirect page
                  response.sendRedirect("login_page.jsp");
            }// when uer email and password matched in databse
            else{
                HttpSession s = request.getSession();
                // set user obj in session 
                s.setAttribute("currentUser",u);
                response.sendRedirect("profile.jsp"); 
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
