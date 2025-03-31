package com.example.project_m3_team4.controller;

import com.example.project_m3_team4.data.ConnectDB;
import com.example.project_m3_team4.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ManageUsersServlet", value = "/ManageUsersServlet")
public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = getUsers(); // Gọi phương thức để lấy danh sách người dùng
        request.setAttribute("users", users); // Đưa danh sách vào request attribute
        request.getRequestDispatcher("manageUsers.jsp").forward(request, response); // Chuyển hướng tới JSP
    }

    private List<User> getUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM nguoi_dung"; // Truy vấn tất cả người dùng

        try (Connection conn = ConnectDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("id_nguoi_dung"),
                        rs.getString("ten_dang_nhap"),
                        rs.getString("mat_khau"),
                        rs.getString("email"),
                        rs.getString("so_dien_thoai"),
                        rs.getDate("ngay_sinh"),
                        rs.getString("dia_chi"),
                        rs.getString("vai_tro")
                );
                users.add(user); // Thêm người dùng vào danh sách
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi nếu có
        }
        return users;
    }
}
