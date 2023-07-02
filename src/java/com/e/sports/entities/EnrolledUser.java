package com.e.sports.entities;
import java.sql.Date;
public class EnrolledUser {
    public int en_id; // enrollment ID
    public String courseName;
    public int u_id; // user ID
    public String userName;
    public Date joinDate;
    public String expiryDate;    
//    constructors..
    public EnrolledUser(){} // default Constructor.
    public EnrolledUser(int en_id, String courseName, int u_id, String userName, Date joinDate, String expiryDate) {
        this.en_id = en_id;
        this.courseName = courseName;
        this.u_id = u_id;
        this.userName = userName;
        this.joinDate = joinDate;
        this.expiryDate = expiryDate;
    }
    // Getters and Setters
    public int getEn_id() {return en_id;}
    public void setEn_id(int en_id) {   this.en_id = en_id;}
    public String getCourseName() {return courseName;}
    public void setCourseName(String courseName) {  this.courseName = courseName;}
    public int getU_id() {    return u_id;}
    public void setU_id(int u_id) {    this.u_id = u_id;}
    public String getUserName() {    return userName;}
    public void setUserName(String userName) {    this.userName = userName;}
    public Date getJoinDate() {    return joinDate;}
    public void setJoinDate(Date joinDate) {    this.joinDate = joinDate;}
    public String getExpiryDate() {    return expiryDate;}
    public void setExpiryDate(String expiryDate) {    this.expiryDate = expiryDate;} 
}
