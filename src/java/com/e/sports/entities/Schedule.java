package com.e.sports.entities;
public class Schedule {
   private int sId;
   private int cId;
   private String days;
   private String timing;
   private String courseName; // used to show schedule
   private String courseCategory; // used to show schedule
   // Constructors...
   public Schedule(){}// default constructor.
    public Schedule(int sId, int cId, String days, String timing, String courseName, String courseCategory) {
        this.sId = sId;
        this.cId = cId;
        this.days = days;
        this.timing = timing;
        this.courseCategory = courseCategory;
        this.courseName = courseName;
    }
    public Schedule(int cId, String days, String timing) {
        this.cId = cId;
        this.days = days;
        this.timing = timing;
    }
    //gettors and settors
    public int getsId() {    return sId;}
    public void setsId(int sId) {    this.sId = sId;}
    public int getcId() {    return cId;}
    public void setcId(int cId) {    this.cId = cId;}
    public String getDays() {    return days;}
    public void setDays(String days) {    this.days = days;}
    public String getTiming() {    return timing;}
    public void setTiming(String timing) {    this.timing = timing;}
    public String getCourseName() {    return courseName;}
    public void setCourseName(String courseName) {    this.courseName = courseName;}
    public String getCourseCategory() {    return courseCategory;}
    public void setCourseCategory(String courseCategory) {    this.courseCategory = courseCategory;}
    
}
