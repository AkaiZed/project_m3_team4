package com.example.project_m3_team4.model;

import java.util.Date;

public class User {
    private int id;
    private String tenDangNhap;
    private String matKhau;
    private String email;
    private String soDt;
    private Date dob;
    private String diaChi;
    private String vaiTro;

    // Constructor
    public User(String tenDangNhap, String matKhau, String email, String soDt, Date dob, String diaChi, String vaiTro) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.email = email;
        this.soDt = soDt;
        this.dob = dob;
        this.diaChi = diaChi;
        this.vaiTro = vaiTro;
    }

    public User(int id, String tenDangNhap, String matKhau, String email, String soDt, Date dob, String diaChi, String vaiTro) {
        this.id = id;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.email = email;
        this.soDt = soDt;
        this.dob = dob;
        this.diaChi = diaChi;
        this.vaiTro = vaiTro;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSoDt() {
        return soDt;
    }

    public void setSoDt(String soDt) {
        this.soDt = soDt;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }
}
