package com.e.sports.entities;
public class Feedback {
  private int id; // feedback id
  private int uId; // user id
  private String userName; // user name
  private String comment; // feedback comment  
  // constroctors....  
  public Feedback(){} // DEFAULT CONSTRUCTOR
    public Feedback(int id, int uId, String comment) {
        this.id = id;
        this.uId = uId;
        this.comment = comment;
    }
    public Feedback(int uId, String comment) {
        this.uId = uId;
        this.comment = comment;
    }    
    public Feedback(int uId,String userName, String comment) {
        this.uId = uId;
        this.comment = comment;
        this.userName = userName;
    }
    // GETTERS AND SETTERS
    public int getId() {   return id;}
    public void setId(int id) {    this.id = id;}
    public int getuId() {    return uId;}
    public void setuId(int uId) {    this.uId = uId;}
    public String getComment() {    return comment; }
    public void setComment(String comment) {   this.comment = comment;}
    public String getUserName() {    return userName;}
    public void setUserName(String userName) {    this.userName = userName;}  
}
