<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thống kê phim theo doanh thu</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
            max-width: 1000px;
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

        .filter-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            text-align: center;
        }

        .date-group {
            display: inline-block;
            margin: 0 15px;
        }

        .date-label {
            font-weight: 600;
            color: #333;
            margin-right: 8px;
        }

        .date-input {
            padding: 8px 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .date-input:focus {
            border-color: #667eea;
            outline: none;
        }

        .view-btn {
            background: #4CAF50;
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 25px;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s ease;
        }

        .view-btn:hover {
            background: #45a049;
            transform: translateY(-2px);
        }

        .table-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        .movie-title {
            color: #667eea;
            font-weight: 600;
            text-decoration: none;
        }

        .movie-title:hover {
            text-decoration: underline;
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
            display: inline-block;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background: #ff5252;
            transform: translateY(-2px);
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

            .date-group {
                display: block;
                margin: 10px 0;
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
    <div class="container">
        <h1 class="title">Thống kê phim theo doanh thu</h1>

        <div class="filter-section">
            <form id="statisticsForm" method="POST" action="movieStat">
                <div class="date-group">
                    <label class="date-label">Ngày bắt đầu:</label>
                    <input type="text" id="startDate" name="startDate" class="date-input" value="${startDate}">
                </div>

                <div class="date-group">
                    <label class="date-label">Ngày kết thúc:</label>
                    <input type="text" id="endDate" name="endDate" class="date-input" value="${endDate}">
                </div>

                <br>
                <button type="submit" class="view-btn">
                    <i class="fas fa-search"></i> Xem
                </button>
            </form>
        </div>

        <div class="table-container">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên phim</th>
                    <th>Tổng vé bán ra</th>
                    <th>Doanh thu</th>
                </tr>
                </thead>

                <tbody id="statisticsTableBody">
                <c:choose>
                    <c:when test="${not empty movieStats}">
                        <c:forEach var="m" items="${movieStats}">
                            <tr onclick="viewMovieDetails(${m.id})">
                                <td>${m.id}</td>
                                <td><a href="#" class="movie-title">${m.title}</a></td>
                                <td><fmt:formatNumber value="${m.soldTickets}" type="number" groupingUsed="true"/></td>
                                <td class="revenue">
                                    <fmt:formatNumber value="${m.totalRevenue}" type="number" groupingUsed="true"/> VND
                                </td>
                            </tr>
                        </c:forEach>

                        <tr class="total-row">
                            <td colspan="2"><strong>Tổng</strong></td>
                            <td><strong><fmt:formatNumber value="${totalTickets}" type="number" groupingUsed="true"/></strong></td>
                            <td class="revenue"><strong><fmt:formatNumber value="${totalRevenue}" type="number" groupingUsed="true"/> VND</strong></td>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <tr>
                            <td colspan="4">Không có dữ liệu thống kê trong khoảng thời gian này.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <a href="selectStatisticView.jsp" class="back-btn">
            <i class="fas fa-arrow-left"></i> Quay lại
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script>
    // Chỉ định hiển thị: dd/MM/yyyy, nhưng giá trị gửi đi là yyyy-MM-dd
    flatpickr("#startDate", {
        altInput: true,          // tạo input hiển thị đẹp
        altFormat: "d/m/Y",      // hiển thị cho người dùng
        dateFormat: "Y-m-d",     // giá trị thực gửi backend
        defaultDate: "${startDate}" // giữ nguyên ngày đã chọn sau reload
    });

    flatpickr("#endDate", {
        altInput: true,
        altFormat: "d/m/Y",
        dateFormat: "Y-m-d",
        defaultDate: "${endDate}"
    });

    // Validate trước khi submit form
    document.getElementById('statisticsForm').addEventListener('submit', function(e) {
        const startDate = document.getElementById('startDate').value; // yyyy-MM-dd
        const endDate = document.getElementById('endDate').value;     // yyyy-MM-dd

        if (!startDate || !endDate) {
            alert('Vui lòng chọn ngày bắt đầu và kết thúc!');
            e.preventDefault();
            return;
        }

        const sd = new Date(startDate);
        const ed = new Date(endDate);

        if (sd > ed) {
            alert('Ngày bắt đầu không thể lớn hơn ngày kết thúc!');
            e.preventDefault();
            return;
        }
    });

    // Hàm xem chi tiết phim
    function viewMovieDetails(movieId) {
        const startDate = document.getElementById('startDate').value; // yyyy-MM-dd
        const endDate = document.getElementById('endDate').value;

        // Hiệu ứng click
        event.currentTarget.style.backgroundColor = '#cce5ff';

        setTimeout(function() {
            const url = 'showtimeStat?id=' + movieId
                + '&sd=' + encodeURIComponent(startDate)
                + '&ed=' + encodeURIComponent(endDate);

            window.location.href = url;
        }, 200);
    }
</script>
</body>
</html>