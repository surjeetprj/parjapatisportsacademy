package com.e.sports.dao;
import com.e.sports.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class UserDao {
    private Connection con;
  // Default constructor to stablish connection from database.
    public UserDao(Connection con) {
        this.con = con;
    }
    //method to inser user to the database.
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //INSERT INTO DATABASE
            String query = "insert into user_mst(u_first_name,u_last_name,u_dob,u_age,u_contact,u_email,u_password,u_house_no,u_area,u_city,u_state,u_pincode,u_gender) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            // set sql PreparedStatement
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getDob());
            pstmt.setInt(4, user.getAge());
            pstmt.setLong(5, user.getContact());
            pstmt.setString(6, user.getEmail());
            pstmt.setString(7, user.getPassword());
            pstmt.setInt(8, user.getHouseNo());
            pstmt.setString(9, user.getArea());
            pstmt.setString(10, user.getCity());
            pstmt.setString(11, user.getState());
            pstmt.setInt(12, user.getPincode());
            pstmt.setString(13, user.getGender());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }
    //get user by usermail and userpassword
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user_mst where u_email =? and u_password =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();
//            data from db
                String name = set.getString("u_first_name");
//            set attributes of User object
                user.setName(name);
                user.setLastName(set.getString("u_last_name"));
                user.setId(set.getInt("u_id"));
                user.setContact(set.getLong("u_contact"));
                user.setEmail(set.getString("u_email"));
                user.setPassword(set.getString("u_password"));
                user.setGender(set.getString("u_gender"));
                user.setDob(set.getString("u_dob"));
                user.setAge(set.getInt("u_age"));
                user.setHouseNo(set.getInt("u_house_no"));
                user.setArea(set.getString("u_area"));
                user.setCity(set.getString("u_city"));
                user.setState(set.getString("u_state"));
                user.setPincode(set.getInt("u_pincode"));
                user.setImage(set.getString("u_image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
// UPDATE USER IN DATABSE
    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update user_mst set u_first_name=? , u_last_name=?, u_contact=?, u_email=? ,  u_password=?,  u_dob=?, u_age=?,  u_house_no=?,  u_area=?,  u_city=?,  u_state=?,  u_pincode=?,  u_image=? where u_id=? ";
            PreparedStatement p = con.prepareStatement(query);
            //set sql PreparedStatement
            p.setString(1, user.getName());
            p.setString(2, user.getLastName());
            p.setLong(3, user.getContact());
            p.setString(4, user.getEmail());
            p.setString(5, user.getPassword());
            p.setString(6, user.getDob());
            p.setInt(7,user.getAge());
            p.setInt(8, user.getHouseNo());
            p.setString(9, user.getArea());
            p.setString(10, user.getCity());
            p.setString(11, user.getState());
            p.setInt(12, user.getPincode());
            p.setString(13, user.getImage());
            p.setInt(14, user.getId());
            //execute sql query
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    //  GET USER DETAILS FROM DB USING LIMIT
    public List GetUsers(int start,int recordCount){
      List<User> userList = new ArrayList<>();
      String query ="SELECT * FROM user_mst ORDER BY u_id DESC LIMIT ?,?; ";
        try {
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1,start);
            p.setInt(2,recordCount);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                // INITIALIZING USER OBJ
                User user = new User();
//                 data from db
                String name = rs.getString("u_first_name");
//              set to user object
                user.setName(name);
                user.setLastName(rs.getString("u_last_name"));
                user.setId(rs.getInt("u_id"));
                user.setContact(rs.getLong("u_contact"));
                user.setEmail(rs.getString("u_email"));
                user.setGender(rs.getString("u_gender"));
                user.setDob(rs.getString("u_dob"));
                user.setAge(rs.getInt("u_age"));
                user.setHouseNo(rs.getInt("u_house_no"));
                user.setArea(rs.getString("u_area"));
                user.setCity(rs.getString("u_city"));
                user.setState(rs.getString("u_state"));
                user.setPincode(rs.getInt("u_pincode"));
                user.setImage(rs.getString("u_image"));
                // ADD USER TO LIST
                userList.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }     
     return userList;   
    }
    // GET TOTAL NUMBER OF RECORDS
     public int TotalRecords(){
     int total=0;
     String query="SELECT COUNT(*) FROM user_mst";
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }     
     return total;
     }  
}
