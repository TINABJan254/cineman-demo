<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 09/10/2025
  Time: 22:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #7daed3 0%, #5cace8 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 50px 60px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            text-align: center;
            min-width: 400px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 40px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .btn {
            padding: 15px 40px;
            font-size: 1.2rem;
            font-weight: 600;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            position: relative;
            overflow: hidden;
        }

        .btn-login {
            background: linear-gradient(45deg, #4CAF50, #45a049);
            color: white;
            box-shadow: 0 8px 20px rgba(76, 175, 80, 0.3);
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(76, 175, 80, 0.4);
            background: linear-gradient(45deg, #45a049, #4CAF50);
        }

        .btn-register {
            background: linear-gradient(45deg, #81C784, #66BB6A);
            color: white;
            box-shadow: 0 8px 20px rgba(129, 199, 132, 0.3);
        }

        .btn-register:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(129, 199, 132, 0.4);
            background: linear-gradient(45deg, #66BB6A, #81C784);
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

        .btn:active {
            transform: translateY(-1px);
        }

        /* Animation cho container */
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

        .container {
            animation: fadeInUp 0.8s ease-out;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 30px 40px;
                min-width: 300px;
            }

            .title {
                font-size: 2rem;
                margin-bottom: 30px;
            }

            .btn {
                padding: 12px 30px;
                font-size: 1.1rem;
            }
        }

        /* Hiệu ứng particles background */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .particle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
        }
    </style>
</head>
<body>
<div class="particles">
    <div class="particle" style="width: 10px; height: 10px; left: 10%; top: 20%; animation-delay: 0s;"></div>
    <div class="particle" style="width: 15px; height: 15px; left: 20%; top: 80%; animation-delay: 1s;"></div>
    <div class="particle" style="width: 8px; height: 8px; left: 80%; top: 30%; animation-delay: 2s;"></div>
    <div class="particle" style="width: 12px; height: 12px; left: 90%; top: 70%; animation-delay: 3s;"></div>
    <div class="particle" style="width: 6px; height: 6px; left: 60%; top: 10%; animation-delay: 4s;"></div>
    <div class="particle" style="width: 14px; height: 14px; left: 40%; top: 90%; animation-delay: 5s;"></div>
</div>

<div class="container">
    <h1 class="title">Trang chủ</h1>
    <div class="btn-container">
        <a href="/login" class="btn btn-login">
            Đăng nhập
        </a>
        <a href="/member/registerView.jsp" class="btn btn-register">
            Đăng ký
        </a>
    </div>
</div>

<script>
    // Thêm hiệu ứng ripple khi click
    document.querySelectorAll('.btn').forEach(button => {
        button.addEventListener('click', function(e) {
            let ripple = document.createElement('span');
            let rect = this.getBoundingClientRect();
            let size = Math.max(rect.width, rect.height);
            let x = e.clientX - rect.left - size / 2;
            let y = e.clientY - rect.top - size / 2;

            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.classList.add('ripple');

            this.appendChild(ripple);

            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
</script>

<style>
    .ripple {
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.6);
        transform: scale(0);
        animation: ripple-animation 0.6s linear;
        pointer-events: none;
    }

    @keyframes ripple-animation {
        to {
            transform: scale(4);
            opacity: 0;
        }
    }
</style>
</body>
</html>
