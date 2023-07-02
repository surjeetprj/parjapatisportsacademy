package com.e.sports.entities;
public class Fee {
    private int pId;  // payment Id
    private int uId;  // user Id
    private int cId;  // Course id
    private boolean pStatus;  // payment Status
    private String userName;
    private String courseName;
    private int coursePrice;
    
// Constructors ...
    public Fee(int pId, int uId, int cId, boolean pStatus, String userName, String courseName, int coursePrice) {
        this.pId = pId;
        this.uId = uId;
        this.cId = cId;
        this.pStatus = pStatus;
        this.userName = userName;
        this.courseName = courseName;
        this.coursePrice = coursePrice;
    }
    public Fee(){} // defualt constructor
    // getters and setters
    public int getpId() {   return pId;}
    public void setpId(int pId) {   this.pId = pId;}
    public int getuId() {    return uId;}
    public void setuId(int uId) {    this.uId = uId;}
    public int getcId() {    return cId;}
    public void setcId(int cId) {    this.cId = cId; }
    public boolean ispStatus() {   return pStatus;}
    public void setpStatus(boolean pStatus) {   this.pStatus = pStatus;}
    public String getUserName() {    return userName;}
    public void setUserName(String userName) {   this.userName = userName;}
    public String getCourseName() {  return courseName;}
    public void setCourseName(String courseName) {this.courseName = courseName;}
    public int getCoursePrice() { return coursePrice; }
    public void setCoursePrice(int coursePrice) {   this.coursePrice = coursePrice;}  
}
