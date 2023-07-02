package com.e.sports.dao;
import com.e.sports.entities.Gallery;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class GalleryDao {
    final Connection con;
    // Default constructor to stablish connection from database.
    public GalleryDao(Connection con){
    this.con = con;
    }
    // INSERT IN DATABASE
    public boolean SaveGallery(Gallery gallery){
    boolean f= false;
    String query= "insert into gallery_mst (image_info,image_evant) values(?,?)";
        try {
            PreparedStatement p =this.con.prepareStatement(query);
            p.setString(1,gallery.getImageName() );
            p.setString(2,gallery.getEvantName() );
            p.executeUpdate();
            f=true;
        } catch (SQLException ex) {
            Logger.getLogger(GalleryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
    // GET GALLERY INFO FROM DATA BASE
    public List GetGallery(int start,int recordCount){
    List<Gallery> galleryList = new ArrayList<>();
    String query="select * from gallery_mst LIMIT "+start+","+recordCount;
        try {
            PreparedStatement p =this.con.prepareStatement(query);
            ResultSet rs = p.executeQuery();
            while(rs.next()){
                // INITIALIZING GALLERY OBJ.
                Gallery gallery = new Gallery();
                // get data form DB and save to gallery obj
                gallery.setId(rs.getInt(1));
                gallery.setImageName(rs.getString(2));
                gallery.setEvantName(rs.getString(3));
                // ADD GALLERY OBJ TO LIST
                galleryList.add(gallery);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GalleryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return galleryList;
    }
    // GET TOTAL NUMBER OF RECORDS
     public int TotalRecords(){
     int total=0;
     String query="SELECT COUNT(*) FROM gallery_mst";
     PreparedStatement p;
        try {
            p = this.con.prepareStatement(query);
             ResultSet rs = p.executeQuery();
             if(rs.next()){
                 total = rs.getInt(1);
             }
        } catch (SQLException ex) {
            Logger.getLogger(GalleryDao.class.getName()).log(Level.SEVERE, null, ex);
        }    
     return total;
     }
     // Get gallery by Id
     public Gallery getGallleryById(int id){
         // INITIALIZE GALLLERY OBJ.
     Gallery gallery = new Gallery();
     String query="SELECT * FROM gallery_mst WHERE img_id="+id;
     PreparedStatement p;
     try{
         p= this.con.prepareStatement(query);
         ResultSet rs = p.executeQuery();
         if(rs.next()){
          // get data form DB and save to gallery obj
                gallery.setId(rs.getInt(1));
                gallery.setImageName(rs.getString(2));
                gallery.setEvantName(rs.getString(3));
         }
     }catch(Exception e){
         e.printStackTrace();
     }
     return gallery;
     }
     // UPDATE GALLERY
     public boolean UpdateGallery(Gallery gallery){
         boolean f = false;
         String query = "update gallery_mst set image_info=?, image_evant=? where img_id="+gallery.getId();
        try {
            PreparedStatement p =this.con.prepareStatement(query);
             p.setString(1, gallery.getImageName());
             p.setString(2, gallery.getEvantName());
            p.executeUpdate();
            f=true;
        } catch (SQLException ex) {
            Logger.getLogger(GalleryDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
         return f;
     }
     // Delete Gallery cell by Id
     public boolean DeleteGallery(int id){
     boolean f=false;
     String query = "delete from gallery_mst where img_id="+id;
        try {
            PreparedStatement p =this.con.prepareStatement(query);
            p.executeUpdate();
            f=true;
        } catch (SQLException ex) {
            Logger.getLogger(GalleryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
     return f;
     }
}
