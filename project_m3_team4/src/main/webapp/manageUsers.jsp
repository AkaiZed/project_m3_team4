<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý người dùng</title>
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

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #c82333;
            color: white;
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
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand">Quản Lý Người Dùng</a>
    <div class="ml-auto">
        <a href="home.jsp" class="back-btn">Quay lại</a>
    </div>
</nav>

<div class="container mt-4">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>ID Người Dùng</th>
            <th>Tên Người Dùng</th>
            <th>Số Điện Thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.tenDangNhap}</td>
                <td>${user.soDt}</td>
                <td>${user.email}</td>
                <td>${user.diaChi}</td>
                <td>
                    <button onclick="confirmDelete('${user.tenDangNhap}')" class="btn btn-danger">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function confirmDelete(tenDangNhap) {
        if (confirm("Bạn có chắc muốn xóa tài khoản: " + tenDangNhap + "?")) {
            window.location.href = "DeleteUserServlet?tenDangNhap=" + tenDangNhap;
        }
    }
</script>
</body>
</html>
