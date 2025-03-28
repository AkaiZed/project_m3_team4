<%@ page import="java.sql.Connection" %>
<%@ page import="com.example.project_m3_team4.data.ConnectDB" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.project_m3_team4.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        .header {
            background-color: #f8f9fa;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header a {
            margin-right: 20px;
            text-decoration: none;
            color: #007bff;
        }

        .header a:hover {
            text-decoration: underline;
        }

        .logout-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .logout-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<%-- Kiểm tra nếu có cookie "tenDangNhap", nếu có thì lấy thông tin người dùng từ CSDL và lưu vào session --%>
<%
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
        // Lấy thông tin người dùng từ CSDL
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

<%-- Hiển thị Header và menu nếu người dùng là admin --%>
<c:if test="${sessionScope.user != null && sessionScope.user.vaiTro == 'admin'}">
    <div class="header">
        <div>
            <a href="orderAccept.jsp">Duyệt đơn hàng</a>
            <a href="manageProducts.jsp">Quản lý sản phẩm</a>
            <a href="manageUsers.jsp">Quản lý người dùng</a>
        </div>
        <form action="login.jsp" method="post">
            <button class="logout-btn">Đăng xuất</button>
        </form>
    </div>
</c:if>

<div class="container">
    <h1 class="mt-4">Chào mừng đến với Phone Store!</h1>
    <p>Chúng tôi cung cấp các sản phẩm chất lượng cao với nhiều kiểu dáng đa dạng.</p>
    <p>Xin chào, <strong>${sessionScope.user.tenDangNhap}</strong>!</p>
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
        <!-- thêm các sản phẩm khác vào đây -->
    </div>
</div>
</body>
</html>
