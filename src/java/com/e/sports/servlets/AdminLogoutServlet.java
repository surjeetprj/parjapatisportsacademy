package com.e.sports.servlets;
import com.e.sports.entities.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AdminLogoutServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // Initializing session Obj.
            HttpSession s = request.getSession();
            // remuving session attribute.
            s.removeAttribute("currentAdmin");
            // Preparing acknowledment message
           Message m= new Message("Logout Successfully","success", "alert-success");
           s.setAttribute("msg", m);
           // redirect user..
           response.sendRedirect("Admin_files/Admin_login.jsp");
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
