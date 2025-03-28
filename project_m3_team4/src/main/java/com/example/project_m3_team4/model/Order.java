package com.example.project_m3_team4.model;

public class Order {
    private int idDonHang;
    private String tenKhachHang;
    private String tenSanPham;
    private double tongTien;

    public Order(int idDonHang, String tenKhachHang, String tenSanPham, double tongTien) {
        this.idDonHang = idDonHang;
        this.tenKhachHang = tenKhachHang;
        this.tenSanPham = tenSanPham;
        this.tongTien = tongTien;
    }

    public int getIdDonHang() {
        return idDonHang;
    }

    public void setIdDonHang(int idDonHang) {
        this.idDonHang = idDonHang;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }
}
