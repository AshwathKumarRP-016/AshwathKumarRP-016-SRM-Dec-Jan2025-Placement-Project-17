<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | SecureAuth</title>
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
        }
        
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo {
            display: flex;
            align-items: center;
        }
        
        .logo i {
            font-size: 28px;
            color: #4f6df5;
            margin-right: 10px;
        }
        
        .logo h1 {
            font-size: 24px;
            color: #333;
            font-weight: 700;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .user-avatar {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #4f6df5 0%, #3a56d5 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }
        
        .user-details {
            text-align: right;
        }
        
        .user-name {
            font-weight: 600;
            color: #333;
        }
        
        .user-role {
            font-size: 12px;
            color: #666;
        }
        
        .logout-btn {
            background: linear-gradient(135deg, #f5576c 0%, #f093fb 100%);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(245, 87, 108, 0.3);
        }
        
        .main-content {
            padding: 40px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .welcome-section {
            background: white;
            border-radius: 20px;
            padding: 50px;
            text-align: center;
            margin-bottom: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
        }
        
        .welcome-icon {
            font-size: 64px;
            color: #4f6df5;
            margin-bottom: 20px;
        }
        
        .welcome-title {
            font-size: 36px;
            color: #333;
            margin-bottom: 15px;
            font-weight: 700;
        }
        
        .welcome-subtitle {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.6;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            transition: all 0.3s;
            border-left: 4px solid #4f6df5;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }
        
        .stat-card.green {
            border-left-color: #28a745;
        }
        
        .stat-card.orange {
            border-left-color: #ffc107;
        }
        
        .stat-card.purple {
            border-left-color: #9c27b0;
        }
        
        .stat-icon {
            font-size: 32px;
            color: #4f6df5;
            margin-bottom: 20px;
        }
        
        .stat-card.green .stat-icon {
            color: #28a745;
        }
        
        .stat-card.orange .stat-icon {
            color: #ffc107;
        }
        
        .stat-card.purple .stat-icon {
            color: #9c27b0;
        }
        
        .stat-value {
            font-size: 32px;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }
        
        .stat-label {
            color: #666;
            font-size: 14px;
        }
        
        .quick-actions {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
        }
        
        .section-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
            font-weight: 600;
        }
        
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .action-btn {
            background: #f8f9fa;
            border: 2px solid #e1e5ee;
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            color: inherit;
        }
        
        .action-btn:hover {
            background: white;
            border-color: #4f6df5;
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(79, 109, 245, 0.1);
        }
        
        .action-icon {
            font-size: 32px;
            color: #4f6df5;
            margin-bottom: 15px;
        }
        
        .action-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }
        
        .action-desc {
            font-size: 12px;
            color: #666;
        }
        
        .footer {
            text-align: center;
            padding: 30px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            margin-top: 40px;
        }
        
        .footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        .session-info {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            margin-top: 30px;
            color: white;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .info-item:last-child {
            border-bottom: none;
        }
        
        .info-label {
            font-weight: 500;
        }
        
        .info-value {
            font-family: monospace;
        }
        
        @media (max-width: 768px) {
            .navbar {
                padding: 15px 20px;
                flex-direction: column;
                gap: 15px;
            }
            
            .user-info {
                width: 100%;
                justify-content: space-between;
            }
            
            .main-content {
                padding: 20px;
            }
            
            .welcome-section {
                padding: 30px 20px;
            }
            
            .welcome-title {
                font-size: 28px;
            }
            
            .quick-actions {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <%
        
        String username = (String) session.getAttribute("username");
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
       
        String firstLetter = username.substring(0, 1).toUpperCase();
    %>
    
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="logo">
            <i class="fas fa-shield-alt"></i>
            <h1>SecureAuth Dashboard</h1>
        </div>
        
        <div class="user-info">
            <div class="user-avatar">
                <%= firstLetter %>
            </div>
            <div class="user-details">
                <div class="user-name"><%= username %></div>
                <div class="user-role">Verified User</div>
            </div>
            <button class="logout-btn" onclick="window.location.href='logout.jsp'">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </button>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="main-content">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <div class="welcome-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h1 class="welcome-title">Welcome, <%= username %>!</h1>
            <p class="welcome-subtitle">
                You have successfully logged into your SecureAuth account. 
                Manage your security settings, view your activity, and access exclusive features.
            </p>
        </div>
        
        <!-- Stats Grid -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-user-check"></i>
                </div>
                <div class="stat-value">100%</div>
                <div class="stat-label">Account Security</div>
            </div>
            
            <div class="stat-card green">
                <div class="stat-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="stat-value" id="login-time">Just now</div>
                <div class="stat-label">Last Login</div>
            </div>
            
            <div class="stat-card orange">
                <div class="stat-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <div class="stat-value">Premium</div>
                <div class="stat-label">Account Tier</div>
            </div>
            
            <div class="stat-card purple">
                <div class="stat-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="stat-value"><%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %></div>
                <div class="stat-label">Today's Date</div>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="quick-actions">
            <h2 class="section-title">Quick Actions</h2>
            <div class="actions-grid">
                <a href="#" class="action-btn">
                    <div class="action-icon">
                        <i class="fas fa-cog"></i>
                    </div>
                    <div class="action-label">Settings</div>
                    <div class="action-desc">Manage account preferences</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="action-label">Security</div>
                    <div class="action-desc">Update password & 2FA</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">
                        <i class="fas fa-history"></i>
                    </div>
                    <div class="action-label">Activity Log</div>
                    <div class="action-desc">View login history</div>
                </a>
                
                <a href="#" class="action-btn">
                    <div class="action-icon">
                        <i class="fas fa-question-circle"></i>
                    </div>
                    <div class="action-label">Help Center</div>
                    <div class="action-desc">Get support & guides</div>
                </a>
            </div>
        </div>
        
        <!-- Session Information -->
        <div class="session-info">
            <h3 style="margin-bottom: 15px; color: white; text-align: center;">Session Information</h3>
            <div class="info-item">
                <span class="info-label">User ID:</span>
                <span class="info-value"><%= userId != null ? userId : "N/A" %></span>
            </div>
            <div class="info-item">
                <span class="info-label">Username:</span>
                <span class="info-value"><%= username %></span>
            </div>
            <div class="info-item">
                <span class="info-label">Session Created:</span>
                <span class="info-value">
                    <%= new java.text.SimpleDateFormat("HH:mm:ss").format(session.getCreationTime()) %>
                </span>
            </div>
            <div class="info-item">
                <span class="info-label">Session Last Accessed:</span>
                <span class="info-value">
                    <%= new java.text.SimpleDateFormat("HH:mm:ss").format(session.getLastAccessedTime()) %>
                </span>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <div class="footer">
        <p>© 2024 SecureAuth. All rights reserved.</p>
        <p>
            <a href="#">Privacy Policy</a> | 
            <a href="#">Terms of Service</a> | 
            <a href="#">Contact Support</a>
        </p>
    </div>
    
    <script>
        
        function updateLoginTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'});
            document.getElementById('login-time').textContent = timeString;
        }
        
        
        updateLoginTime();
        setInterval(updateLoginTime, 60000);
        
        
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.stat-card, .action-btn');
            
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    card.style.transition = 'all 0.5s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
        
        
        let idleTime = 0;
        
        function resetIdleTime() {
            idleTime = 0;
        }
        
        function checkIdleTime() {
            idleTime++;
            if (idleTime > 10) { 
                if (confirm('You have been idle for 10 minutes. Would you like to stay logged in?')) {
                    resetIdleTime();
                } else {
                    window.location.href = 'logout.jsp';
                }
            }
        }
        
        
        document.addEventListener('mousemove', resetIdleTime);
        document.addEventListener('keypress', resetIdleTime);
        
        /
        setInterval(checkIdleTime, 60000);
    </script>
</body>
</html>