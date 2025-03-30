<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Sản Phẩm</title>
    <c:import url="library.jsp"/>

    <style>

        .navbar {
            background-color: #007bff;
            margin-bottom: 20px;
        }

        .navbar-brand {
            color: white !important;
            font-size: 24px;
        }

        .navbar-nav .nav-item .nav-link {
            color: white !important;
            font-size: 18px;
        }

        .navbar-nav .nav-item .nav-link:hover {
            text-decoration: underline;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #dc3545; /* Màu nền nút đỏ */
            color: white; /* Màu chữ trắng */
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease, color 0.3s ease; /* Thêm hiệu ứng khi di chuột */
        }

        .back-btn:hover {
            background-color: #c82333; /* Màu nền đậm hơn */
            color: white; /* Giữ màu chữ trắng khi hover */
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        table th, table td {
            text-align: center;
            padding: 15px;
        }

        .action-buttons a {
            margin: 0 10px;
            color: #007bff;
        }

        .action-buttons a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand">Quản Lý Sản Phẩm</a>
    <div class="ml-auto">
        <a href="home.jsp" class="back-btn">Quay lại</a>
    </div>
</nav>

<!-- Content -->
<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Tên Sản Phẩm</th>
            <th>Số Lượng</th>
            <th>Giá Tiền</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.ten}</td>
                <td>${product.ram} GB RAM, ${product.boNhoTrong} GB Bộ Nhớ</td>
                <td>${product.gia} VND</td>
                <td class="action-buttons">
                    <a href="#">Xóa</a>
                    <a href="#">Sửa</a>
                    <a href="#">Xem</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
