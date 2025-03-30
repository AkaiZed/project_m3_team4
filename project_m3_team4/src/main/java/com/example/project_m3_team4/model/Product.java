package com.example.project_m3_team4.model;

public class Product {
    private int idDienThoai;
    private String ten;
    private int ram;
    private int boNhoTrong;
    private int gia;

    public Product(int idDienThoai, String ten, int ram, int boNhoTrong, int gia) {
        this.idDienThoai = idDienThoai;
        this.ten = ten;
        this.ram = ram;
        this.boNhoTrong = boNhoTrong;
        this.gia = gia;
    }

    public int getIdDienThoai() {
        return idDienThoai;
    }

    public void setIdDienThoai(int idDienThoai) {
        this.idDienThoai = idDienThoai;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getRam() {
        return ram;
    }

    public void setRam(int ram) {
        this.ram = ram;
    }

    public int getBoNhoTrong() {
        return boNhoTrong;
    }

    public void setBoNhoTrong(int boNhoTrong) {
        this.boNhoTrong = boNhoTrong;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }
}
