<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/10/2025
  Time: 10:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách suất chiếu</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #8c67b5 100%);
            min-height: 100vh;
            padding: 20px;
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

        @media (max-width: 768px) {
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
    </style>
</head>
<body>

<div class="container">
    <h1 class="title">Danh sách các suất chiếu</h1>

    <div class="info-section">
        <div class="movie-info">
            Phim: <span style="color: #667eea;">${showtimeStats[0].movie.title}</span>
        </div>
        <div class="date-info">
            Từ ngày:
                <strong> <fmt:formatDate value="${startDate}" pattern="dd/MM/yyyy"/> </strong>&nbsp;&nbsp;
            Đến ngày:
                <strong> <fmt:formatDate value="${endDate}" pattern="dd/MM/yyyy"/> </strong>
        </div>

    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Ngày chiếu</th>
                <th>Giờ chiếu</th>
                <th>Phòng</th>
                <th>Tổng vé</th>
                <th>Doanh thu</th>
            </tr>
            </thead>

            <tbody id="showtimeTableBody">
            <c:choose>
                <c:when test="${not empty showtimeStats}">
                    <c:forEach var="showtime" items="${showtimeStats}">
                        <tr>
                            <td>${showtime.id}</td>
                            <td>
                                <fmt:formatDate value="${showtime.startTime}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${showtime.startTime}" pattern="HH:mm"/>
                            </td>
                            <td>${showtime.screeningRoom.name}</td>
                            <td>
                                <fmt:formatNumber value="${showtime.soldTickets}" type="number" groupingUsed="true"/>
                            </td>
                            <td class="revenue">
                                <fmt:formatNumber value="${showtime.totalRevenue}" type="number" groupingUsed="true"/> VND
                            </td>
                        </tr>
                    </c:forEach>

                    <tr class="total-row">
                        <td colspan="4"><strong>Tổng</strong></td>
                        <td><strong><fmt:formatNumber value="${totalTickets}" type="number" groupingUsed="true"/></strong></td>
                        <td class="revenue"><strong><fmt:formatNumber value="${revenueMovie}" type="number" groupingUsed="true"/> VND</strong></td>
                    </tr>
                </c:when>

                <c:otherwise>
                    <tr>
                        <td colspan="6">Không có dữ liệu suất chiếu trong khoảng thời gian này.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>

    <a href="javascript:history.back()" class="back-btn">
        ⬅️ Quay lại
    </a>
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