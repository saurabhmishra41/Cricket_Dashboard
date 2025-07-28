<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Set New Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(-45deg, #667eea, #764ba2, #f093fb, #f5576c, #4facfe, #00f2fe);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            overflow-x: hidden;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .floating-elements {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .floating-element {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-element:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 15%;
            animation-delay: 0s;
        }

        .floating-element:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 70%;
            right: 10%;
            animation-delay: 2s;
        }

        .floating-element:nth-child(3) {
            width: 80px;
            height: 80px;
            bottom: 30%;
            left: 10%;
            animation-delay: 4s;
        }

        .floating-element:nth-child(4) {
            width: 120px;
            height: 120px;
            top: 10%;
            right: 25%;
            animation-delay: 1s;
        }

        .floating-element:nth-child(5) {
            width: 90px;
            height: 90px;
            bottom: 15%;
            right: 30%;
            animation-delay: 3s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.7;
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
                opacity: 1;
            }
        }

        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(25px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 50px;
            border-radius: 25px;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.3);
            text-align: center;
            position: relative;
            z-index: 2;
            animation: slideIn 1s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .header {
            margin-bottom: 40px;
        }

        .key-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            color: #4CAF50;
            text-shadow: 0 0 20px rgba(76, 175, 80, 0.5);
            animation: keyRotate 3s ease-in-out infinite;
        }

        @keyframes keyRotate {
            0%, 100% { transform: rotate(0deg); }
            25% { transform: rotate(-10deg); }
            75% { transform: rotate(10deg); }
        }

        .header h2 {
            font-size: 2.2rem;
            margin-bottom: 15px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            font-weight: 300;
            letter-spacing: 1px;
        }

        .header p {
            opacity: 0.9;
            font-size: 1rem;
            line-height: 1.5;
            color: rgba(255, 255, 255, 0.8);
        }

        .form-group {
            margin: 25px 0;
            position: relative;
            text-align: left;
        }

        .label {
            display: block;
            font-weight: 500;
            font-size: 1rem;
            margin-bottom: 8px;
            color: rgba(255, 255, 255, 0.9);
        }

        .input-container {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.6);
            font-size: 1.1rem;
            z-index: 3;
            transition: color 0.3s ease;
        }

        .password-input {
            width: 100%;
            padding: 18px 60px 18px 55px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-size: 1.1rem;
            outline: none;
            transition: all 0.4s ease;
            backdrop-filter: blur(10px);
        }

        .password-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .password-input:focus {
            border-color: #4CAF50;
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 25px rgba(76, 175, 80, 0.3);
            transform: translateY(-2px);
        }

        .password-input:focus + .input-icon {
            color: #4CAF50;
        }

        .toggle-password {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: rgba(255, 255, 255, 0.6);
            cursor: pointer;
            font-size: 1.1rem;
            transition: color 0.3s ease;
            z-index: 3;
        }

        .toggle-password:hover {
            color: #4CAF50;
        }

        .password-strength {
            margin-top: 10px;
            height: 4px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 2px;
            overflow: hidden;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .password-strength.visible {
            opacity: 1;
        }

        .strength-bar {
            height: 100%;
            width: 0%;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .strength-bar.weak {
            width: 25%;
            background: #ff5252;
        }

        .strength-bar.fair {
            width: 50%;
            background: #ff9800;
        }

        .strength-bar.good {
            width: 75%;
            background: #2196f3;
        }

        .strength-bar.strong {
            width: 100%;
            background: #4caf50;
        }

        .password-requirements {
            margin-top: 15px;
            text-align: left;
            font-size: 0.85rem;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .password-requirements.visible {
            opacity: 1;
        }

        .requirement {
            display: flex;
            align-items: center;
            margin: 5px 0;
            color: rgba(255, 255, 255, 0.7);
            transition: color 0.3s ease;
        }

        .requirement.valid {
            color: #4caf50;
        }

        .requirement i {
            margin-right: 8px;
            font-size: 0.8rem;
        }

        .update-btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(45deg, #4CAF50, #45a049);
            border: none;
            color: #fff;
            font-weight: bold;
            font-size: 1.2rem;
            border-radius: 15px;
            cursor: pointer;
            margin-top: 30px;
            transition: all 0.4s ease;
            box-shadow: 0 6px 20px rgba(76, 175, 80, 0.4);
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .update-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s ease;
        }

        .update-btn:hover::before {
            left: 100%;
        }

        .update-btn:hover {
            background: linear-gradient(45deg, #45a049, #388e3c);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(76, 175, 80, 0.5);
        }

        .update-btn:active {
            transform: translateY(-1px);
        }

        .update-btn:disabled {
            background: rgba(255, 255, 255, 0.3);
            color: rgba(255, 255, 255, 0.6);
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .status-message {
            margin-top: 20px;
            padding: 15px;
            border-radius: 12px;
            font-size: 0.95rem;
            display: none;
            animation: slideInMessage 0.3s ease;
        }

        @keyframes slideInMessage {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .status-message.error {
            background: rgba(244, 67, 54, 0.2);
            border: 1px solid rgba(244, 67, 54, 0.5);
            color: #ff5252;
        }

        .status-message.success {
            background: rgba(76, 175, 80, 0.2);
            border: 1px solid rgba(76, 175, 80, 0.5);
            color: #4caf50;
        }

        .loading-spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
            margin-right: 10px;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 30px 25px;
                margin: 20px;
            }
            
            .header h2 {
                font-size: 1.8rem;
            }
            
            .key-icon {
                font-size: 3rem;
            }
        }
    </style>
</head>
<body>
    <!-- Floating elements -->
    <div class="floating-elements">
        <div class="floating-element"></div>
        <div class="floating-element"></div>
        <div class="floating-element"></div>
        <div class="floating-element"></div>
        <div class="floating-element"></div>
    </div>

    <div class="container">
        <div class="header">
            <div class="key-icon">
                <i class="fas fa-key"></i>
            </div>
            <h2>Set New Password</h2>
            <p>Create a strong password to secure your account</p>
        </div>

        <form action="set_password.do" method="post" id="passwordForm">
            <div class="form-group">
                <label for="password" class="label">
                    <i class="fas fa-lock"></i> New Password
                </label>
                <div class="input-container">
                    <input 
                        type="password" 
                        name="password" 
                        id="password" 
                        class="password-input"
                        placeholder="Enter your new password"
                        required 
                        autocomplete="new-password"
                    />
                    <i class="fas fa-lock input-icon"></i>
                    <button type="button" class="toggle-password" data-target="password">
                        <i class="fas fa-eye"></i>
                    </button>
                </div>
                <div class="password-strength" id="passwordStrength">
                    <div class="strength-bar" id="strengthBar"></div>
                </div>
                <div class="password-requirements" id="passwordRequirements">
                    <div class="requirement" id="lengthReq">
                        <i class="fas fa-times"></i>
                        At least 8 characters
                    </div>
                    <div class="requirement" id="uppercaseReq">
                        <i class="fas fa-times"></i>
                        One uppercase letter
                    </div>
                    <div class="requirement" id="lowercaseReq">
                        <i class="fas fa-times"></i>
                        One lowercase letter
                    </div>
                    <div class="requirement" id="numberReq">
                        <i class="fas fa-times"></i>
                        One number
                    </div>
                    <div class="requirement" id="specialReq">
                        <i class="fas fa-times"></i>
                        One special character
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="confirmPassword" class="label">
                    <i class="fas fa-shield-alt"></i> Confirm Password
                </label>
                <div class="input-container">
                    <input 
                        type="password" 
                        name="confirmPassword" 
                        id="confirmPassword" 
                        class="password-input"
                        placeholder="Confirm your new password"
                        required 
                        autocomplete="new-password"
                    />
                    <i class="fas fa-shield-alt input-icon"></i>
                    <button type="button" class="toggle-password" data-target="confirmPassword">
                        <i class="fas fa-eye"></i>
                    </button>
                </div>
            </div>

            <button class="update-btn" type="submit" id="updateBtn">
                <div class="loading-spinner" id="spinner"></div>
                <i class="fas fa-check"></i> Update Password
            </button>
        </form>

        <div class="status-message" id="statusMessage"></div>
    </div>

    <script>
        const passwordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        const passwordForm = document.getElementById('passwordForm');
        const updateBtn = document.getElementById('updateBtn');
        const spinner = document.getElementById('spinner');
        const statusMessage = document.getElementById('statusMessage');
        const passwordStrength = document.getElementById('passwordStrength');
        const strengthBar = document.getElementById('strengthBar');
        const passwordRequirements = document.getElementById('passwordRequirements');

        // Password strength requirements
        const requirements = {
            length: { regex: /.{8,}/, element: document.getElementById('lengthReq') },
            uppercase: { regex: /[A-Z]/, element: document.getElementById('uppercaseReq') },
            lowercase: { regex: /[a-z]/, element: document.getElementById('lowercaseReq') },
            number: { regex: /\d/, element: document.getElementById('numberReq') },
            special: { regex: /[!@#$%^&*(),.?":{}|<>]/, element: document.getElementById('specialReq') }
        };

        // Toggle password visibility
        document.querySelectorAll('.toggle-password').forEach(button => {
            button.addEventListener('click', function() {
                const targetId = this.getAttribute('data-target');
                const targetInput = document.getElementById(targetId);
                const icon = this.querySelector('i');
                
                if (targetInput.type === 'password') {
                    targetInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    targetInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });
        });

        // Password strength checker
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            
            if (password.length > 0) {
                passwordStrength.classList.add('visible');
                passwordRequirements.classList.add('visible');
                
                let strength = 0;
                let validRequirements = 0;
                
                // Check each requirement
                Object.keys(requirements).forEach(key => {
                    const requirement = requirements[key];
                    const isValid = requirement.regex.test(password);
                    
                    if (isValid) {
                        requirement.element.classList.add('valid');
                        requirement.element.querySelector('i').classList.remove('fa-times');
                        requirement.element.querySelector('i').classList.add('fa-check');
                        validRequirements++;
                    } else {
                        requirement.element.classList.remove('valid');
                        requirement.element.querySelector('i').classList.remove('fa-check');
                        requirement.element.querySelector('i').classList.add('fa-times');
                    }
                });
                
                // Calculate strength
                strength = validRequirements;
                
                // Update strength bar
                strengthBar.className = 'strength-bar';
                if (strength >= 5) {
                    strengthBar.classList.add('strong');
                } else if (strength >= 4) {
                    strengthBar.classList.add('good');
                } else if (strength >= 2) {
                    strengthBar.classList.add('fair');
                } else if (strength >= 1) {
                    strengthBar.classList.add('weak');
                }
            } else {
                passwordStrength.classList.remove('visible');
                passwordRequirements.classList.remove('visible');
            }
        });

        // Real-time password confirmation validation
        confirmPasswordInput.addEventListener('input', function() {
            if (this.value && this.value !== passwordInput.value) {
                this.style.borderColor = '#ff5252';
                showMessage('Passwords do not match', 'error');
            } else {
                this.style.borderColor = 'rgba(255, 255, 255, 0.3)';
                hideMessage();
            }
        });

        // Form submission
        passwordForm.addEventListener('submit', function(e) {
            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            
            // Validate password strength
            let validRequirements = 0;
            Object.keys(requirements).forEach(key => {
                if (requirements[key].regex.test(password)) {
                    validRequirements++;
                }
            });
            
            if (validRequirements < 5) {
                e.preventDefault();
                showMessage('Please ensure your password meets all requirements', 'error');
                passwordInput.focus();
                return;
            }
            
            if (password !== confirmPassword) {
                e.preventDefault();
                showMessage('Passwords do not match', 'error');
                confirmPasswordInput.focus();
                return;
            }
            
            // Show loading state
            updateBtn.disabled = true;
            spinner.style.display = 'inline-block';
            updateBtn.innerHTML = '<div class="loading-spinner" style="display: inline-block;"></div> Updating...';
            
            showMessage('Updating your password...', 'success');
        });

        // Auto-focus password input
        passwordInput.focus();

        // Show status message
        function showMessage(message, type) {
            statusMessage.textContent = message;
            statusMessage.className = `status-message ${type}`;
            statusMessage.style.display = 'block';
        }

        // Hide status message
        function hideMessage() {
            statusMessage.style.display = 'none';
        }

        // Enhanced input effects
        document.querySelectorAll('.password-input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });

            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
    </script>
</body>
</html>