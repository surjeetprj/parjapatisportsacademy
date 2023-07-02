package com.e.sports.dao;import com.e.sports.entities.Courses;
import java.sql.*;import java.util.ArrayList;
import java.util.List;
public class CourseDao { 
    private Connection con;
     // Default constructor to stablish connection from database.
    public CourseDao(Connection con) {
        this.con = con;
    }
    // Function to Insert Course in database
    public boolean AddCourse(Courses course) {
        boolean f = false;
        try {
            String query = "insert into course_mst(c_name,c_details,c_duration,c_price,c_image,c_category) values(?,?,?,?,?,?)";
            PreparedStatement p = this.con.prepareStatement(query);
            p.setString(1, course.getName());
            p.setString(2, course.getDetails());
            p.setInt(3, course.getDuration());
            p.setInt(4, course.getPrice());
            p.setString(5, course.getImage());
            p.setString(6, course.getCategory());
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    //get course table by course id ..
    public Courses getCourseById(String sql) {
        Courses course = null;
        try {
            Statement smt = this.con.createStatement();
            ResultSet set = smt.executeQuery(sql);
            if (set.next()) {
                //intializing course object
                course = new Courses();
                // get data form data base and set to the course object ..
                course.setId(set.getInt(1));
                course.setName(set.getString(2));
                course.setDetails(set.getString(3));
                course.setDuration(set.getInt(4));
                course.setPrice(set.getInt(5));
                course.setImage(set.getString(6));
                course.setCategory(set.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return course;
    }
// update course..
    public boolean updateCourse(Courses course) {
        boolean f = false;
         try {
            String query = "update course_mst set c_name = ? , c_details= ?, c_duration=? , c_price = ?, c_image = ? where c_id = ? ";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, course.getName());
            p.setString(2, course.getDetails());
            p.setInt(3, course.getDuration());
            p.setInt(4, course.getPrice());
            p.setString(5, course.getImage());
            p.setInt(6, course.getId());
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    // delete course..
    public boolean DeleteCourseById(int id){
    boolean f =false;
    try{
    String query = "delete from course_mst where c_id="+id;
    PreparedStatement p = con.prepareStatement(query);
     p.execute(query);
    f=true;
    }catch(Exception e){e.printStackTrace();}
    return f;
    }
    public List<Courses> GetCourse(String category){
    List<Courses> courseList = new ArrayList<>();
       try{
           String query = "Select * from course_mst where c_category=" + "'"+category + "'" + " order by c_id";
           Statement smt = this.con.createStatement();
            ResultSet set = smt.executeQuery(query);
            while(set.next()) {
                //intializing course object
               Courses course = new Courses();
                // get data form data base and set to the course object ..
                course.setId(set.getInt(1));
                course.setName(set.getString(2));
                course.setDetails(set.getString(3));
                course.setDuration(set.getInt(4));
                course.setPrice(set.getInt(5));
                course.setImage(set.getString(6));
                course.setCategory(set.getString(7));
                // add course in array list
                courseList.add(course);
            }    
       }catch(Exception e){e.printStackTrace();}
      return courseList;  
    }
}
