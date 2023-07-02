package com.e.sports.dao;
import com.e.sports.entities.Fee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class FeeDao {
    final Connection con;
    // Default constructor to stablish connection from database.
    public FeeDao(Connection con) {
        this.con = con;
    }
    // INSERT PAYMENT STATUS IN DATABASE
    public boolean Insert(int uId, int cId, boolean payStatus){
        boolean f=false;
            String query = "insert into fee_mst (u_id,c_id,pay_status) values(?,?,?)"; 
        try {
            PreparedStatement p =this.con.prepareStatement(query);
            p.setInt(1, uId);
            p.setInt(2, cId);
            p.setBoolean(3,payStatus );
            p.executeUpdate();
          f=true;
        } catch (Exception ex) {
                ex.printStackTrace();
        }
        return f;
    }
    // method to get User Id by Course Id;;
     public int GetUidByCid(int cId){
        int uId=0;
            String query="select u_id from fee_mst where c_id="+cId;
        try {
            PreparedStatement p = this.con.prepareStatement(query);
            ResultSet rs = p.executeQuery();
            if(rs.next()){
            uId = rs.getInt("u_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return uId;
    }
//      get all data from fee_mst and neccessary information from user_mst and course_mst
//      show rocords using limit
     public List GetFeeStatus (int start, int recordCount){
     List<Fee> feeList = new ArrayList<>();
     String query = "SELECT pay_id, fee_mst.c_id, fee_mst.u_id, pay_status, course_mst.c_name,course_mst.c_price, user_mst.u_first_name ,user_mst.u_last_name\n" +
" FROM fee_mst INNER JOIN course_mst ON fee_mst.c_id=course_mst.c_id \n" +
"INNER JOIN user_mst ON fee_mst.u_id=user_mst.u_id  ORDER BY pay_id DESC LIMIT ?,?; ";
        try {
            PreparedStatement p = this.con.prepareStatement(query);
            p.setInt(1,start);
            p.setInt(2,recordCount);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                // initializing Fee obj
                Fee fee = new Fee();
                // setting values to Fee obj from db
            fee.setpId(rs.getInt(1));
            fee.setcId(rs.getInt(2));
            fee.setuId(rs.getInt(3));
            fee.setpStatus(rs.getBoolean(4));
            fee.setCourseName(rs.getString(5));
            fee.setCoursePrice(rs.getInt(6));
            fee.setUserName(rs.getString(7)+" "+rs.getString(8));
            // add Fee obj to Array List
            feeList.add(fee);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
     return feeList;
     }
     // GET TOTAL NUMBER OF RECORDS
     public int TotalRecords(){
     int total=0;
     String query="SELECT COUNT(*) FROM fee_mst";
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(FeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }     
     return total;
     }   
}
