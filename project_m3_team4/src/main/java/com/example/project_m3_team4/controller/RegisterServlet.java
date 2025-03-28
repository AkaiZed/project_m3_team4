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
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("password");
        String email = request.getParameter("email");
        String soDt = request.getParameter("soDt");
        String dobStr = request.getParameter("dob");
        String diaChi = request.getParameter("diaChi");
        String confirmPassword = request.getParameter("confirmPassword");

        if (tenDangNhap.isEmpty() || matKhau.isEmpty() || email.isEmpty() || soDt.isEmpty() || dobStr.isEmpty() || diaChi.isEmpty()) {
            request.setAttribute("errorMessage", "Không được để trống.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (!matKhau.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Mật khẩu và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        Date dob = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dob = dateFormat.parse(dobStr);
        } catch (ParseException e) {
            request.setAttribute("errorMessage", "Ngày sinh không hợp lệ.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        User newUser = new User(tenDangNhap, matKhau, email, soDt, dob, diaChi, "nguoi_dung");

        boolean isUserAdded = addUserToDatabase(newUser);

        if (isUserAdded) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    private boolean addUserToDatabase(User user) {
        String sql = "INSERT INTO nguoi_dung (ten_dang_nhap, mat_khau, email, so_dien_thoai, ngay_sinh, dia_chi, vai_tro) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectDB.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getTenDangNhap());
            stmt.setString(2, user.getMatKhau());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getSoDt());
            stmt.setDate(5, new java.sql.Date(user.getDob().getTime()));
            stmt.setString(6, user.getDiaChi());
            stmt.setString(7, user.getVaiTro());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
