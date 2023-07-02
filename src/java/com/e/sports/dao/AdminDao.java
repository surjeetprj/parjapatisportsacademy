package com.e.sports.dao;import com.e.sports.entities.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class AdminDao { 
    private Connection con;
   // Default constructor to stablish connection from database.
    public AdminDao(Connection con) {
        this.con = con;
    }
    //get admin by admin email and admin password
    public Admin getAdminByEmailAndPassword(String email, String password) {
        Admin admin = null;
        try {
            String query = "select * from admin_mst where a_email =? and a_password =?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                admin = new Admin();
//            data from db
                String name = set.getString("a_name");
//            set to user object
                admin.setName(name);
                admin.setContact(set.getLong("a_contact"));
                admin.setEmail(set.getString("a_email"));
                admin.setPassword(set.getString("a_password")); 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
    
}
