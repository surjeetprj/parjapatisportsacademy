package com.e.sports.servlets;
import com.e.sports.dao.ScheduleDao;
import com.e.sports.entities.Admin;
import com.e.sports.entities.Message;
import com.e.sports.entities.Schedule;
import com.e.sports.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class UpdateSchedule extends HttpServlet { 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // Initializing HttpSession Obj.
           HttpSession s = request.getSession();
           // getting attributes from session
            Admin admin = (Admin)s.getAttribute("currentAdmin");
            String category = (String)s.getAttribute("UpdateScheduleCategory");
           // removing Atribute from session
            s.removeAttribute("UpdateScheduleCategory");
            // when current Admin is not null
            if(admin != null){
             // getting values form parameters...
            int cId = (int) s.getAttribute("UpdateScheduleCid");
            String days = request.getParameter("days");
            String timing = request.getParameter("timing");
            // save updated schedule details Schedule Obj
            Schedule schedule = new Schedule(cId,days,timing);
            // udating Schedule in db
            ScheduleDao scheduleDao = new ScheduleDao(ConnectionProvider.getConnection());
             boolean b = scheduleDao.UpdateSchedule(schedule);
             //when schedule updated successfully in database
             if(b){
                 // set acknowledment message
             Message msg = new Message("<center>Schedule Updadated Successfully .</center>","success","alert-success");
             s.setAttribute("msg", msg);
             }//when schedule failed to update in database
             else{Message msg = new Message("<center>Schedule not Udadated !!!.</center>","error","alert-danger");
             s.setAttribute("msg", msg);
             }// redirect page according to course category
            if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Schedule_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Schedule_Outdoor_G.jsp");}
            }else{
            if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Schedule_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Schedule_Outdoor_G.jsp");}
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
