package com.example.project_m3_team4.controller;

import com.example.project_m3_team4.data.ConnectDB;
import com.example.project_m3_team4.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tenDangNhap = request.getParameter("tenDangNhap");  // Nhận tài khoản từ form
        String matKhau = request.getParameter("matKhau");  // Nhận mật khẩu từ form

        System.out.println("Tài khoản: " + tenDangNhap);  // Debugging the input data
        System.out.println("Mật khẩu: " + matKhau);

        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM nguoi_dung WHERE ten_dang_nhap = ? AND mat_khau = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, tenDangNhap);  // Sửa lại tên biến cho đúng
                stmt.setString(2, matKhau);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
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

                        // Create a session to store the user's information
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);

                        // Debugging user role
                        System.out.println("User Role: " + user.getVaiTro());
                        // Creating a cookie to store user information (e.g., tenDangNhap)
                        Cookie userCookie = new Cookie("tenDangNhap", tenDangNhap);  // Create the cookie
                        userCookie.setMaxAge(60 * 60 * 24);  // Set expiry time for cookie (1 day)
                        response.addCookie(userCookie);  // Add the cookie to the response

                        // Redirect to home page after successful login
                        response.sendRedirect("home.jsp");  // Redirect after successful login
                    } else {
                        // If credentials are incorrect, display error message
                        request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                }
            } catch (SQLException e) {
                System.out.println("Error executing SQL query: " + e.getMessage()); // Debugging SQL error
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi kết nối CSDL: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
