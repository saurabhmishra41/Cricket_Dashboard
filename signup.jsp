<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 450px;
            animation: slideIn 0.8s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .fullname, .email, .password {
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 15px 20px;
            padding-right: 50px; /* Space for password toggle button */
            border: 2px solid #e1e5e9;
            border-radius: 15px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
            color: #333;
        }

        .password-input-container {
            position: relative;
        }

        .password-input-container input[type="text"],
        .password-input-container input[type="password"] {
            width: 100%;
            padding-right: 50px;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #666;
            padding: 5px;
            border-radius: 50%;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .password-toggle:hover {
            background: rgba(102, 126, 234, 0.1);
            color: #667eea;
            transform: translateY(-50%) scale(1.1);
        }

        .password-toggle:active {
            transform: translateY(-50%) scale(0.95);
        }

        .eye-icon, .eye-off-icon {
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 20px rgba(102, 126, 234, 0.2);
            transform: translateY(-2px);
            background: white;
        }

        input[type="text"]:focus + label, input[type="password"]:focus + label {
            color: #667eea;
        }

        input::placeholder {
            color: #aaa;
            font-style: italic;
        }

        .g-recaptcha {
            display: flex;
            justify-content: center;
            margin: 20px 0;
            padding: 15px;
            background: rgba(240, 240, 240, 0.5);
            border-radius: 15px;
            border: 2px dashed #ddd;
            transition: all 0.3s ease;
        }

        .g-recaptcha:hover {
            border-color: #667eea;
            background: rgba(102, 126, 234, 0.05);
        }

        button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 18px 30px;
            border-radius: 15px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        button:hover::before {
            left: 100%;
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
        }

        button:active {
            transform: translateY(-1px);
        }

        p {
            text-align: center;
            color: #666;
            font-size: 0.95rem;
            margin-top: 20px;
        }

        p a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }

        p a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 50%;
            background: #667eea;
            transition: all 0.3s ease;
        }

        p a:hover::after {
            width: 100%;
            left: 0;
        }

        p a:hover {
            color: #764ba2;
        }

        /* Input animation effects */
        .fullname, .email, .password {
            position: relative;
            overflow: hidden;
        }

        .fullname::before, .email::before, .password::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            transition: left 0.5s ease;
            z-index: 1;
        }

        .fullname:hover::before, .email:hover::before, .password:hover::before {
            left: 100%;
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .container {
                padding: 30px 25px;
                margin: 10px;
            }

            h2 {
                font-size: 2rem;
            }

            input[type="text"], input[type="password"] {
                padding: 12px 16px;
            }

            button {
                padding: 15px 25px;
                font-size: 1rem;
            }
        }

        /* Loading animation for form submission */
        .container.loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .container.loading button {
            background: #ccc;
            cursor: not-allowed;
        }

        /* Success animation */
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .container.success {
            animation: pulse 0.6s ease-in-out;
            border: 2px solid #28a745;
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Register</h2>
        <form action="register.do" method="post">
            <div class="fullname">
                <label for="name"><i class="fas fa-user"></i> Name</label>
                <input type="text" placeholder="ex: Alex" id="name" name="uname">
            </div>

            <div class="email">
                <label for="name"><i class="fas fa-envelope"></i> Enter email</label>
                <input type="text" placeholder="ex: sm@gmail.com" id="email" name="uemail">
            </div>

            <div class="password">
                <label for="name"><i class="fas fa-lock"></i> Password</label>
                <div class="password-input-container">
                    <input type="password" id="pass" name="upass">
                    <button type="button" class="password-toggle" id="togglePassword">
                        <svg class="eye-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                            <circle cx="12" cy="12" r="3"></circle>
                        </svg>
                        <svg class="eye-off-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display: none;">
                            <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                            <line x1="1" y1="1" x2="23" y2="23"></line>
                        </svg>
                    </button>
                </div>
            </div>

            <div>
                <div class="g-recaptcha" data-sitekey="6LfGC44rAAAAABPdYbUqI9c5ns0sUAVf7Ng6Sn6D"></div>
            </div>

            <button><i class="fas fa-user-plus"></i> Create Account</button>
            <p>Alread have account <a href="signin.jsp">Login</a></p>
        </form>
    </div>

    <script>
        // Add smooth interactions
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input');
            const form = document.querySelector('form');
            const container = document.querySelector('.container');
            const togglePassword = document.getElementById('togglePassword');
            const passwordInput = document.getElementById('pass');
            const eyeIcon = document.querySelector('.eye-icon');
            const eyeOffIcon = document.querySelector('.eye-off-icon');

            // Password toggle functionality
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                // Toggle eye icons
                if (type === 'text') {
                    eyeIcon.style.display = 'none';
                    eyeOffIcon.style.display = 'block';
                } else {
                    eyeIcon.style.display = 'block';
                    eyeOffIcon.style.display = 'none';
                }
            });

            // Add focus/blur animations to inputs
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });

                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                });
            });

            // Add form submission loading state
            form.addEventListener('submit', function(e) {
                container.classList.add('loading');
                
                // Remove loading state after 3 seconds (adjust as needed)
                setTimeout(() => {
                    container.classList.remove('loading');
                }, 3000);
            });

            // Add typing animation to placeholders
            const placeholders = [
                { element: document.getElementById('name'), text: 'ex: Alex' },
                { element: document.getElementById('email'), text: 'ex: sm@gmail.com' },
                { element: document.getElementById('pass'), text: '••••••••' }
            ];

            placeholders.forEach(item => {
                let originalPlaceholder = item.text;
                
                item.element.addEventListener('focus', function() {
                    this.placeholder = '';
                });

                item.element.addEventListener('blur', function() {
                    if (this.value === '') {
                        this.placeholder = originalPlaceholder;
                    }
                });
            });
        });
    </script>
</body>

</html>