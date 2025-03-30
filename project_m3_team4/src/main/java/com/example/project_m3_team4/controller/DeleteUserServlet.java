package com.example.project_m3_team4.controller;

import com.example.project_m3_team4.data.ConnectDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteUserServlet", value = "/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tenDangNhap = request.getParameter("tenDangNhap");

        if (tenDangNhap != null && !tenDangNhap.isEmpty()) {
            deleteUser(tenDangNhap);
            response.sendRedirect("ManageUsersServlet?message=User deleted successfully.");
        } else {
            response.sendRedirect("ManageUsersServlet?message=Error: User not found.");
        }
    }

    private void deleteUser(String tenDangNhap) {
        String sql = "DELETE FROM nguoi_dung WHERE ten_dang_nhap = ?";

        try (Connection conn = ConnectDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, tenDangNhap);
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("User " + tenDangNhap + " has been deleted.");
            } else {
                System.out.println("User not found for deletion.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
