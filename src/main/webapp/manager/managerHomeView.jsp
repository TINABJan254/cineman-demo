<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/10/2025
  Time: 9:35 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ quản lý</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #ffffff;
            min-height: 100vh;
            padding: 0;
        }

        /* Header Styles */
        .header {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            backdrop-filter: blur(10px);
            padding: 15px 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .system-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #ffffff;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .system-title i {
            color: #ffffff;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            background: #ffffff;
            padding: 10px 20px;
            border-radius: 25px;
            border: 1px solid rgba(102, 126, 234, 0.2);
        }

        .welcome-text {
            font-size: 1rem;
            color: #2c3e50;
            font-weight: 500;
        }

        .username {
            font-weight: 600;
            color: #667eea;
        }

        .user-icon {
            width: 35px;
            height: 35px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        /* Main Content */
        .main-content {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 80px);
            padding: 40px 20px;
        }

        .dashboard-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 60px 50px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeInUp 0.8s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .title {
            font-size: 2.2rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 50px;
            position: relative;
            letter-spacing: 1px;
        }

        .title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        .stats-button {
            background: #ff6b6b;
            color: white;
            border: none;
            padding: 18px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .stats-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .stats-button:hover::before {
            left: 100%;
        }

        .stats-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(76, 175, 80, 0.4);
        }

        .stats-button:active {
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(76, 175, 80, 0.3);
        }

        .stats-button i {
            font-size: 1.2rem;
        }

        .welcome-message {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 30px;
            font-style: italic;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .system-title {
                font-size: 1.5rem;
            }

            .dashboard-container {
                padding: 40px 30px;
                margin: 10px;
            }

            .title {
                font-size: 1.8rem;
            }

            .stats-button {
                padding: 15px 30px;
                font-size: 1rem;
            }
        }

        @media (max-width: 480px) {
            .header {
                padding: 15px 20px;
            }

            .user-info {
                flex-direction: column;
                gap: 8px;
                padding: 8px 15px;
            }

            .system-title {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header">
    <div class="header-content">
        <div class="system-title">
            <i class="fas fa-film"></i>
            Hệ thống quản lý rạp chiếu phim
        </div>
        <div class="user-info">
            <div class="user-icon">
                <i class="fas fa-user"></i>
            </div>
            <div class="welcome-text">
                Welcome <span class="username">${sessionScope.user.fullName}</span>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="main-content">
    <div class="dashboard-container">
        <h1 class="title">Trang chủ quản lý</h1>

        <p class="welcome-message">Chào mừng bạn đến với hệ thống quản lý</p>

        <a href="selectStatisticView.jsp" class="stats-button" onclick="handleStatsClick(event)">
            <i class="fas fa-chart-bar"></i>
            Xem thống kê
        </a>
    </div>
</div>

</body>
</html>
