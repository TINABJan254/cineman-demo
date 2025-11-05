<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/10/2025
  Time: 9:35 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
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
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
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
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.3);
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

        .header-info {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.9);
            padding: 10px 15px;
            border-radius: 10px;
            font-size: 0.9rem;
            color: #555;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .welcome-text {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 30px;
            font-style: italic;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 20px;
            margin-top: 40px;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.7);
            padding: 25px 15px;
            border-radius: 15px;
            transition: all 0.3s ease;
            cursor: pointer;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            background: rgba(255, 255, 255, 0.9);
        }

        .feature-card i {
            font-size: 2rem;
            color: #667eea;
            margin-bottom: 10px;
        }

        .feature-card h4 {
            color: #2c3e50;
            font-size: 0.9rem;
            font-weight: 600;
        }

        @media (max-width: 768px) {
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

            .header-info {
                position: relative;
                top: auto;
                right: auto;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<%--<div class="header-info">--%>
<%--    <i class="fas fa-user"></i> TINABJan254 | <i class="fas fa-calendar"></i> 16/10/2025--%>
<%--</div>--%>

<div class="dashboard-container">
    <h1 class="title">Trang chủ quản lý</h1>

    <p class="welcome-text">Chào mừng bạn đến với hệ thống quản lý</p>

    <a href="selectStatisticView.jsp" class="stats-button" onclick="handleStatsClick(event)">
        <i class="fas fa-chart-bar"></i>
        Xem thống kê
    </a>

<%--    <div class="feature-grid">--%>
<%--        <div class="feature-card" onclick="handleFeatureClick('users')">--%>
<%--            <i class="fas fa-users"></i>--%>
<%--            <h4>Người dùng</h4>--%>
<%--        </div>--%>

<%--        <div class="feature-card" onclick="handleFeatureClick('reports')">--%>
<%--            <i class="fas fa-file-alt"></i>--%>
<%--            <h4>Báo cáo</h4>--%>
<%--        </div>--%>

<%--        <div class="feature-card" onclick="handleFeatureClick('settings')">--%>
<%--            <i class="fas fa-cog"></i>--%>
<%--            <h4>Cài đặt</h4>--%>
<%--        </div>--%>
    </div>
</div>

</body>
</html>
