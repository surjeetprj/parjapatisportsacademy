package com.e.sports.entities;
public class Courses {
   private int id;
   private String name;
   private String details;
   private int duration;
   private int price;
   private String image;
   private String category;
// Constructors..
    public Courses(int id, String name, String details,int duration, int price, String image, String category) {
        this.id = id;
        this.name = name;
        this.details = details;
        this.duration = duration;
        this.price = price;
        this.image = image;
        this.category = category;
    }
    public Courses(String name, String details, int duration,int price, String image, String category) {
        this.name = name;
        this.details = details;
        this.duration= duration;
        this.price = price;
        this.image = image;
        this.category = category;
    }
// function to save information of updated Course
    public void UpdateCourses(String name, String details, int duration,int price, String image) {
        this.name = name;
        this.details = details;
        this.duration = duration;
        this.price = price;
        this.image = image;
    }
    public Courses(){} //default constructor;
    //getters and setters
    public int getId() {return id;}
    public void setId(int id) {this.id = id; }
    public String getName() {   return name;}
    public void setName(String name) {   this.name = name;}
    public String getDetails() {    return details;}
    public void setDetails(String details) {   this.details = details; }
    public int getDuration() {    return duration;}
    public void setDuration(int duration) {    this.duration = duration;}
    public int getPrice() {    return price;}
    public void setPrice(int price) {    this.price = price;}
    public String getImage() {return image;}
    public void setImage(String image) {    this.image = image;}
    public String getCategory() {  return category; }
    public void setCategory(String category) {    this.category = category;}  
}
