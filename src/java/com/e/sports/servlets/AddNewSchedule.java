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
public class AddNewSchedule extends HttpServlet {   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession s = request.getSession();
            Admin admin = (Admin)s.getAttribute("currentAdmin");
            String category = (String)s.getAttribute("InsertScheduleCategory");
            s.removeAttribute("InsertScheduleCategory");
            if(admin != null){  
                int cId = Integer.parseInt((String) s.getAttribute("InsertScheduleCid"));
                s.removeAttribute("InsertScheduleCid");
                 String days = request.getParameter("days");
                  String timing = request.getParameter("timing");
                // Schedule obj.
                Schedule schedule = new Schedule(cId,days,timing);
                // intitializing Schedule dao
                ScheduleDao scheduleDao = new ScheduleDao(ConnectionProvider.getConnection());
                boolean b = scheduleDao.InsertSchedule(schedule);
                if(b){
                    Message msg = new Message("<center>Schedule is Added Successfully</center>","success","alert-success");
                    s.setAttribute("msg", msg);
                }else{
                    Message msg = new Message("<center>Schedule is not Added Successfully</center>","error","alert-danger");
                    s.setAttribute("msg", msg); 
                    }
                if("Indoor Games".equals(category)){response.sendRedirect("Admin_files/Schedule_Indoor_G.jsp");
                }else{response.sendRedirect("Admin_files/Schedule_Outdoor_G.jsp");}
            }else{
            if(category.equals("Indoor Games")){response.sendRedirect("Admin_files/Schedule_Indoor_G.jsp");
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
