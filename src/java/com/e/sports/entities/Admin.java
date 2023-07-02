package com.e.sports.entities;
public class Admin {
    private String email;
    private String password;
    private String name;
    private long contact;
    // constructors..
    public Admin(String email, String password, String name, long contact) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.contact = contact;
    }
    public Admin(String email, String password) {
        this.email = email;
        this.password = password;
    }
    public Admin(){} //default constructor
    //getters and setters...
    public String getEmail() {return email;}
    public void setEmail(String email) {this.email = email;}
    public String getPassword() {return password;}
    public void setPassword(String password) {this.password = password;}
    public String getName() {return name;}
    public void setName(String name) {this.name = name;}
    public long getContact() {return contact;}
    public void setContact(long contact) {this.contact = contact;}  
}
