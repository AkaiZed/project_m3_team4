<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(45deg, #FF0000, #FF7F00, #FFFF00, #00FF00, #0000FF, #4B0082, #9400D3);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
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

        .login-container {
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        .login-container h3 {
            margin-bottom: 20px;
            color: #007bff;
            font-size: 22px;
            font-weight: 600;
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

        .error-message {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            font-size: 14px;
            justify-content: space-between;
        }

        .remember-me input {
            margin-right: 8px;
        }

        .forgot-password {
            display: block;
            font-size: 14px;
            color: #007bff;
            text-decoration: none;
            margin-top: 10px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .register-link {
            font-size: 14px;
            margin-top: 20px;
        }

        .register-link a {
            color: #007bff;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h3>Đăng nhập</h3>
    <form action="LoginServlet" method="get" class="login-form">
        <div class="form-group">
            <label class="form-label" for="tenDangNhap">Tài khoản:</label>
            <input type="text" id="tenDangNhap" name="tenDangNhap" class="form-control" required
                   placeholder="Nhập tài khoản">
        </div>
        <div class="form-group">
            <label class="form-label" for="matKhau">Mật khẩu:</label>
            <input type="password" id="matKhau" name="matKhau" class="form-control" required
                   placeholder="Nhập mật khẩu">
        </div>
        <div class="remember-me">
            <label>
                <input type="checkbox" name="rememberMe"> Remember me
            </label>
            <a href="register.jsp" class="forgot-password">Quên mật khẩu?</a>
        </div>
        <button type="submit" class="btn-submit">Login</button>
        <p class="register-link">Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
    </form>
</div>
</body>
</html>
