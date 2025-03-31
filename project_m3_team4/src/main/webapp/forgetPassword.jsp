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
    <title>Quên Mật Khẩu</title>
</head>
<body>

<h2>Quên mật khẩu</h2>

<!-- Form for user to enter their username, phone, and email -->
<form id="forgotPasswordForm" action="ForgotPasswordServlet" method="post">
    <label for="tenDangNhap">Tên đăng nhập:</label>
    <input type="text" id="tenDangNhap" name="tenDangNhap" required/><br/><br/>

    <label for="soDt">Số điện thoại:</label>
    <input type="text" id="soDt" name="soDt" required/><br/><br/>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required/><br/><br/>

    <div id="newPasswordDiv" style="display: none;">
        <label for="newPassword">Mật khẩu mới:</label>
        <input type="password" id="newPassword" name="newPassword" required/><br/><br/>

        <button type="submit" onclick="changePassword()">Thay đổi mật khẩu</button>
    </div>

    <button type="submit" id="validateBtn">Xác nhận thông tin</button>
</form>

<script>
    // When the user submits the form, validate the input fields
    document.getElementById("forgotPasswordForm").onsubmit = function(event) {
        event.preventDefault();

        var tenDangNhap = document.getElementById("tenDangNhap").value;
        var soDt = document.getElementById("soDt").value;
        var email = document.getElementById("email").value;

        // Make an AJAX call to the servlet to validate the user info
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "ForgotPasswordServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Check the server response for validation
                if (xhr.responseText === "valid") {
                    // Show the new password input field
                    document.getElementById("newPasswordDiv").style.display = "block";
                } else {
                    alert("Thông tin không chính xác. Vui lòng kiểm tra lại.");
                }
            }
        };
        xhr.send("tenDangNhap=" + tenDangNhap + "&soDt=" + soDt + "&email=" + email);
    };

    // Function to handle the password change
    function changePassword() {
        var newPassword = document.getElementById("newPassword").value;
        if (newPassword) {
            // Make an AJAX call to change the password
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "ForgotPasswordServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    if (xhr.responseText === "success") {
                        alert("Đã thay đổi mật khẩu thành công.");
                    } else {
                        alert("Có lỗi xảy ra. Vui lòng thử lại.");
                    }
                }
            };
            xhr.send("newPassword=" + newPassword);
        }
    }
</script>

</body>
</html>
