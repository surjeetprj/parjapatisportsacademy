package com.e.sports.dao;import com.e.sports.entities.EnrolledUser;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class EnrolledUserDao {
    private Connection con;
// Default constructor to stablish connection from database.
    public EnrolledUserDao(Connection con) {
        this.con = con;
    }
    // method to insert data in db...
    public boolean Insert(int cId, int uId, String expiryDate){
    boolean f=false;
    String query= "insert into enrolled_user_details (expiry_date,c_id,u_id) values(?,?,?)";
        try {
            PreparedStatement p = this.con.prepareStatement(query);
            p.setString(1,expiryDate);
            p.setInt(2, cId);
            p.setInt(3, uId);
            p.executeUpdate();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
    return f;
    }
   // check data where user id and course id exists
    public boolean CheckbyUidAndCid(int cId, int uId){
    boolean f = false;
    String query= "select * from enrolled_user_details where c_id="+cId+" and u_id="+uId ;
        try {
            PreparedStatement p = this.con.prepareStatement(query);
           ResultSet rs = p.executeQuery();
           f = rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(EnrolledUserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return f;
    }
    // get  list of course id by user id 
    public List<Integer> GetCidByUid(int uId){
   List<Integer> list = new ArrayList<>();
   int c;
    String query= "select c_id from enrolled_user_details where u_id="+uId;
        try {
            Statement smt = this.con.createStatement();
            ResultSet rs = smt.executeQuery(query);
            while(rs.next()){
              c = rs.getInt("c_id");
              list.add(c);  
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    return list;
    }
    // GET ENROLLED USER DETAILS FROM DATA BASE USING LIMIT
    public List GetEnUsers(int start, int recordCount){
    List<EnrolledUser> enUserList = new ArrayList<>();
    String query= "SELECT en_id, course_mst.c_name, enrolled_user_details.u_id, user_mst.u_first_name, user_mst.u_last_name,join_date, expiry_date  FROM enrolled_user_details \n" +
"INNER JOIN course_mst ON enrolled_user_details.c_id=course_mst.c_id \n" +
"INNER JOIN user_mst ON enrolled_user_details.u_id=user_mst.u_id ORDER BY en_id DESC LIMIT ?,?;";
        try {
            PreparedStatement p = this.con.prepareStatement(query);
            p.setInt(1, start);
            p.setInt(2,recordCount);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
             // initialising class obj
            EnrolledUser enUser = new EnrolledUser();
            // set attributes..
            enUser.setEn_id(rs.getInt(1));
            enUser.setCourseName(rs.getString(2));
            enUser.setU_id(rs.getInt(3));
            enUser.setUserName(rs.getString(4)+" "+rs.getString(5));
            enUser.setJoinDate(rs.getDate(6));
            enUser.setExpiryDate(rs.getString(7));
            // add to List
            enUserList.add(enUser);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EnrolledUserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return enUserList;
    }
    // GET TOTAL NUMBER OF RECORDS
     public int TotalRecords(){
     int total=0;
     String query="SELECT COUNT(*) FROM enrolled_user_details";
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(EnrolledUserDao.class.getName()).log(Level.SEVERE, null, ex);
        }     
     return total;
     }
    // GET TOTAL NUMBER OF USER PURCHSED PERTICULER COURSE
     public int TotalPurchase(int courseId){
     int total =0;
     String query="SELECT COUNT(*) FROM enrolled_user_details WHERE c_id="+courseId;
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(EnrolledUserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
     return total;
     }
     // GET EXPIRY DATE OF A COURSE for perticular User
     public String GetExpiryDate(int courseId, int userId){
     String expiryDate=null;
     String query = "SELECT expiry_date FROM enrolled_user_details WHERE c_id="+courseId +" AND u_id="+userId;
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 expiryDate = rs.getString(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(EnrolledUserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
     return expiryDate;
     }
}
