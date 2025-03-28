package com.example.project_m3_team4.model;

public class Product { private String ten;
    private String thuongHieu;
    private String model;
    private int gia;

    public Product(String ten, String thuongHieu, String model, int gia) {
        this.ten = ten;
        this.thuongHieu = thuongHieu;
        this.model = model;
        this.gia = gia;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getThuongHieu() {
        return thuongHieu;
    }

    public void setThuongHieu(String thuongHieu) {
        this.thuongHieu = thuongHieu;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getGia() {
        return gia;
    }

    public void setGia(int gia) {
        this.gia = gia;
    }
}
