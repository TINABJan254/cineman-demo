<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/10/2025
  Time: 10:14 SA
  To change this template use File | Settings | File Templates.
--%>
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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #8c67b5 100%);
            /*background: linear-gradient(135deg, #a8d8ea 0%, #87ceeb 50%, #b0e0e6 100%);*/
            min-height: 100vh;
            padding: 20px;
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
            background: #95a5a6;
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
            background: #7f8c8d;
            transform: translateY(-2px);
        }

        .header-info {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.9);
            padding: 10px 15px;
            border-radius: 10px;
            font-size: 14px;
            color: #555;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
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
<%--    👤 TINABJan254 | 📅 22/10/2025--%>
<%--</div>--%>

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
                🔍 Xem
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
<%--
            <tbody id="statisticsTableBody">

            <tr onclick="viewMovieDetails(1, 'Avengers: Endgame')">
                <td>1</td>
                <td><a href="#" class="movie-title">Avengers: Endgame</a></td>
                <td>125,430</td>
                <td class="revenue">15,678,750,000 VND</td>
            </tr>
            <tr onclick="viewMovieDetails(2, 'Spider-Man: No Way Home')">
                <td>2</td>
                <td><a href="#" class="movie-title">Spider-Man: No Way Home</a></td>
                <td>98,765</td>
                <td class="revenue">12,345,625,000 VND</td>
            </tr>
            <tr onclick="viewMovieDetails(3, 'Black Panther')">
                <td>3</td>
                <td><a href="#" class="movie-title">Black Panther</a></td>
                <td>87,234</td>
                <td class="revenue">10,904,250,000 VND</td>
            </tr>
            <tr onclick="viewMovieDetails(4, 'Fast & Furious 9')">
                <td>4</td>
                <td><a href="#" class="movie-title">Fast & Furious 9</a></td>
                <td>76,543</td>
                <td class="revenue">9,567,875,000 VND</td>
            </tr>
            <tr onclick="viewMovieDetails(5, 'Dune')">
                <td>5</td>
                <td><a href="#" class="movie-title">Dune</a></td>
                <td>65,432</td>
                <td class="revenue">8,179,000,000 VND</td>
            </tr>
            <tr class="total-row">
                <td colspan="2"><strong>Tổng</strong></td>
                <td><strong>453,404</strong></td>
                <td class="revenue"><strong>56,675,500,000 VND</strong></td>
            </tr>
            </tbody>
--%>

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

    <a href="selectStatisticView.jsp" >
        ⬅️ Quay lại
    </a>
</div>
<%--
<script>
    // Hàm load thống kê
    document.getElementById('statisticsForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;

        if (!startDate || !endDate) {
            alert('Vui lòng chọn ngày bắt đầu và kết thúc!');
            return;
        }

        if (new Date(startDate) > new Date(endDate)) {
            alert('Ngày bắt đầu không thể lớn hơn ngày kết thúc!');
            return;
        }

        const button = document.querySelector('.view-btn');
        const originalText = button.innerHTML;

        // Hiệu ứng loading
        button.innerHTML = '⏳ Đang tải...';
        button.disabled = true;

        // Submit form
        this.submit();
    });

    // Hàm xem chi tiết phim
    function viewMovieDetails(movieId) {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;

        // Hiệu ứng click
        event.currentTarget.style.backgroundColor = '#cce5ff';

        setTimeout(function() {
            const url = 'showtimeStat?id=' + movieId + '&sd=' + startDate + '&ed=' + endDate;

            window.location.href = url;
        }, 200);
    }

    // Thiết lập ngày hiện tại
    document.addEventListener('DOMContentLoaded', function() {
        // const today = new Date().toISOString().split('T')[0];
        // document.getElementById('endDate').value = today;
    }
    );
</script>
--%>

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
