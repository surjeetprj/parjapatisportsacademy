package com.e.sports.servlets;
import com.e.sports.dao.AdminDao;
import com.e.sports.entities.Message;
import com.e.sports.entities.Admin;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AdminLoginServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // getting parameters..
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");
            // Initializing AdminDao Obj.
            AdminDao dao = new AdminDao(ConnectionProvider.getConnection());
            Admin a =dao.getAdminByEmailAndPassword(userEmail, userPassword);
           // when user email and password not matched
            if( a==null){
                  Message msg = new Message("Invalid details ! try with another","error","alert-danger");
                  HttpSession s= request.getSession();
                  s.setAttribute("msg", msg);
                  
                  response.sendRedirect("Admin_files/Admin_login.jsp");
                  
                
            }
            //when user email and password matched
            else{
                HttpSession s = request.getSession();
                s.setAttribute("currentAdmin",a);
                response.sendRedirect("Admin_files/Admin_profile.jsp");   
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
