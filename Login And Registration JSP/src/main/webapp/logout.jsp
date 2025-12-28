<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout | SecureAuth</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .logout-container {
            background: white;
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        
        .logout-icon {
            font-size: 64px;
            color: #4f6df5;
            margin-bottom: 30px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        .logout-title {
            font-size: 32px;
            color: #333;
            margin-bottom: 15px;
            font-weight: 700;
        }
        
        .logout-message {
            color: #666;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 40px;
        }
        
        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }
        
        .btn {
            padding: 15px 30px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #4f6df5 0%, #3a56d5 100%);
            color: white;
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, #3a56d5 0%, #2a44c5 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(79, 109, 245, 0.3);
        }
        
        .btn-secondary {
            background: #f8f9fa;
            color: #666;
            border: 2px solid #e1e5ee;
        }
        
        .btn-secondary:hover {
            background: white;
            border-color: #4f6df5;
            color: #4f6df5;
        }
        
        .redirect-message {
            margin-top: 30px;
            color: #999;
            font-size: 14px;
        }
        
        .countdown {
            font-weight: 600;
            color: #4f6df5;
        }
        
        .progress-bar {
            height: 4px;
            background: #e1e5ee;
            border-radius: 2px;
            margin-top: 20px;
            overflow: hidden;
        }
        
        .progress {
            height: 100%;
            background: #4f6df5;
            width: 0%;
            transition: width 1s linear;
        }
        
        @media (max-width: 768px) {
            .logout-container {
                padding: 30px 20px;
            }
            
            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <%
        
        String username = (String) session.getAttribute("username");
        
       
        session.invalidate();
        
        
        session = request.getSession(true);
        session.setAttribute("logoutMessage", "You have been successfully logged out.");
        session.setAttribute("username", username);
    %>
    
    <div class="logout-container">
        <div class="logout-icon">
            <i class="fas fa-sign-out-alt"></i>
        </div>
        
        <h1 class="logout-title">Goodbye, <%= username != null ? username : "User" %>!</h1>
        
        <p class="logout-message">
            You have been successfully logged out of your SecureAuth account.
            For security reasons, please close your browser if you are using a public computer.
        </p>
        
        <div class="progress-bar">
            <div class="progress" id="logout-progress"></div>
        </div>
        
        <div class="redirect-message">
            Redirecting to login page in <span class="countdown" id="countdown">5</span> seconds...
        </div>
        
        <div class="btn-group">
            <a href="login.jsp" class="btn btn-primary">
                <i class="fas fa-sign-in-alt"></i>
                Login Again
            </a>
            
            <a href="#" onclick="history.back()" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Go Back
            </a>
        </div>
    </div>
    
    <script>
        let countdown = 5;
        const countdownElement = document.getElementById('countdown');
        const progressBar = document.getElementById('logout-progress');
        
        
        const countdownInterval = setInterval(function() {
            countdown--;
            countdownElement.textContent = countdown;
            progressBar.style.width = ((5 - countdown) / 5 * 100) + '%';
            
            if (countdown <= 0) {
                clearInterval(countdownInterval);
                window.location.href = 'login.jsp';
            }
        }, 1000);
        
        
        document.addEventListener('click', function() {
            clearInterval(countdownInterval);
            countdownElement.textContent = 'Redirect cancelled';
            progressBar.style.width = '100%';
            progressBar.style.background = '#28a745';
        });
    </script>
</body>
</html>