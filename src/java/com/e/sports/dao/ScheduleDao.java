package com.e.sports.dao;
import com.e.sports.entities.Schedule;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class ScheduleDao {
  private Connection con;
   // Default constructor to stablish connection from database.
    public ScheduleDao(Connection con) {
        this.con = con;
    }
    // check schedule exist by c_id
    public boolean CheckSchedule(int cId){
        boolean f= false;
        String query= "select *  from schedule_mst where c_id="+cId;
      try {
          PreparedStatement p = this.con.prepareStatement(query);
          ResultSet rs = p.executeQuery();
          f = rs.next();
      } catch (SQLException ex) {
          Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
      }  
      return f;  
    }
    // insert in  Database..
    public boolean InsertSchedule(Schedule schedule){
    boolean f =false;
    String query = "insert into schedule_mst (c_id,days,timing) values(?,?,?)";
      try {
           PreparedStatement p = this.con.prepareStatement(query);
           p.setInt(1,schedule.getcId());
           p.setString(2, schedule.getDays());
           p.setString(3, schedule.getTiming());
           p.executeUpdate();
           f=true;  
      } catch (SQLException ex) {
          Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
      }
    return f;
    }
    // getting schedule from db
    public List GetSchedule(String category){
        List<Schedule> scheduleList = new ArrayList<>();
        String query = "select * from course_mst inner join schedule_mst on course_mst.c_id=schedule_mst.c_id where c_category="+"'"+category+"'";   
      try {
          PreparedStatement p = this.con.prepareStatement(query);
          ResultSet rs = p.executeQuery();
          while(rs.next()){
              //initializing Schedule obj.
              Schedule schedule = new Schedule();
//              adding data to schedule.
              schedule.setsId(rs.getInt("s_id"));
              schedule.setcId(rs.getInt("schedule_mst.c_id"));
              schedule.setDays(rs.getString("days"));
              schedule.setTiming(rs.getString("timing"));
              schedule.setCourseCategory(rs.getString("c_category"));
              schedule.setCourseName(rs.getString("c_name"));
              // add to scheduleList
              scheduleList.add(schedule);   
          }
      } catch (SQLException ex) {
          Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
      }
   return scheduleList;
    } 
//    get Schedule by course id 
   public Schedule GetScheduleByCid(int cId){
       Schedule schedule = new Schedule();
       String query= "select * from schedule_mst where c_id="+cId;
      try {
          PreparedStatement p = this.con.prepareStatement(query);
          ResultSet rs = p.executeQuery();
          if(rs.next()){
              schedule.setsId(rs.getInt("s_id"));
              schedule.setcId(rs.getInt("c_id"));
              schedule.setDays(rs.getString("days"));
              schedule.setTiming(rs.getString("timing"));
          }
      } catch (SQLException ex) {
          Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
      }
       return schedule;
   }
   //update schedule_mst
   public boolean UpdateSchedule(Schedule schedule){
   boolean f = false;
   String query = "update schedule_mst set days=?,timing=? where c_id="+schedule.getcId();
      try {
          PreparedStatement p = this.con.prepareStatement(query);
          p.setString(1, schedule.getDays());
          p.setString(2, schedule.getTiming());
          p.executeUpdate();
          f=true;
      } catch (SQLException ex) {
          Logger.getLogger(ScheduleDao.class.getName()).log(Level.SEVERE, null, ex);
      }
   return f;
   }
}
