<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duyệt Đơn Hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
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
    </style>
</head>
<body>
<div class="container mt-4">
    <h1>Duyệt Đơn Hàng</h1>
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
        <!-- Lặp qua các đơn hàng trong trạng thái "chờ duyệt" -->
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
    // JavaScript để thay đổi trạng thái đơn hàng
    function changeStatus(orderId, newStatus) {
        if (confirm("Bạn có chắc chắn muốn thay đổi trạng thái đơn hàng?")) {
            window.location.href = 'OrderAcceptServlet?orderId=' + orderId + '&newStatus=' + newStatus;
        }
    }
</script>
</body>
</html>
