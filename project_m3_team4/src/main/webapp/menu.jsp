<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<html>
<head>
    <title>Menu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .navbar {
            background-color: #343a40;
            padding: 10px 20px;
        }
        .navbar .navbar-nav .nav-item {
            margin-right: 15px;
        }
        .navbar .navbar-nav .nav-link {
            color: #f8f9fa;
        }
        .navbar .navbar-nav .nav-link:hover {
            color: #007bff;
        }
        .navbar .navbar-nav .nav-link.active {
            color: #ffffff;
            background-color: #007bff;
        }
        .navbar .navbar-nav .btn {
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
        }
        .navbar .navbar-nav .btn:hover {
            background-color: #218838;
        }
        .search-box {
            margin-left: 15px;
        }
        .search-input {
            border-radius: 25px;
            padding: 5px 15px;
            width: 200px;
        }
    </style>
</head>
<body>
<!-- Check if the user is an admin before showing the menu -->
<c:if test="${sessionScope.userRole == 'admin'}">
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Giày Store</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="orderList.jsp">Danh sách đơn hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="approveOrders.jsp">Duyệt đơn</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Đăng xuất</a>
                </li>
            </ul>
            <div class="search-box">
                <input type="text" class="form-control search-input" placeholder="Tìm kiếm sản phẩm...">
            </div>
        </div>
    </nav>
</c:if>
</body>
</html>
