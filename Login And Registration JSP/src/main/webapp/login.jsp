<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Login | Authentication System</title>
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
        
        .container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }
        
        .left-panel {
            flex: 1;
            background: linear-gradient(135deg, #4f6df5 0%, #3a56d5 100%);
            color: white;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .right-panel {
            flex: 1;
            padding: 50px;
        }
        
        .welcome-text h1 {
            font-size: 32px;
            margin-bottom: 10px;
            font-weight: 700;
        }
        
        .welcome-text p {
            font-size: 16px;
            opacity: 0.9;
            line-height: 1.6;
        }
        
        .features {
            margin-top: 40px;
        }
        
        .feature {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .feature i {
            font-size: 20px;
            margin-right: 15px;
            color: #9bb7ff;
        }
        
        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
        }
        
        .logo i {
            font-size: 32px;
            margin-right: 10px;
            color: #4f6df5;
        }
        
        .logo h2 {
            font-size: 28px;
            color: #333;
        }
        
        .form-header {
            margin-bottom: 30px;
        }
        
        .form-header h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }
        
        .form-header p {
            color: #666;
            font-size: 15px;
        }
        
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }
        
        .form-control {
            width: 100%;
            padding: 14px 15px 14px 45px;
            border: 2px solid #e1e5ee;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
            background: #f8f9fa;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #4f6df5;
            background: white;
            box-shadow: 0 0 0 3px rgba(79, 109, 245, 0.1);
        }
        
        .btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #4f6df5 0%, #3a56d5 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .btn i {
            margin-right: 10px;
        }
        
        .btn:hover {
            background: linear-gradient(135deg, #3a56d5 0%, #2a44c5 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(79, 109, 245, 0.3);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .message {
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        
        .message i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .success {
            background: #e7f7ef;
            color: #0d6832;
            border-left: 4px solid #28a745;
        }
        
        .error {
            background: #fdeded;
            color: #a71d2a;
            border-left: 4px solid #dc3545;
        }
        
        .divider {
            text-align: center;
            margin: 30px 0;
            position: relative;
            color: #999;
        }
        
        .divider:before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: #eee;
            z-index: 1;
        }
        
        .divider span {
            background: white;
            padding: 0 15px;
            position: relative;
            z-index: 2;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #666;
        }
        
        .register-link a {
            color: #4f6df5;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        
        .register-link a:hover {
            color: #3a56d5;
            text-decoration: underline;
        }
        
        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }
        
        .forgot-password a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
        }
        
        .forgot-password a:hover {
            color: #4f6df5;
        }
        
        .footer-text {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #999;
        }
        
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .left-panel {
                padding: 30px;
            }
            
            .right-panel {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Panel (Branding) -->
        <div class="left-panel">
            <div class="welcome-text">
                <h1>Welcome Back</h1>
                <p>Sign in to access your account and manage your data securely with our enterprise-grade authentication system.</p>
            </div>
            
            <div class="features">
                <div class="feature">
                    <i class="fas fa-shield-alt"></i>
                    <div>
                        <h4>Bank-Level Security</h4>
                        <p>Military-grade encryption protecting your data</p>
                    </div>
                </div>
                <div class="feature">
                    <i class="fas fa-bolt"></i>
                    <div>
                        <h4>Lightning Fast</h4>
                        <p>Instant authentication with minimal latency</p>
                    </div>
                </div>
                <div class="feature">
                    <i class="fas fa-user-check"></i>
                    <div>
                        <h4>Smart Verification</h4>
                        <p>Advanced user verification and validation</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Right Panel (Login Form) -->
        <div class="right-panel">
            <div class="logo">
                <i class="fas fa-lock"></i>
                <h2>SecureAuth</h2>
            </div>
            
            <div class="form-header">
                <h2>Sign In to Your Account</h2>
                <p>Enter your credentials to access the system</p>
            </div>
            
            <%-- Display messages from Servlet --%>
            <% if (request.getAttribute("message") != null) { %>
                <div class="message <%= request.getAttribute("messageType") %>">
                    <i class="fas <%= "success".equals(request.getAttribute("messageType")) ? "fa-check-circle" : "fa-exclamation-circle" %>"></i>
                    <%= request.getAttribute("message") %>
                </div>
            <% } %>
            
            <form action="RegisterLoginServlet" method="post">
                <input type="hidden" name="action" value="login">
                
                <div class="form-group">
                    <label for="username">Username or Email</label>
                    <div class="input-with-icon">
                        <i class="fas fa-user"></i>
                        <input type="text" 
                               id="username" 
                               name="username" 
                               class="form-control" 
                               placeholder="Enter your username" 
                               required
                               autofocus>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" 
                               id="password" 
                               name="password" 
                               class="form-control" 
                               placeholder="Enter your password" 
                               required>
                    </div>
                    <div class="forgot-password">
                        <a href="#">Forgot Password?</a>
                    </div>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-sign-in-alt"></i>
                    Sign In
                </button>
                
                <div class="divider">
                    <span>New to SecureAuth?</span>
                </div>
                
                <div class="register-link">
                    Don't have an account? <a href="register.jsp">Create Account</a>
                </div>
            </form>
            
            <div class="footer-text">
                <p>© 2024 SecureAuth. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
            </div>
        </div>
    </div>
    
    <script>
        
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('.form-control');
            
            inputs.forEach(input => {
                
                input.addEventListener('focus', function() {
                    this.parentElement.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    if (this.value === '') {
                        this.parentElement.parentElement.classList.remove('focused');
                    }
                });
                
                
                if (input.value !== '') {
                    input.parentElement.parentElement.classList.add('focused');
                }
            });
        });
    </script>
</body>
</html>