<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Duyệt Đơn Hàng</title>
    <style> .navbar {
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

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .error {
        color: red;
    }

    .debug {
        color: blue;
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
<%--<!-- Debug: Kiểm tra dữ liệu orders -->--%>
<%--<p class="debug">Debug: orders có null không? ${orders == null ? 'Có, orders là null' : 'Không, orders không null'}</p>--%>
<%--<p class="debug">Debug: Số lượng đơn hàng: ${orders != null ? orders.size() : 'orders là null'}</p>--%>
<%--<p class="debug">Debug: Danh sách đơn hàng: ${orders}</p>--%>

<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<c:if test="${empty orders}">
    <p class="error">Không có đơn hàng nào để hiển thị.</p>
    <p class="error">Lỗi: Vui lòng truy cập qua OrderAcceptServlet (/OrderAcceptServlet) để lấy dữ liệu.</p>
</c:if>

<c:if test="${not empty orders}">
    <table>
        <thead>
        <tr>
            <th>ID Đơn Hàng</th>
            <th>Tên Khách Hàng</th>
            <th>Tổng Tiền</th>
            <th>Trạng Thái</th>
            <th>Chi Tiết</th>
            <th>Cập Nhật Trạng Thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.customerName}</td>
                <td>${order.totalAmount}</td>
                <td>${order.orderStatus}</td>
                <td>
                    <ul>
                        <c:forEach var="detail" items="${order.orderDetails}">
                            <li>${detail.productName}: ${detail.productPrice}</li>
                        </c:forEach>
                    </ul>
                </td>
                <td>
                    <form action="OrderAcceptServlet" method="post">
                        <input type="hidden" name="orderId" value="${order.orderId}">
                        <select name="newStatus">
                            <option value="cho_duyet" <c:if test="${order.orderStatus == 'cho_duyet'}">selected</c:if>>
                                Chờ duyệt
                            </option>
                            <option value="da_duyet" <c:if test="${order.orderStatus == 'da_duyet'}">selected</c:if>>Đã
                                duyệt
                            </option>
                            <option value="hoan_tat" <c:if test="${order.orderStatus == 'hoan_tat'}">selected</c:if>>
                                Hoàn tất
                            </option>
                            <option value="da_huy" <c:if test="${order.orderStatus == 'da_huy'}">selected</c:if>>Đã
                                hủy
                            </option>
                        </select>
                        <button type="submit">Cập nhật</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>