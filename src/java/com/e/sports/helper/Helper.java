package com.e.sports.helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
public class Helper {
    //delete file
    public static boolean DeleteFile(String path){
    boolean f = false;
    try{ 
        File file = new File(path);
        f = file.delete(); // returns true when file deleted successfully.
    }catch(Exception e){e.printStackTrace();}
    return f;
    }
    // save file
    public static boolean SaveFile(InputStream is,String path){
    boolean f = false;
    try{
    byte b[]= new byte[is.available()];
    is.read(b); //reads the data and store to the byte array.
    FileOutputStream fos = new FileOutputStream(path);
    fos.write(b); // write to the path
    fos.flush();fos.close();
    f=true;
    }catch(Exception e){e.printStackTrace();}
    return f;
    }
}
