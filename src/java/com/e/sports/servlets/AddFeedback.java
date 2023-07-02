package com.e.sports.servlets;
import com.e.sports.dao.FeedbackDao;
import com.e.sports.entities.Feedback;
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
public class AddFeedback extends HttpServlet {  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            if (user != null) {
              int uId = user.getId();
              String comment = request.getParameter("comment"); 
              // Initialize Feedback obj with constructor
              Feedback feed = new Feedback(uId,comment);
              // Initialize FeedbackDao obj.
              FeedbackDao feedDao = new FeedbackDao(ConnectionProvider.getConnection());
              boolean b = feedDao.SaveFeedback(feed);
              if(b){
                  Message msg = new Message("<center>Feedback Uploaded Successfully.<center>", "success", "alert-success");
                  s.setAttribute("msg", msg);
              }else{
                  Message msg = new Message("<center>Something went wrong.<center>", "error", "alert-danger");
                  s.setAttribute("msg", msg);
              }
              response.sendRedirect("Feedback.jsp");
            }else{
                response.sendRedirect("Feedback.jsp");
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
