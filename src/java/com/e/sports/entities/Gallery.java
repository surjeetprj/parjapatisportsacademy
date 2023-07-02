package com.e.sports.entities;
public class Gallery {
   private int id;
   private String imageName;
   private String evantName;
   // constructors
   public Gallery(){} //DEFAULT CONSTRUCTOR
    public Gallery(int id, String imageName, String evantName) {
        this.id = id;
        this.imageName = imageName;
        this.evantName = evantName;
    }
    public Gallery(String imageName, String evantName) {
        this.imageName = imageName;
        this.evantName = evantName;
    }
       // METHOD TO SAVE UPDATE GALLERY INFO
    public void UpdateGallery(String evant, String newImageName){
        this.evantName = evant;
        this.imageName = newImageName;
    }
    // GATTERS AND SETTERS
    public int getId() {  return id;}
    public void setId(int id) {    this.id = id;}
    public String getImageName() {    return imageName;}
    public void setImageName(String imageName) {    this.imageName = imageName;}
    public String getEvantName() {    return evantName;}
    public void setEvantName(String evantName) {    this.evantName = evantName;}
}
