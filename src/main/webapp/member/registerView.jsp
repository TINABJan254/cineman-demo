<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký thành viên - CineMax</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background: #e8e8e8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .left-section {
            flex: 1;
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: white;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .logo {
            font-size: 42px;
            font-weight: 800;
            margin-bottom: 20px;
            letter-spacing: 1px;
            color: #ff6b6b;
        }

        .tagline {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 30px;
            color: #ff6b6b;
        }

        .description {
            font-size: 16px;
            line-height: 1.6;
            opacity: 0.9;
            margin-bottom: 30px;
        }

        .right-section {
            flex: 1;
            padding: 40px;
        }

        .register-container {
            max-width: 100%;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 28px;
            font-size: 30px;
            font-weight: 700;
            color: #232f34;
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
            color: #232f34;
            letter-spacing: 0.5px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group select {
            padding: 12px 15px;
            border: 1.5px solid #b0bec5;
            border-radius: 8px;
            font-size: 15px;
            background: #ffffff;
            color: #232f34;
            transition: all 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: black;
            outline: none;
        }

        .register-btn {
            display: block;
            width: 160px;
            margin: 28px auto 0 auto;
            padding: 12px 0;
            background: #ff6b6b;
            border: none;
            color: #ffffff;
            font-size: 18px;
            font-weight: 600;
            border-radius: 35px;
            cursor: pointer;
            transition: all 0.3s;
            letter-spacing: 1px;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .login-link a {
            color: #ff6b6b;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 900px) {
            .container {
                flex-direction: column;
            }

            .left-section {
                padding: 30px;
            }

            .logo {
                font-size: 36px;
            }

            .tagline {
                font-size: 20px;
            }
        }

        @media (max-width: 600px) {
            .right-section {
                padding: 20px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left-section">
        <div class="logo">Cineman</div>
        <div class="tagline">Rạp chiếu phim</div>
        <div class="description">
            <p>Khám phá hàng ngàn bộ phim và chương trình truyền hình đặc sắc từ mọi thể loại. </p>
        </div>
    </div>

    <div class="right-section">
        <div class="register-container">
            <h2>Đăng ký thành viên</h2>
            <form action="<c:url value='/register' />" method="post">
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
                        <select id="gender" name="gender" required>
                            <option value="">Giới tính</option>
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                            <option value="Khác">Khác</option>
                        </select>
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
                <div class="login-link">
                    Đã có tài khoản? <a href="<c:url value='/login' />">Đăng nhập</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>