<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 09/10/2025
  Time: 8:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng ký thành viên</title>
    <meta charset="UTF-8">
    <style>
        body {
            background: linear-gradient(120deg, #3782f4 0%, #d9ebff 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
        }
        .register-container {
            max-width: 480px;
            margin: 60px auto;
            padding: 38px 36px 28px 36px;
            background: rgba(255,255,255,0.98);
            border-radius: 18px;
            box-shadow: 0 4px 32px rgba(33,97,181,0.13);
            border: 1.5px solid #3b82d6;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 28px;
            font-size: 30px;
            font-weight: 700;
            color: #212121;
            letter-spacing: 1px;
        }
        .form-row {
            display: flex;
            gap: 16px;
            margin-bottom: 18px;
        }
        .form-group {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .form-group label {
            font-size: 15px;
            font-weight: 500;
            margin-bottom: 6px;
            color: #212121;
            letter-spacing: 0.5px;
        }
        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="email"],
        .form-group input[type="date"] {
            padding: 9px 12px;
            border: 1.5px solid #3b82d6;
            border-radius: 7px;
            font-size: 15px;
            background: #e6f0fb;
            color: #212121;
            transition: border 0.2s, box-shadow 0.2s;
        }
        .form-group input:focus {
            border-color: #2563bd;
            outline: none;
            box-shadow: 0 0 0 2px #b4d7fb;
        }
        .register-btn {
            display: block;
            width: 160px;
            margin: 28px auto 0 auto;
            padding: 11px 0;
            background: linear-gradient(90deg, #5fa8ed 0%, #3693e6 100%);
            border: none;
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 2px 10px rgba(33,97,181,0.10);
            transition: background 0.2s, box-shadow 0.2s, color 0.2s;
            letter-spacing: 1px;
        }
        .register-btn:hover {
            background: linear-gradient(90deg, #3693e6 0%, #5fa8ed 100%);
            color: #fff;
            box-shadow: 0 4px 18px rgba(54,147,230,0.16);
        }
        @media (max-width: 600px) {
            .register-container {
                padding: 18px 6vw 12px 6vw;
            }
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Đăng ký thành viên</h2>
    <form action="/register" method="post">
        <div class="form-row">
            <div class="form-group">
                <label for="fullName">Họ tên</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="phone">Số điện thoại</label>
                <input type="text" id="phone" name="phone" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="dob">Ngày sinh</label>
                <input type="date" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="gender">Giới tính</label>
                <input type="text" id="gender" name="gender" placeholder="Nam/Nữ/Khác" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" id="address" name="address" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" id="password" name="password" required>
            </div>
        </div>
        <button type="submit" class="register-btn">Đăng ký</button>
    </form>
</div>
</body>

</html>
