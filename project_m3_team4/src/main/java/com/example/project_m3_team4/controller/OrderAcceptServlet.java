package com.example.project_m3_team4.controller;

import com.example.project_m3_team4.data.ConnectDB;
import com.example.project_m3_team4.model.Order;
import com.example.project_m3_team4.model.OrderDetail;

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

        try (Connection conn = ConnectDB.getConnection()) {
            if (conn == null) {
                request.setAttribute("error", "Không thể kết nối đến cơ sở dữ liệu!");
                request.getRequestDispatcher("orderAccept.jsp").forward(request, response);
                return;
            }

            String sql = "SELECT dh.id_don_hang, nd.ten_dang_nhap, dh.tong_tien, dh.trang_thai_don_hang " +
                    "FROM don_hang dh " +
                    "JOIN nguoi_dung nd ON dh.id_nguoi_dung = nd.id_nguoi_dung";

            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    int orderId = rs.getInt("id_don_hang");
                    String customerName = rs.getString("ten_dang_nhap");
                    double totalAmount = rs.getDouble("tong_tien");
                    String orderStatus = rs.getString("trang_thai_don_hang");

                    List<OrderDetail> orderDetails = new ArrayList<>();
                    String detailsSql = "SELECT sp.ten, ctdh.gia " +
                            "FROM chi_tiet_don_hang ctdh " +
                            "JOIN dien_thoai sp ON ctdh.id_dien_thoai = sp.id_dien_thoai " +
                            "WHERE ctdh.id_don_hang = ?";

                    try (PreparedStatement detailsStmt = conn.prepareStatement(detailsSql)) {
                        detailsStmt.setInt(1, orderId);
                        try (ResultSet detailsRs = detailsStmt.executeQuery()) {
                            while (detailsRs.next()) {
                                String productName = detailsRs.getString("ten");
                                double productPrice = detailsRs.getDouble("gia");
                                orderDetails.add(new OrderDetail(productName, productPrice));
                            }
                        }
                    } catch (SQLException e) {
                    }

                    Order order = new Order(orderId, customerName, totalAmount, orderStatus, orderDetails);
                    orders.add(order);
                }
            } catch (SQLException e) {
                request.setAttribute("error", "Lỗi khi thực thi truy vấn chính: " + e.getMessage());
                throw e;
            }

            request.setAttribute("orders", orders);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi SQL: " + e.getMessage());
        }

        request.getRequestDispatcher("orderAccept.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String orderIdStr = request.getParameter("orderId");
        String newStatus = request.getParameter("newStatus");

        if (orderIdStr != null && newStatus != null) {
            try (Connection conn = ConnectDB.getConnection()) {
                String updateSql = "UPDATE don_hang SET trang_thai_don_hang = ? WHERE id_don_hang = ?";
                try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                    stmt.setString(1, newStatus);
                    stmt.setInt(2, Integer.parseInt(orderIdStr));
                    int rowsUpdated = stmt.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi khi cập nhật trạng thái: " + e.getMessage());
            }
        }

        doGet(request, response);
    }
}
