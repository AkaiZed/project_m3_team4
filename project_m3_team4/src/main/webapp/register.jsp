<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(45deg, #FF0000, #FF7F00, #FFFF00, #00FF00, #0000FF, #4B0082, #9400D3);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        @keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        .register-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
            overflow: hidden;
        }

        .register-container h3 {
            color: #007bff;
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
            color: #333;
        }

        .form-control {
            width: calc(100% - 24px);
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 6px;
            font-size: 14px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .remember-me {
            display: flex;
            align-items: center;
            font-size: 14px;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .remember-me input {
            margin-right: 8px;
        }

        .terms-and-conditions {
            font-size: 14px;
            margin-top: 10px;
            color: #007bff;
        }

        .terms-and-conditions a {
            color: #007bff;
            text-decoration: none;
        }

        .terms-and-conditions a:hover {
            text-decoration: underline;
        }

        .login-link {
            font-size: 14px;
            margin-top: 20px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h3>Đăng ký</h3>
    <form action="RegisterServlet" method="post" class="register-form">
        <div class="form-group">
            <label class="form-label" for="taiKhoan">Tài khoản:</label>
            <input type="text" id="taiKhoan" name="taiKhoan" class="form-control" required placeholder="Nhập tài khoản của bạn">
        </div>
        <div class="form-group">
            <label class="form-label" for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required placeholder="Nhập email của bạn">
        </div>
        <div class="form-group">
            <label class="form-label" for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" class="form-control" required placeholder="Nhập mật khẩu">
        </div>
        <div class="form-group">
            <label class="form-label" for="confirmPassword">Xác nhận mật khẩu:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required placeholder="Nhập lại mật khẩu">
        </div>
        <div class="form-group">
            <label class="form-label" for="soDt">Số điện thoại:</label>
            <input type="text" id="soDt" name="soDt" class="form-control" required placeholder="Nhập số điện thoại của bạn">
        </div>
        <div class="form-group">
            <label class="form-label" for="dob">Ngày sinh:</label>
            <input type="date" id="dob" name="dob" class="form-control" required placeholder="dd/mm/yyyy">
        </div>
        <div class="form-group">
            <label class="form-label" for="diaChi">Địa chỉ:</label>
            <input type="text" id="diaChi" name="diaChi" class="form-control" required placeholder="Nhập địa chỉ của bạn">
        </div>
        <div class="form-group remember-me">
            <label>
                <input type="checkbox" name="terms" required> Tôi đồng ý với <a href="#" class="terms-and-conditions">Điều khoản và điều kiện</a>
            </label>
        </div>
        <button type="submit" class="btn-submit">Đăng ký</button>
        <p class="login-link">Đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
    </form>
</div>
</body>
</html>
