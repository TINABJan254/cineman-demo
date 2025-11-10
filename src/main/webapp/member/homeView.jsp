<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CinePlex - Rạp chiếu phim</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #1a1a2e, #16213e);
            color: white;
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #ff6b6b;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-menu a {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-menu a:hover {
            color: #ff6b6b;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn-auth {
            padding: 8px 20px;
            border: 2px solid #ff6b6b;
            background: transparent;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            transition: all 0.3s;
        }

        .btn-login:hover {
            background: #ff6b6b;
        }

        .btn-register {
            background: #ff6b6b;
        }

        .btn-register:hover {
            background: transparent;
        }

        .btn-logout {
            background: #95a5a6;
            border-color: #95a5a6;
            font-size: 0.9rem;
            padding: 6px 15px;
        }

        .btn-logout:hover {
            background: #7f8c8d;
        }

        /* User info styles */
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            background: rgba(255, 255, 255, 0.1);
            padding: 8px 15px;
            border-radius: 25px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .welcome-text {
            font-size: 0.9rem;
            color: white;
            font-weight: 500;
        }

        .username {
            font-weight: 600;
            color: #ff6b6b;
        }

        .user-icon {
            width: 30px;
            height: 30px;
            background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 0.8rem;
        }

        /* Hero Section */
        .hero {
            margin-top: 70px;
            height: 70vh;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://evgroup.vn/wp-content/uploads/2024/04/thiet_bi_rap_phim_06.jpg') center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .hero-content p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            max-width: 600px;
        }

        .btn-primary {
            display: inline-block;
            padding: 15px 35px;
            background: #ff6b6b;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: bold;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(255,107,107,0.4);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255,107,107,0.6);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 50px;
            color: #333;
        }

        .movie-poster img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Features Section */
        .features {
            padding: 80px 20px;
            background: white;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
        }

        .feature-card {
            text-align: center;
            padding: 30px;
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #ff6b6b, #ff8e8e);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: white;
            font-size: 2rem;
        }

        .feature-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: #333;
        }

        .feature-desc {
            color: #666;
            line-height: 1.6;
        }

        /* Footer */
        .footer {
            background: #1a1a2e;
            color: white;
            padding: 50px 20px 20px;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
        }

        .footer-section h3 {
            margin-bottom: 20px;
            color: #ff6b6b;
        }

        .footer-section p, .footer-section a {
            color: #ccc;
            text-decoration: none;
            line-height: 1.8;
        }

        .footer-section a:hover {
            color: #ff6b6b;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }

            .hero-content h1 {
                font-size: 2.5rem;
            }

            .movies-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header class="header">
    <nav class="nav-container">
        <div class="logo">
            <i class="fas fa-film"></i> Rạp phim cineman
        </div>
        <ul class="nav-menu">
            <li><a href="#home">Trang chủ</a></li>
            <li><a href="#theaters">Rạp</a></li>
            <li><a href="#promotions">Khuyến mãi</a></li>
        </ul>
<%--        <div class="auth-buttons">--%>
<%--            <a href="${pageContext.request.contextPath}/login" class="btn-auth btn-login">Đăng nhập</a>--%>
<%--            <a href="${pageContext.request.contextPath}/member/registerView.jsp" class="btn-auth btn-register">Đăng ký</a>--%>
<%--        </div>--%>

        <div class="auth-buttons">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <!-- Hiển thị khi đã đăng nhập -->
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
                </c:when>
                <c:otherwise>
                    <!-- Hiển thị khi chưa đăng nhập -->
                    <a href="${pageContext.request.contextPath}/login" class="btn-auth btn-login">Đăng nhập</a>
                    <a href="${pageContext.request.contextPath}/member/registerView.jsp" class="btn-auth btn-register">Đăng ký</a>
                </c:otherwise>
            </c:choose>
        </div>

    </nav>
</header>

<!-- Hero Section -->
<section class="hero" id="home">
    <div class="hero-content">
        <h1>Trải nghiệm điện ảnh đỉnh cao</h1>
        <%--        <a href="#movies" class="btn-primary">--%>
        <%--            <i class="fas fa-ticket-alt"></i> Đặt vé ngay--%>
        <%--        </a>--%>
    </div>
</section>

<!-- Features -->
<section class="features">
    <div class="container">
        <h2 class="section-title">Tại sao chọn Cineman</h2>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-couch"></i>
                </div>
                <h3 class="feature-title">Ghế ngồi thoải mái</h3>
                <p class="feature-desc">Ghế sofa cao cấp với hệ thống massage và điều hòa riêng biệt</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-volume-up"></i>
                </div>
                <h3 class="feature-title">Âm thanh Dolby Atmos</h3>
                <p class="feature-desc">Hệ thống âm thanh vòm 360 độ mang đến trải nghiệm sống động</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-mobile-alt"></i>
                </div>
                <h3 class="feature-title">Đặt vé online</h3>
                <p class="feature-desc">Đặt vé dễ dàng qua website hoặc ứng dụng di động</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3>Về Cineman</h3>
            <p>Hệ thống rạp chiếu phim hàng đầu Việt Nam với hơn 50 cụm rạp trên toàn quốc.</p>
        </div>
        <div class="footer-section">
            <h3>Dịch vụ</h3>
            <a href="#">Đặt vé online</a><br>
            <a href="#">Thẻ thành viên</a><br>
            <a href="#">Khuyến mãi</a><br>
        </div>
        <div class="footer-section">
            <h3>Hỗ trợ</h3>
            <a href="#">Câu hỏi thường gặp</a><br>
            <a href="#">Chính sách bảo mật</a><br>
            <a href="#">Điều khoản sử dụng</a>
        </div>
        <div class="footer-section">
            <h3>Liên hệ</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Hà Nội</p>
            <p><i class="fas fa-phone"></i> 1900 1234</p>
            <p><i class="fas fa-envelope"></i> info@cineplex.vn</p>
        </div>
    </div>
</footer>

<script>
    // Smooth scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Book ticket buttons
    document.querySelectorAll('.btn-book').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.stopPropagation();
            // Add booking logic here
            alert('Chức năng đặt vé sẽ được triển khai!');
        });
    });
</script>
</body>
</html>