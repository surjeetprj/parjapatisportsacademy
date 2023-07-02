package com.e.sports.servlets;
import com.e.sports.entities.Message;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class NewPassword extends HttpServlet { 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // getting password from parameter
            String password = request.getParameter("password");
           // Initializing HttpSession Obj.
             HttpSession s = request.getSession();
             // getting email id from session.
            String email = (String) s.getAttribute("resetPasswordEmail");
            // Remuving Attribute from session
            s.removeAttribute("resetPasswordEmail");
            // <----UPDATE PASSWORD CORRESPONDING TO USER EMAIL IN DATABASE ---->
            String query="update user_mst set u_password=? where u_email=?";
            final Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1,password);
            p.setString(2,email);
            // exucute update returns
           int rowCount = p.executeUpdate();
          //when password reset successfully
           if(rowCount != 0){
               // Set Acknowledment message.
               Message msg = new Message("<center>Your password has been reset successfully!<br>Plz Login with new password</center>","success","alert-success");
            s.setAttribute("msg",msg);
            // redirect page
            response.sendRedirect("login_page.jsp"); 
           }// when password failed to reset
           else{
            Message msg = new Message("<center>Yuur password is not reset.!!<br> Plz try Again.</center>","error","alert-danger");
            s.setAttribute("msg",msg);
            response.sendRedirect("newPassword.jsp");
           }
        } catch (SQLException ex) {
            Logger.getLogger(NewPassword.class.getName()).log(Level.SEVERE, null, ex);
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
