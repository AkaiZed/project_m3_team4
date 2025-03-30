package com.example.project_m3_team4.controller;

import com.example.project_m3_team4.data.ConnectDB;
import com.example.project_m3_team4.model.Product;

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

@WebServlet(name = "ManageProductsServlet", value = "/ManageProductsServlet")
public class ManageProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = new ArrayList<>();

        try (Connection conn = ConnectDB.getConnection()) {
            String sql = "SELECT * FROM dien_thoai";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt("id_dien_thoai"),
                            rs.getString("ten"),
                            rs.getInt("ram"),
                            rs.getInt("bo_nho_trong"),
                            rs.getInt("gia")
                    );
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("manageProducts.jsp").forward(request, response);
    }
}
