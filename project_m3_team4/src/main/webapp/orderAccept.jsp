<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duyệt Đơn Hàng</title>
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

        .btn-v, .btn-x {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: inline-block;
            text-align: center;
            color: white;
            cursor: pointer;
        }

        .btn-v {
            background-color: #28a745;
        }

        .btn-x {
            background-color: #dc3545;
        }

        .status-column {
            text-align: center;
        }

        .edit-column {
            text-align: center;
        }

        .edit-column a {
            text-decoration: none;
            color: #007bff;
        }

        .back-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #dc3545; /* Màu nền đỏ */
            color: white; /* Màu chữ trắng */
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #c82333; /* Màu nền đậm hơn */
            color: white; /* Giữ màu chữ trắng khi hover */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand">Duyệt Đơn Hàng</a>
    <div class="ml-auto">
        <a href="home.jsp" class="back-btn">Quay lại</a>
    </div>
</nav>

<div class="container mt-4">
    <%--    <h1>Duyệt Đơn Hàng</h1>--%>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID Đơn Hàng</th>
            <th>Tên Khách Hàng</th>
            <th>Sản Phẩm</th>
            <th>Tổng Tiền</th>
            <th>Trạng Thái</th>
            <th>Thao Tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.idDonHang}</td>
                <td>${order.tenKhachHang}</td>
                <td>${order.tenSanPham}</td>
                <td>${order.tongTien}</td>
                <td class="status-column">
                    <button class="btn-v" onclick="changeStatus(${order.idDonHang}, 'da_duyet')">V</button>
                    <button class="btn-x" onclick="changeStatus(${order.idDonHang}, 'da_huy')">X</button>
                </td>
                <td class="edit-column">
                    <a href="#">Sửa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function changeStatus(orderId, newStatus) {
        if (confirm("Bạn có chắc chắn muốn thay đổi trạng thái đơn hàng?")) {
            window.location.href = 'OrderAcceptServlet?orderId=' + orderId + '&newStatus=' + newStatus;
        }
    }
</script>
</body>
</html>
