package com.baizhi.entity;

public class User {
    private String username;
    private String password;
    private String phone;
    private String email;
    private String emailIp;
    private String systemSource;
    private String userStatus;
    public User() {
    }

    public User(String username, String password, String phone, String email, String emailIp, String systemSource, String userStatus) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.emailIp = emailIp;
        this.systemSource = systemSource;
        this.userStatus = userStatus;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailIp() {
        return emailIp;
    }

    public void setEmailIp(String emailIp) {
        this.emailIp = emailIp;
    }

    public String getSystemSource() {
        return systemSource;
    }

    public void setSystemSource(String systemSource) {
        this.systemSource = systemSource;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", emailIp='" + emailIp + '\'' +
                ", systemSource='" + systemSource + '\'' +
                ", userStatus='" + userStatus + '\'' +
                '}';
    }
}
