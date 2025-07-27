<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signing in</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .username, .password {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 15px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8f9fa;
            color: #333;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            background: #fff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.15);
        }

        input[type="text"]::placeholder {
            color: #adb5bd;
            font-style: italic;
        }

        a {
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
            display: inline-block;
            margin-bottom: 20px;
        }

        a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        button[type="submit"] {
            width: 100%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }

        button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
            background: linear-gradient(135deg, #5a6fd8, #6a42a0);
        }

        button[type="submit"]:active {
            transform: translateY(0);
        }

        p {
            text-align: center;
            color: #666;
            font-size: 14px;
        }

        p a {
            margin-left: 5px;
            font-weight: 500;
        }

        /* Error message styling */
        div[style*="color: red"] {
            background: linear-gradient(135deg, #ff6b6b, #ee5a52) !important;
            color: white !important;
            padding: 12px 15px;
            border-radius: 8px;
            margin: 15px 0;
            font-size: 14px;
            font-weight: 500;
            text-align: center;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }
            
            h2 {
                font-size: 24px;
            }
            
            input[type="text"], input[type="password"], button[type="submit"] {
                padding: 12px;
                font-size: 14px;
            }
        }

        /* Add subtle animations */
        .container {
            animation: fadeInUp 0.6s ease-out;
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

        /* Hover effects for form elements */
        .username, .password {
            transition: transform 0.2s ease;
        }

        .username:hover, .password:hover {
            transform: translateX(5px);
        }

        /* Enhanced focus states */
        input[type="text"]:focus, input[type="password"]:focus {
            animation: focusPulse 0.3s ease-out;
        }

        @keyframes focusPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.02); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Sign In</h2>
        <form action="signin.do" method="post">
        <div class="username">
            <label for="gmail"><i class="fas fa-envelope"></i> Enter email</label>
            <input type="text" placeholder="ex: saurabh@gmail.com" id="gmail" name="uemail">
        </div>

        <div class="password">
            <label for="pass"><i class="fas fa-lock"></i> Enter password</label>
            <input type="password" id="pass" name="upass">
        </div>

        <a href="forget_password.do">Forget password</a>
        

        <% 
            String error = (String) request.getAttribute("errormsg"); 
             if ("Eerror".equals(error)) { 
        %>

             <div style="color: red;">Email doesn't exist</div>
        <%
            } else if ("Perror".equals(error)) { 
        %>
            <div style="color: red;">Incorrect password!</div>
            
        <% 
            } 
        %>   

        <button type="submit"><i class="fas fa-sign-in-alt"></i> Submit</button>
        <p>Haven't account<a href="register.do">create account</a></p>
    </form>
    </div>
</body>
</html>