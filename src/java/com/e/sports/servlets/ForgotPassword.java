package com.e.sports.servlets;import com.e.sports.entities.Message;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
public class ForgotPassword extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try (PrintWriter out = response.getWriter()) {
           // getting email from prameter 
           String email = request.getParameter("email");
           // store email id in the session
            HttpSession s = request.getSession();
            s.setAttribute("resetPasswordEmail", email);
//            <--- varifying emial Id ----->
          final Connection con = ConnectionProvider.getConnection(); // Stablishing connection to db
          String query = "select * from user_mst where u_email='"+email+"'";
          PreparedStatement p = con.prepareStatement(query);
          ResultSet rs = p.executeQuery();
          // when user email id matched
         if(rs.next()){
             // redirect page to set new passord
             response.sendRedirect("newPassword.jsp");
         }// when user email Id not matched
         else{
            Message msg = new Message("<center>Email Id is not Registered</center>","error","alert-danger");
            s.setAttribute("msg",msg);
         response.sendRedirect("forgotPassword.jsp");
         }
        } catch (SQLException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
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
