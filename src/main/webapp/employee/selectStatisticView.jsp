<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 16/10/2025
  Time: 9:38 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn thống kê</title>
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

        .statistics-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 60px 50px;
            max-width: 600px;
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
            text-align: center;
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

        .form-group {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 40px;
            gap: 20px;
        }

        .form-label {
            font-size: 1.2rem;
            font-weight: 600;
            color: #2c3e50;
            white-space: nowrap;
        }

        .select-wrapper {
            position: relative;
            flex: 1;
            max-width: 300px;
        }

        .select-dropdown {
            width: 100%;
            padding: 15px 50px 15px 20px;
            font-size: 1.1rem;
            border: 2px solid #e1e8ed;
            border-radius: 15px;
            background: white;
            color: #2c3e50;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .select-dropdown:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .select-dropdown:hover {
            border-color: #667eea;
        }

        .select-wrapper::after {
            content: '\f107';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            font-size: 1.2rem;
            pointer-events: none;
            transition: transform 0.3s ease;
        }

        .select-wrapper.open::after {
            transform: translateY(-50%) rotate(180deg);
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }

        .btn {
            padding: 15px 40px;
            font-size: 1.1rem;
            font-weight: 600;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-back {
            background: linear-gradient(135deg, #95a5a6 0%, #7f8c8d 100%);
            color: white;
            box-shadow: 0 8px 25px rgba(149, 165, 166, 0.3);
        }

        .btn-back:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(149, 165, 166, 0.4);
        }

        .btn-view {
            background: linear-gradient(135deg, #4CAF50 0%, #45a049 100%);
            color: white;
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.3);
        }

        .btn-view:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(76, 175, 80, 0.4);
        }

        .btn:active {
            transform: translateY(-1px);
        }

        .header-info {
            position: absolute;
            top: 20px;
            right: 20px;
            background: rgba(255, 255, 255, 0.9);
            padding: 12px 18px;
            border-radius: 15px;
            font-size: 0.9rem;
            color: #555;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .statistics-container {
                padding: 40px 30px;
                margin: 10px;
            }

            .title {
                font-size: 1.8rem;
                margin-bottom: 40px;
            }

            .form-group {
                flex-direction: column;
                align-items: stretch;
                gap: 15px;
            }

            .form-label {
                text-align: center;
            }

            .select-wrapper {
                max-width: none;
            }

            .button-group {
                flex-direction: column;
                gap: 15px;
            }

            .btn {
                justify-content: center;
            }

            .header-info {
                position: relative;
                top: auto;
                right: auto;
                margin-bottom: 30px;
                display: inline-block;
            }
        }

        /* Animation cho dropdown */
        .select-dropdown option {
            padding: 10px;
            background: white;
            color: #2c3e50;
        }
    </style>
</head>
<body>
<%--<div class="header-info">--%>
<%--    <i class="fas fa-user"></i> TINABJan254 | <i class="fas fa-calendar"></i> 16/10/2025--%>
<%--</div>--%>

<div class="statistics-container">
    <h1 class="title">Chọn thống kê</h1>

    <div class="form-group">
        <label for="statisticsType" class="form-label">Chọn loại thống kê</label>
        <div class="select-wrapper">
            <select id="statisticsType" name="statisticsType" class="select-dropdown">
                <option value="">-- Chọn loại thống kê --</option>
                <option value="movie">Thống kê phim</option>
                <option value="customer">Thống kê khách hàng</option>
                <option value="revenue">Thống kê doanh thu</option>
            </select>
        </div>
    </div>

    <div class="button-group">
        <a href="managerHomeView.jsp" class="btn btn-back" onclick="handleBackClick(event)">
            <i class="fas fa-arrow-left"></i>
            Quay lại
        </a>

        <button type="button" class="btn btn-view" onclick="handleViewClick()">
            <i class="fas fa-chart-line"></i>
            Xem
        </button>
    </div>

</div>

<script>

    const statisticsUrls = {
        'movie': 'movieStatisticView.jsp',
        'customer': 'customerStat',
        'revenue': 'revenueStat'
    };

    // Xử lý hiệu ứng dropdown
    const selectWrapper = document.querySelector('.select-wrapper');
    const selectDropdown = document.querySelector('.select-dropdown');

    selectDropdown.addEventListener('focus', function() {
        selectWrapper.classList.add('open');
    });

    selectDropdown.addEventListener('blur', function() {
        selectWrapper.classList.remove('open');
    });

    // Xử lý sự kiện submit form
    function handleViewClick(event) {
        const selectValue = document.getElementById('statisticsType').value;

        if (!selectValue) {
            showNotification('Vui lòng chọn loại thống kê!', 'error');
            return;
        }

        const button = document.querySelector('.btn-view');
        const originalText = button.innerHTML;

        // Lấy URL tương ứng với option đã chọn
        const targetUrl = statisticsUrls[selectValue];
        window.location.href = targetUrl;
    }

    // Hàm hiển thị thông báo
    function showNotification(message, type = 'success') {
        const notification = document.createElement('div');
        const bgColor = type === 'error' ? 'linear-gradient(135deg, #e74c3c, #c0392b)' : 'linear-gradient(135deg, #4CAF50, #45a049)';

        notification.style.cssText = `
                position: fixed;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                background: ${bgColor};
                color: white;
                padding: 15px 25px;
                border-radius: 10px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.2);
                z-index: 1000;
                font-weight: 600;
                animation: slideDown 0.3s ease;
            `;
        notification.textContent = message;

        document.body.appendChild(notification);

        setTimeout(() => {
            notification.style.animation = 'slideUp 0.3s ease';
            setTimeout(() => notification.remove(), 300);
        }, 3000);
    }

    // Thêm CSS animation cho notification
    const style = document.createElement('style');
    style.textContent = `
            @keyframes slideDown {
                from { transform: translateX(-50%) translateY(-100%); }
                to { transform: translateX(-50%) translateY(0); }
            }
            @keyframes slideUp {
                from { transform: translateX(-50%) translateY(0); }
                to { transform: translateX(-50%) translateY(-100%); }
            }
        `;
    document.head.appendChild(style);

    // Hiệu ứng khi trang load
    window.addEventListener('load', function() {
        const container = document.querySelector('.statistics-container');
        container.style.transform = 'scale(0.95)';
        container.style.opacity = '0';

        setTimeout(() => {
            container.style.transition = 'all 0.5s cubic-bezier(0.4, 0, 0.2, 1)';
            container.style.transform = 'scale(1)';
            container.style.opacity = '1';
        }, 100);
    });
</script>
</body>
</html>
