<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách hóa đơn</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
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
            min-height: calc(100vh - 80px);
            padding: 40px 20px;
            background: #ffffff;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }

        .info-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            text-align: center;
        }

        .movie-info {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }

        .date-info {
            font-size: 16px;
            color: #666;
            margin-bottom: 5px;
        }

        .table-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 800px;
        }

        th {
            background: #667eea;
            color: white;
            padding: 15px 10px;
            text-align: center;
            font-weight: 600;
        }

        td {
            padding: 12px 10px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        tbody tr {
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        tbody tr:hover {
            background-color: #f0f8ff;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .revenue {
            font-weight: 700;
            color: #27ae60;
        }

        .total-row {
            background-color: #e8f5e8 !important;
            font-weight: 700;
        }

        .total-row td {
            border-top: 2px solid #4CAF50;
            font-size: 16px;
        }

        .back-btn {
            background: #ff6b6b;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 25px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background: #ff5252;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
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

            .container {
                padding: 20px;
                margin: 10px;
            }

            .info-section {
                padding: 15px;
            }

            .movie-info {
                font-size: 16px;
            }

            .date-info {
                font-size: 14px;
            }

            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px 5px;
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

            .back-btn {
                padding: 10px 20px;
                font-size: 14px;
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
            <a href="${pageContext.request.contextPath}/logout" class="btn-auth btn-logout">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="main-content">
    <div class="container">
        <h1 class="title">Danh sách hóa đơn</h1>

        <div class="info-section">
            <div class="movie-info">
                Suất chiếu: <span style="color: #667eea;"></span>
            </div>
            <div class="date-info">
                Ngày:
                <strong><fmt:formatDate value="${showtime.startTime}" pattern="HH:mm - dd/MM/yyyy"/></strong>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Tại phòng:
                <strong> <span>${showtime.screeningRoom.name}</span> </strong>
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Khách hàng</th>
                    <th>Ngày tạo</th>
                    <th>Số vé</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>

                <tbody id="showtimeTableBody">
                <c:choose>
                    <c:when test="${not empty billStats}">
                        <c:forEach var="bill" items="${billStats}">
                            <tr>
                                <td>${bill.id}</td>
                                <td>${bill.customer.fullName}</td>
                                <td>
                                    <fmt:formatDate value="${bill.createdAt}" pattern="HH:mm dd/MM/yyyy"/>
                                </td>
                                <td>${bill.totalTickets}</td>
                                <td>
                                    <fmt:formatNumber value="${bill.totalPrice}" type="number" groupingUsed="true"/>
                                </td>
                            </tr>
                        </c:forEach>

                        <tr class="total-row">
                            <td colspan="3"><strong>Tổng</strong></td>
                            <td><strong><fmt:formatNumber value="${totalTickets}" type="number" groupingUsed="true"/></strong></td>
                            <td class="revenue"><strong><fmt:formatNumber value="${revenueShowtime}" type="number" groupingUsed="true"/> VND</strong></td>

                        </tr>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="5">Không có dữ liệu hóa đơn.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <a href="javascript:history.back()" class="back-btn">
            <i class="fas fa-arrow-left"></i> Quay lại
        </a>
    </div>
</div>

<script>
    // Thiết lập hiệu ứng hover cho các dòng trong bảng
    document.addEventListener('DOMContentLoaded', function() {
        const rows = document.querySelectorAll('tbody tr');
        rows.forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.backgroundColor = '#f0f8ff';
            });

            row.addEventListener('mouseleave', function() {
                if (!this.classList.contains('total-row')) {
                    this.style.backgroundColor = '';
                }
            });
        });
    });

</script>
</body>
</html>