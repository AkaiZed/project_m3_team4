<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.project_m3_team4.data.ConnectDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.project_m3_team4.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <c:import url="library.jsp"/>
    <style>
        /* Navbar styles */
        .navbar {
            background-color: #007bff;
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            margin-right: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .navbar button {
            background-color: #dc3545;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .navbar button:hover {
            background-color: #c82333;
        }

        .navbar .search-bar {
            display: flex;
            align-items: center;
        }

        .navbar input {
            padding: 8px;
            border-radius: 5px;
            border: none;
        }

        .navbar .navbar-left {
            display: flex;
            align-items: center;
        }

        .navbar .navbar-right {
            display: flex;
            align-items: center;
        }

        .navbar .username {
            font-weight: bold;
            text-decoration: underline;
        }

        .navbar .admin-links {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>

<%
    // Checking the user information from cookies
    Cookie[] cookies = request.getCookies();
    String tenDangNhapFromCookie = null;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("tenDangNhap".equals(cookie.getName())) {
                tenDangNhapFromCookie = cookie.getValue();
                break;
            }
        }
    }

    if (tenDangNhapFromCookie != null) {
        // Get user info from database if the cookie is set
        Connection conn = ConnectDB.getConnection();
        String sql = "SELECT * FROM nguoi_dung WHERE ten_dang_nhap = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, tenDangNhapFromCookie);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("user", new User(
                    rs.getInt("id_nguoi_dung"),
                    rs.getString("ten_dang_nhap"),
                    rs.getString("mat_khau"),
                    rs.getString("email"),
                    rs.getString("so_dien_thoai"),
                    rs.getDate("ngay_sinh"),
                    rs.getString("dia_chi"),
                    rs.getString("vai_tro")
            ));
        }
    }
%>

<!-- Navbar -->
<div class="navbar">
    <div class="navbar-left">
        <a href="home.jsp" class="navbar-brand">Phone Store</a>
        <a href="home.jsp">Trang chủ</a>

        <c:if test="${sessionScope.user != null && sessionScope.user.vaiTro == 'admin'}">
            <div class="admin-links">
                <a href="OrderAcceptServlet">Duyệt đơn hàng</a>
                <a href="ManageProductsServlet">Quản lý sản phẩm</a>
                <a href="ManageUsersServlet">Quản lý người dùng</a>
            </div>
        </c:if>
    </div>

    <div class="search-bar">
        <form action="search.jsp" method="get">
            <input type="text" name="query" placeholder="Tìm sản phẩm..." />
            <button type="submit">Tìm</button>
        </form>
    </div>

    <div class="navbar-right">
        <c:if test="${sessionScope.user != null}">
            <a href="infor.jsp" class="username">Xin chào, ${sessionScope.user.tenDangNhap}</a>
        </c:if>
        <form action="login.jsp">
            <button class="navbar-logout">Đăng xuất</button>
        </form>
    </div>
</div>

<div class="container mt-4">
    <h1 class="mt-4">Chào mừng đến với Phone Store!</h1>
    <p>Chúng tôi cung cấp các sản phẩm chất lượng cao với nhiều kiểu dáng đa dạng.</p>

    <h3>Danh sách sản phẩm:</h3>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="image/product1.jpg" class="card-img-top" alt="Sản phẩm 1">
                <div class="card-body">
                    <h5 class="card-title">Sản phẩm 1</h5>
                    <p class="card-text">Mô tả sản phẩm 1.</p>
                    <a href="#" class="btn btn-primary">Mua ngay</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
