package com.e.sports.servlets;
import com.e.sports.dao.EnrolledUserDao;
import com.e.sports.dao.FeeDao;
import com.e.sports.entities.Message;
import com.e.sports.entities.User;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class BuyCourseServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
             // Intializing HttpSession obj
           HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            if (user != null) {
                // getting parameters
                int cId = Integer.parseInt(request.getParameter("c-id"));
                int cDuration = Integer.parseInt(request.getParameter("c-duration"));
                int uId = user.getId(); // get User id of current user in session
                // get expiry date from current date...
                Date date = new Date();
                date.getDate();
                Calendar now = Calendar.getInstance();
                now.setTime(date);
                now.add(Calendar.MONTH, cDuration);
                String expiryDate = now.get(Calendar.YEAR) + "-" + (now.get(Calendar.MONTH) + 1) + "-"
                        + now.get(Calendar.DATE);
                 // insert to fee_mst in db..
                boolean f=false,b=false;
                   FeeDao feeDao = new FeeDao(ConnectionProvider.getConnection());
                   f= feeDao.Insert(uId, cId, true);
                   // when fee status successfully inserted in db
                   if(f){
                   // insert Enrolled User Details in db..
                EnrolledUserDao enrollCourseDao = new EnrolledUserDao(ConnectionProvider.getConnection());
                 b = enrollCourseDao.Insert(cId, uId, expiryDate);
                   }
                   // When both fee and enrolled user details  successfully inserted in db
                if(b && f){
                    Message msg = new Message("<center>You have successfully enrolled.<center>", "success", "alert-success");
                     s.setAttribute("msg", msg);
                }else{
                    if(!f){
                        // Acknowledment Message when fee is not inserted in db
                    Message msg = new Message("<center>Payment fialed!!!.<center>", "error", "alert-danger");
                       s.setAttribute("msg", msg);
                    }// Acknowledment Message when user not inserted in EnrolledUser_mst table
                    else{Message msg = new Message("<center>Something Went wrong!!!.<center>", "error", "alert-danger");
                        s.setAttribute("msg", msg);}
                }
                // redirect user..
                response.sendRedirect("profile.jsp");
            } else {
                // redirect user when User Obj is null
                response.sendRedirect("BuyCourse.jsp");
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
