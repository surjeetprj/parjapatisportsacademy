package com.e.sports.dao;
import com.e.sports.entities.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class FeedbackDao {
   private Connection con;
// Default constructor to stablish connection from database.
    public FeedbackDao(Connection con) {
        this.con = con;
    }
    // INSERT TO DB WHEN USER ID IS NOT NULL
    public boolean SaveFeedback(Feedback feed){
    boolean f= false;
    String query = "insert into feedback_mst (u_id,f_comment) values(?,?)";
       try {
           PreparedStatement p =this.con.prepareStatement(query);
           p.setInt(1, feed.getuId());
           p.setString(2, feed.getComment());
           p.executeUpdate();
           f=true;
       } catch (SQLException ex) {
           Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
       }  
    return f;
    }
    // INSERT TO DB WHEN FEEBACK FROM NORMAL USER
    public boolean SaveFeedbackNormalUser(String comment){
    boolean f= false;
    String query = "insert into feedback_mst (f_comment) values(?)";
       try {
           PreparedStatement p =this.con.prepareStatement(query);
           p.setString(1, comment);
           p.executeUpdate();
           f=true;
       } catch (SQLException ex) {
           Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
       } 
    return f;
    }
   // GET FEEDBACK FROM DATABASE USING LIMIT
    public List GetFeedback(int start, int recordCount){
    List<Feedback> feedList = new ArrayList<>();
    String query = "select f_id, feedback_mst.u_id, user_mst.u_first_name, user_mst.u_last_name, feedback_mst.f_comment from feedback_mst \n" +
    "INNER JOIN user_mst ON feedback_mst.u_id = user_mst.u_id ORDER BY f_id DESC LIMIT ?,?;";
       try {
           PreparedStatement p =this.con.prepareStatement(query);
           p.setInt(1, start);
           p.setInt(2, recordCount);
           ResultSet rs = p.executeQuery();
           while(rs.next()){
               // INITIALIZE FEEDBACK OBJ
               Feedback feed = new Feedback();
               // GET INFO FROM DB AND SAVE TO feed OBJ
               feed.setId(rs.getInt(1));
               feed.setuId(rs.getInt(2));
               feed.setUserName(rs.getString(3)+" "+rs.getString(4));
               feed.setComment(rs.getString(5));
               // ADD fedd OBJ TO LIST
               feedList.add(feed);
           }
       } catch (SQLException ex) {
           Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
       }
    return feedList;
    }
   // GET NORMAL USER FEEDBACK FROM DATABASE USING LIMIT
    public List GetFeedbackNormalUser(int start, int recordCount){
    List<Feedback> feedList = new ArrayList<>();
    String query = "select f_id,f_comment from feedback_mst WHERE (u_id IS NULL) \n" +
    "ORDER BY f_id DESC LIMIT ?,?;";
       try {
           PreparedStatement p =this.con.prepareStatement(query);
           p.setInt(1, start);
           p.setInt(2, recordCount);
           ResultSet rs = p.executeQuery();
           while(rs.next()){
               // INITIALIZE FEEDBACK OBJ
               Feedback feed = new Feedback();
               // GET INFO FROM DB AND SAVE TO feed OBJ
               feed.setId(rs.getInt(1));
               feed.setComment(rs.getString(2));
               // ADD fedd OBJ TO LIST
               feedList.add(feed);
           }
       } catch (SQLException ex) {
           Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
       }
    return feedList;
    }
    // GET TOTAL NUMBER OF RECORDS WHERE USER ID IS NOT NULL
     public int TotalRecords(){
     int total=0;
     String query="SELECT COUNT(*) FROM feedback_mst WHERE (u_id IS NOT NULL)";
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
        }     
     return total;
     }
     // GET TOTAL NUMBER OF RECORDS WHERE USER ID IS NULL
     public int TotalRecordsNormalUser(){
     int total=0;
     String query="SELECT COUNT(*) FROM feedback_mst WHERE (u_id IS NULL)";
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDao.class.getName()).log(Level.SEVERE, null, ex);
        }   
     return total;
     }
}
