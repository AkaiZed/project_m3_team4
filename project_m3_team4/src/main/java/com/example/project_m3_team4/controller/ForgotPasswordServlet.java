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
import java.sql.SQLException;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenDangNhap = request.getParameter("tenDangNhap");
        String soDt = request.getParameter("soDt");
        String email = request.getParameter("email");

        // Check if the entered data matches any user in the database
        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM nguoi_dung WHERE ten_dang_nhap = ? AND so_dien_thoai = ? AND email = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, tenDangNhap);
            stmt.setString(2, soDt);
            stmt.setString(3, email);

            ResultSet rs = stmt.executeQuery();

            // If the user exists with the given information
            if (rs.next()) {
                if (request.getParameter("newPassword") != null) {
                    // If new password is provided, update it in the database
                    String newPassword = request.getParameter("newPassword");
                    String updateSql = "UPDATE nguoi_dung SET mat_khau = ? WHERE ten_dang_nhap = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                    updateStmt.setString(1, newPassword);
                    updateStmt.setString(2, tenDangNhap);
                    updateStmt.executeUpdate();
                    response.getWriter().write("success");
                } else {
                    // If only validating user information
                    response.getWriter().write("valid");
                }
            } else {
                // If no matching user found
                response.getWriter().write("invalid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("error");
        }
    }
}
