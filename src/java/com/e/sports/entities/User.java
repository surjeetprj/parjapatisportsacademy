package com.e.sports.entities;
public class User {
    private int id; private String name;
    private String lastName; private long contact;
    private String email; private String password;
    private String gender; private String dob;
    private int age; private int houseNo;
    private String area; private String city;
    private String state; private int pincode; private String image;
// Constructors...
    public User(int id, String name, String lastName, long contact, String email, String password, String gender, String dob, int age, int houseNo, String area, String city, String state, int pincode, String image) {
        this.id = id; this.name = name;
        this.lastName = lastName; this.contact = contact;
        this.email = email; this.password = password;
        this.gender = gender; this.dob = dob;
        this.age = age; this.houseNo = houseNo;
        this.area = area; this.city = city;
        this.state = state; this.pincode = pincode;
        this.image = image;
    }
    public User(String name, String lastName, long contact, String email, String password, String gender, String dob, int age, int houseNo, String area, String city, String state, int pincode) {
        this.name = name; this.lastName = lastName;
        this.contact = contact; this.email = email;
        this.password = password;    this.gender = gender;
        this.dob = dob;   this.age = age;
        this.houseNo = houseNo;    this.area = area;
        this.city = city;    this.state = state;
        this.pincode = pincode;
    }
    // Function to save information of Edit Profile 
    public void EditProfile(String name, String lastName, long contact, String email, String password, String dob,int age, int houseNo, String area, String city, String state, int pincode, String image) {
        this.name = name;    this.lastName = lastName;
        this.contact = contact;    this.email = email;
        this.password = password;   this.dob = dob;
        this.age = age;   this.houseNo = houseNo;
        this.area = area;   this.city = city;
        this.state = state;    this.pincode = pincode;
        this.image = image;
    }
    public User(){// default constructor
    }
    public int getId() {    return id;}
    public void setId(int id) {    this.id = id; }
    public String getName() {    return name;}
    public void setName(String name) {    this.name = name;}
    public String getLastName() {    return lastName;}
    public void setLastName(String lastName) {    this.lastName = lastName;}
    public long getContact() {    return contact;}
    public void setContact(long contact) {    this.contact = contact;}
    public String getEmail() {    return email;}
    public void setEmail(String email) {    this.email = email;}
    public String getPassword() {    return password;}
    public void setPassword(String password) {    this.password = password;}
    public String getGender() {    return gender;}
    public void setGender(String gender) {    this.gender = gender;}
    public String getDob() {    return dob; }
    public void setDob(String dob) {    this.dob = dob;}
    public int getAge() {    return age;}
    public void setAge(int age) {    this.age = age;}
    public int getHouseNo() {    return houseNo;}
    public void setHouseNo(int houseNo) {    this.houseNo = houseNo;}
    public String getArea() {    return area;}
    public void setArea(String area) {    this.area = area;}
    public String getCity() {    return city;}
    public void setCity(String city) {    this.city = city;}
    public String getState() {    return state;}
    public void setState(String state) {    this.state = state;}
    public int getPincode() {    return pincode;}
    public void setPincode(int pincode) {    this.pincode = pincode;}
    public String getImage() {    return image;}
    public void setImage(String image) {    this.image = image;}
}

