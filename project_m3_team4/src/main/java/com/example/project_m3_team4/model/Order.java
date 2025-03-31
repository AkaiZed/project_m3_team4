package com.example.project_m3_team4.model;

import java.util.List;

public class Order {
    private int orderId; // id_don_hang
    private String customerName; // ten_dang_nhap
    private double totalAmount; // tong_tien
    private String orderStatus; // trang_thai_don_hang
    private List<OrderDetail> orderDetails; // Danh sách các chi tiết dịch vụ (dich_vu)

    // Constructor
    public Order(int orderId, String customerName, double totalAmount, String orderStatus, List<OrderDetail> orderDetails) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
        this.orderDetails = orderDetails;
    }

    // Getter and Setter
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", customerName='" + customerName + '\'' +
                ", totalAmount=" + totalAmount +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderDetails=" + orderDetails +
                '}';
    }
}
