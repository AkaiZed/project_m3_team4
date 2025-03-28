package com.example.project_m3_team4.controller;

import com.example.project_m3_team4.data.ConnectDB;
import com.example.project_m3_team4.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderAcceptServlet", value = "/OrderAcceptServlet")
public class OrderAcceptServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = new ArrayList<>();

        // Truy vấn đơn hàng có trạng thái 'chờ duyệt'
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT dh.id_don_hang, nd.ten_dang_nhap, dh.tong_tien, sp.ten " +
                    "FROM don_hang dh " +
                    "JOIN nguoi_dung nd ON dh.id_nguoi_dung = nd.id_nguoi_dung " +
                    "JOIN chi_tiet_don_hang ctdh ON dh.id_don_hang = ctdh.id_don_hang " +
                    "JOIN dien_thoai sp ON ctdh.id_dien_thoai = sp.id_dien_thoai " +
                    "WHERE dh.trang_thai_don_hang = 'cho_duyet'";

            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("id_don_hang"),
                            rs.getString("ten_dang_nhap"),
                            rs.getString("ten"),
                            rs.getDouble("tong_tien")
                    );
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Gửi dữ liệu đơn hàng vào JSP
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orderAccept.jsp").forward(request, response);
    }
}
