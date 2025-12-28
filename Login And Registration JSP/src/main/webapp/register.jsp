<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | SecureAuth</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
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
            color: #ffc8dd;
        }
        
        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
        }
        
        .logo i {
            font-size: 32px;
            margin-right: 10px;
            color: #f5576c;
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
        
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 25px;
        }
        
        .form-group {
            flex: 1;
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
            border-color: #f5576c;
            background: white;
            box-shadow: 0 0 0 3px rgba(245, 87, 108, 0.1);
        }
        
        .password-strength {
            margin-top: 8px;
            font-size: 12px;
            color: #666;
        }
        
        .strength-bar {
            height: 4px;
            background: #eee;
            border-radius: 2px;
            margin-top: 5px;
            overflow: hidden;
        }
        
        .strength-level {
            height: 100%;
            width: 0%;
            background: #f5576c;
            transition: width 0.3s, background 0.3s;
        }
        
        .password-requirements {
            margin-top: 10px;
            font-size: 12px;
            color: #666;
        }
        
        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }
        
        .requirement i {
            margin-right: 5px;
            font-size: 10px;
            color: #ccc;
        }
        
        .requirement.valid i {
            color: #28a745;
        }
        
        .btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #f5576c 0%, #f093fb 100%);
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
            background: linear-gradient(135deg, #e74c60 0%, #e083fb 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(245, 87, 108, 0.3);
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
        
        .login-link {
            text-align: center;
            margin-top: 25px;
            color: #666;
        }
        
        .login-link a {
            color: #f5576c;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        
        .login-link a:hover {
            color: #e74c60;
            text-decoration: underline;
        }
        
        .terms {
            margin-top: 20px;
            font-size: 12px;
            color: #666;
            text-align: center;
        }
        
        .terms a {
            color: #f5576c;
            text-decoration: none;
        }
        
        .footer-text {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #999;
        }
        
        .progress-indicator {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            position: relative;
        }
        
        .progress-indicator:before {
            content: '';
            position: absolute;
            top: 12px;
            left: 10%;
            right: 10%;
            height: 2px;
            background: #eee;
            z-index: 1;
        }
        
        .step {
            position: relative;
            z-index: 2;
            text-align: center;
        }
        
        .step-circle {
            width: 25px;
            height: 25px;
            background: #eee;
            border-radius: 50%;
            margin: 0 auto 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: bold;
            color: #999;
        }
        
        .step.active .step-circle {
            background: #f5576c;
            color: white;
        }
        
        .step-label {
            font-size: 12px;
            color: #999;
        }
        
        .step.active .step-label {
            color: #f5576c;
            font-weight: 600;
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
            
            .form-row {
                flex-direction: column;
                gap: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left Panel (Branding) -->
        <div class="left-panel">
            <div class="welcome-text">
                <h1>Join Our Community</h1>
                <p>Create your account to unlock premium features and start your journey with our secure authentication platform.</p>
            </div>
            
            <div class="features">
                <div class="feature">
                    <i class="fas fa-rocket"></i>
                    <div>
                        <h4>Quick Setup</h4>
                        <p>Get started in less than 2 minutes</p>
                    </div>
                </div>
                <div class="feature">
                    <i class="fas fa-users"></i>
                    <div>
                        <h4>Global Community</h4>
                        <p>Join thousands of satisfied users worldwide</p>
                    </div>
                </div>
                <div class="feature">
                    <i class="fas fa-headset"></i>
                    <div>
                        <h4>24/7 Support</h4>
                        <p>Round-the-clock customer assistance</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Right Panel (Registration Form) -->
        <div class="right-panel">
            <div class="logo">
                <i class="fas fa-user-plus"></i>
                <h2>Create Account</h2>
            </div>
            
            <div class="progress-indicator">
                <div class="step active">
                    <div class="step-circle">1</div>
                    <div class="step-label">Account</div>
                </div>
                <div class="step">
                    <div class="step-circle">2</div>
                    <div class="step-label">Profile</div>
                </div>
                <div class="step">
                    <div class="step-circle">3</div>
                    <div class="step-label">Complete</div>
                </div>
            </div>
            
            <div class="form-header">
                <h2>Create Your Account</h2>
                <p>Fill in your details to get started</p>
            </div>
            
            <%-- Display messages from Servlet --%>
            <% if (request.getAttribute("message") != null) { %>
                <div class="message <%= request.getAttribute("messageType") %>">
                    <i class="fas <%= "success".equals(request.getAttribute("messageType")) ? "fa-check-circle" : "fa-exclamation-circle" %>"></i>
                    <%= request.getAttribute("message") %>
                </div>
            <% } %>
            
            <form action="RegisterLoginServlet" method="post" id="registrationForm">
                <input type="hidden" name="action" value="register">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Username *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" 
                                   id="username" 
                                   name="username" 
                                   class="form-control" 
                                   placeholder="Choose a username" 
                                   required
                                   autofocus>
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" 
                                   id="password" 
                                   name="password" 
                                   class="form-control" 
                                   placeholder="Create a strong password" 
                                   required
                                   onkeyup="checkPasswordStrength()">
                        </div>
                        <div class="password-strength">
                            <span id="strength-text">Password strength: </span>
                            <div class="strength-bar">
                                <div class="strength-level" id="strength-bar"></div>
                            </div>
                        </div>
                        <div class="password-requirements" id="password-requirements">
                            <div class="requirement" id="req-length">
                                <i class="fas fa-circle"></i>
                                <span>At least 8 characters</span>
                            </div>
                            <div class="requirement" id="req-uppercase">
                                <i class="fas fa-circle"></i>
                                <span>One uppercase letter</span>
                            </div>
                            <div class="requirement" id="req-number">
                                <i class="fas fa-circle"></i>
                                <span>One number</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password *</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock"></i>
                            <input type="password" 
                                   id="confirmPassword" 
                                   name="confirmPassword" 
                                   class="form-control" 
                                   placeholder="Re-enter your password" 
                                   required
                                   onkeyup="checkPasswordMatch()">
                        </div>
                        <div id="password-match" style="margin-top: 8px; font-size: 12px; color: #666;"></div>
                    </div>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-user-plus"></i>
                    Create Account
                </button>
                
                <div class="divider">
                    <span>Already have an account?</span>
                </div>
                
                <div class="login-link">
                    Already registered? <a href="login.jsp">Sign In Here</a>
                </div>
                
                <div class="terms">
                    By creating an account, you agree to our <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
                </div>
            </form>
            
            <div class="footer-text">
                <p>© 2024 SecureAuth. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
            </div>
        </div>
    </div>
    
    <script>
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const strengthBar = document.getElementById('strength-bar');
            const strengthText = document.getElementById('strength-text');
            const requirements = {
                length: document.getElementById('req-length'),
                uppercase: document.getElementById('req-uppercase'),
                number: document.getElementById('req-number')
            };
            
            let strength = 0;
            let totalRequirements = 3;
            let metRequirements = 0;
            
            
            if (password.length >= 8) {
                strength += 33;
                requirements.length.classList.add('valid');
                requirements.length.querySelector('i').className = 'fas fa-check-circle';
                metRequirements++;
            } else {
                requirements.length.classList.remove('valid');
                requirements.length.querySelector('i').className = 'fas fa-circle';
            }
            
            
            if (/[A-Z]/.test(password)) {
                strength += 33;
                requirements.uppercase.classList.add('valid');
                requirements.uppercase.querySelector('i').className = 'fas fa-check-circle';
                metRequirements++;
            } else {
                requirements.uppercase.classList.remove('valid');
                requirements.uppercase.querySelector('i').className = 'fas fa-circle';
            }
            
            
            if (/[0-9]/.test(password)) {
                strength += 34;
                requirements.number.classList.add('valid');
                requirements.number.querySelector('i').className = 'fas fa-check-circle';
                metRequirements++;
            } else {
                requirements.number.classList.remove('valid');
                requirements.number.querySelector('i').className = 'fas fa-circle';
            }
            
            
            strengthBar.style.width = strength + '%';
            
            
            if (strength < 40) {
                strengthBar.style.background = '#f5576c';
                strengthText.textContent = 'Password strength: Weak';
            } else if (strength < 80) {
                strengthBar.style.background = '#ffc107';
                strengthText.textContent = 'Password strength: Medium';
            } else {
                strengthBar.style.background = '#28a745';
                strengthText.textContent = 'Password strength: Strong';
            }
        }
        
        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const matchElement = document.getElementById('password-match');
            
            if (confirmPassword === '') {
                matchElement.innerHTML = '';
                return;
            }
            
            if (password === confirmPassword) {
                matchElement.innerHTML = '<i class="fas fa-check-circle" style="color:#28a745; margin-right:5px;"></i>Passwords match';
                matchElement.style.color = '#28a745';
            } else {
                matchElement.innerHTML = '<i class="fas fa-exclamation-circle" style="color:#f5576c; margin-right:5px;"></i>Passwords do not match';
                matchElement.style.color = '#f5576c';
            }
        }
        
        
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match. Please check and try again.');
                return false;
            }
            
            if (password.length < 8) {
                e.preventDefault();
                alert('Password must be at least 8 characters long.');
                return false;
            }
            
            return true;
        });
        
      
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
            });
        });
    </script>
</body>
</html>