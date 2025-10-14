<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        /* Hero Section */
        .hero {
            margin-top: 70px;
            height: 70vh;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://images.unsplash.com/photo-1489599511954-c6d8e80e4e81?ixlib=rb-4.0.3') center/cover;
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

        /* Now Showing Section */
        .now-showing {
            padding: 80px 20px;
            background: #f8f9fa;
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

        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }

        .movie-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: all 0.3s;
            cursor: pointer;
        }

        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        }

        .movie-poster {
            width: 100%;
            height: 350px;
            background: #ddd;
            position: relative;
            overflow: hidden;
        }

        .movie-poster img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .play-btn {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
            height: 60px;
            background: rgba(255,107,107,0.9);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .movie-card:hover .play-btn {
            opacity: 1;
        }

        .movie-info {
            padding: 20px;
        }

        .movie-title {
            font-size: 1.3rem;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .movie-genre {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .movie-rating {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 15px;
        }

        .stars {
            color: #ffd700;
        }

        .btn-book {
            width: 100%;
            padding: 10px;
            background: #ff6b6b;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-book:hover {
            background: #ff5252;
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

        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-icons a {
            width: 40px;
            height: 40px;
            background: #ff6b6b;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: transform 0.3s;
        }

        .social-icons a:hover {
            transform: scale(1.1);
        }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #333;
            color: #999;
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
            <i class="fas fa-film"></i> CinePlex
        </div>
        <ul class="nav-menu">
            <li><a href="#home">Trang chủ</a></li>
            <li><a href="#movies">Phim đang chiếu</a></li>
            <li><a href="#showtimes">Lịch chiếu</a></li>
            <li><a href="#theaters">Rạp</a></li>
            <li><a href="#promotions">Khuyến mãi</a></li>
            <li><a href="#contact">Liên hệ</a></li>
        </ul>
        <div class="auth-buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn-auth btn-login">Đăng nhập</a>
            <a href="${pageContext.request.contextPath}/register" class="btn-auth btn-register">Đăng ký</a>
        </div>
    </nav>
</header>

<!-- Hero Section -->
<section class="hero" id="home">
    <div class="hero-content">
        <h1>Trải nghiệm điện ảnh đỉnh cao</h1>
        <p>Khám phá những bộ phim blockbuster mới nhất với chất lượng hình ảnh và âm thanh tuyệt vời</p>
        <a href="#movies" class="btn-primary">
            <i class="fas fa-ticket-alt"></i> Đặt vé ngay
        </a>
    </div>
</section>

<!-- Now Showing Movies -->
<section class="now-showing" id="movies">
    <div class="container">
        <h2 class="section-title">Phim đang chiếu</h2>
        <div class="movies-grid">
            <!-- Movie Card 1 -->
            <div class="movie-card">
                <div class="movie-poster">
                    <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?ixlib=rb-4.0.3" alt="Movie Poster">
                    <div class="play-btn">
                        <i class="fas fa-play"></i>
                    </div>
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">Avatar: The Way of Water</h3>
                    <p class="movie-genre">Khoa học viễn tưởng, Phiêu lưu</p>
                    <div class="movie-rating">
                            <span class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </span>
                        <span>4.5/5</span>
                    </div>
                    <button class="btn-book">Đặt vé</button>
                </div>
            </div>

            <!-- Movie Card 2 -->
            <div class="movie-card">
                <div class="movie-poster">
                    <img src="https://images.unsplash.com/photo-1594909122845-11baa439b7bf?ixlib=rb-4.0.3" alt="Movie Poster">
                    <div class="play-btn">
                        <i class="fas fa-play"></i>
                    </div>
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">Black Panther: Wakanda Forever</h3>
                    <p class="movie-genre">Hành động, Siêu anh hùng</p>
                    <div class="movie-rating">
                            <span class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </span>
                        <span>4.2/5</span>
                    </div>
                    <button class="btn-book">Đặt vé</button>
                </div>
            </div>

            <!-- Movie Card 3 -->
            <div class="movie-card">
                <div class="movie-poster">
                    <img src="https://images.unsplash.com/photo-1489599511954-c6d8e80e4e81?ixlib=rb-4.0.3" alt="Movie Poster">
                    <div class="play-btn">
                        <i class="fas fa-play"></i>
                    </div>
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">Top Gun: Maverick</h3>
                    <p class="movie-genre">Hành động, Phiêu lưu</p>
                    <div class="movie-rating">
                            <span class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </span>
                        <span>4.8/5</span>
                    </div>
                    <button class="btn-book">Đặt vé</button>
                </div>
            </div>

            <!-- Movie Card 4 -->
            <div class="movie-card">
                <div class="movie-poster">
                    <img src="https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?ixlib=rb-4.0.3" alt="Movie Poster">
                    <div class="play-btn">
                        <i class="fas fa-play"></i>
                    </div>
                </div>
                <div class="movie-info">
                    <h3 class="movie-title">Spider-Man: No Way Home</h3>
                    <p class="movie-genre">Hành động, Siêu anh hùng</p>
                    <div class="movie-rating">
                            <span class="stars">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                            </span>
                        <span>4.6/5</span>
                    </div>
                    <button class="btn-book">Đặt vé</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features -->
<section class="features">
    <div class="container">
        <h2 class="section-title">Tại sao chọn CinePlex?</h2>
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
            <h3>Về CinePlex</h3>
            <p>Hệ thống rạp chiếu phim hàng đầu Việt Nam với hơn 50 cụm rạp trên toàn quốc.</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
        <div class="footer-section">
            <h3>Dịch vụ</h3>
            <a href="#">Đặt vé online</a><br>
            <a href="#">Thẻ thành viên</a><br>
            <a href="#">Voucher & Khuyến mãi</a><br>
            <a href="#">Cho thuê sự kiện</a>
        </div>
        <div class="footer-section">
            <h3>Hỗ trợ</h3>
            <a href="#">Câu hỏi thường gặp</a><br>
            <a href="#">Chính sách đổi/trả vé</a><br>
            <a href="#">Chính sách bảo mật</a><br>
            <a href="#">Điều khoản sử dụng</a>
        </div>
        <div class="footer-section">
            <h3>Liên hệ</h3>
            <p><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Quận 1, TP.HCM</p>
            <p><i class="fas fa-phone"></i> 1900 1234</p>
            <p><i class="fas fa-envelope"></i> info@cineplex.vn</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 CinePlex. Tất cả quyền được bảo lưu.</p>
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

    // Movie card interactions
    document.querySelectorAll('.movie-card').forEach(card => {
        card.addEventListener('click', function() {
            // Add click handler for movie details
            console.log('Movie clicked:', this.querySelector('.movie-title').textContent);
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