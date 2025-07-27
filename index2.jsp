<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                radial-gradient(circle at 20% 30%, rgba(255,255,255,0.1) 2px, transparent 2px),
                radial-gradient(circle at 80% 70%, rgba(255,255,255,0.1) 1px, transparent 1px),
                radial-gradient(circle at 40% 80%, rgba(255,255,255,0.05) 3px, transparent 3px);
            background-size: 100px 100px, 150px 150px, 200px 200px;
            animation: twinkle 3s infinite alternate;
        }

        @keyframes twinkle {
            0% { opacity: 0.3; }
            100% { opacity: 0.8; }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 
                0 20px 40px rgba(0,0,0,0.1),
                0 0 0 1px rgba(255,255,255,0.2);
            max-width: 450px;
            width: 100%;
            position: relative;
            z-index: 1;
            transform: translateY(0);
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        .container::before {
            content: '\f432';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 30px;
            background: linear-gradient(135deg, #ff6b6b, #feca57);
            padding: 15px;
            border-radius: 50%;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            color: #8B4513;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 600;
            margin-top: 10px;
            position: relative;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, #ff6b6b, #feca57);
            border-radius: 2px;
        }

        .Striker, .Non-Striker, .Opening-Bowler {
            margin-bottom: 25px;
            position: relative;
        }

        label {
            display: block;
            color: #34495e;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .Striker label::before {
            content: '\f0e7';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 8px;
            color: #FFD700;
        }

        .Non-Striker label::before {
            content: '\f70c';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 8px;
            color: #3498db;
        }

        .Opening-Bowler label::before {
            content: '\f140';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            margin-right: 8px;
            color: #e74c3c;
        }

        input[type="text"] {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            font-size: 16px;
            background: #ffffff;
            color: #2c3e50;
            transition: all 0.3s ease;
            outline: none;
            position: relative;
        }

        input[type="text"]:focus {
            border-color: #3498db;
            box-shadow: 
                0 0 0 4px rgba(52, 152, 219, 0.1),
                0 5px 15px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }

        input[type="text"]::placeholder {
            color: #95a5a6;
            font-style: italic;
        }

        #index2-btn {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 15px;
            position: relative;
            overflow: hidden;
        }

        #index2-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.6s ease;
        }

        #index2-btn:hover::before {
            left: 100%;
        }

        #index2-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
        }

        #index2-btn:active {
            transform: translateY(-1px);
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }
            
            h2 {
                font-size: 20px;
            }
            
            input[type="text"] {
                padding: 12px 15px;
                font-size: 14px;
            }
            
            #index2-btn {
                padding: 15px;
                font-size: 16px;
            }
        }

        /* Validation styles */
        .error {
            border-color: #e74c3c !important;
            box-shadow: 0 0 0 4px rgba(231, 76, 60, 0.1) !important;
            animation: shake 0.5s ease-in-out;
        }

        .error-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: block;
            opacity: 0;
            animation: fadeIn 0.3s ease forwards;
        }

        .success {
            border-color: #27ae60 !important;
            box-shadow: 0 0 0 4px rgba(39, 174, 96, 0.1) !important;
        }

        .loading {
            background: linear-gradient(135deg, #95a5a6 0%, #7f8c8d 100%) !important;
            cursor: not-allowed !important;
            position: relative;
        }

        .loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes spin {
            from { transform: translate(-50%, -50%) rotate(0deg); }
            to { transform: translate(-50%, -50%) rotate(360deg); }
        }

        /* Subtle animations */
        .container > * {
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
        }

        .container h2 { animation-delay: 0.1s; }
        .container .Striker { animation-delay: 0.2s; }
        .container .Non-Striker { animation-delay: 0.3s; }
        .container .Opening-Bowler { animation-delay: 0.4s; }
        .container #index2-btn { animation-delay: 0.5s; }

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
    </style>
</head>
<body>
    <div class="container">
        <h2>Select Opening Player</h2>
                  
        <div class="Striker">
        <label>Striker</label>
        <!-- <br><br> -->
        <input type="text" placeholder="Host Team" id="index2-striker" />
        </div>
             
        <div class="Non-Striker">
        <label>Non-Striker</label>
        <!-- <br><br> -->
        <input type="text" placeholder="Visitor Team" id="index2-nstriker"  />
        </div>
         
        <div class="Opening-Bowler">
            <label>Opening Bowler</label>
            <!-- <br> <br> -->
        <input type="text" placeholder="Visitor Team" id="index2-bowler"/>
        </div>
        <button id="index2-btn">Start match</button>
     </div>
         
    <script>
        let striker = document.querySelector("#index2-striker");
        let nstriker = document.querySelector("#index2-nstriker");
        let bowler = document.querySelector("#index2-bowler");
        const index2Btn = document.querySelector("#index2-btn");

        // Function to clear previous error states
        function clearErrors() {
            const inputs = [striker, nstriker, bowler];
            inputs.forEach(input => {
                input.classList.remove('error', 'success');
                const errorMsg = input.parentNode.querySelector('.error-message');
                if (errorMsg) {
                    errorMsg.remove();
                }
            });
        }

        // Function to show error for empty field
        function showError(input, message) {
            input.classList.add('error');
            
            // Create error message element
            const errorDiv = document.createElement('span');
            errorDiv.className = 'error-message';
            errorDiv.textContent = message;
            input.parentNode.appendChild(errorDiv);
            
            // Focus on first error field
            input.focus();
        }

        // Function to show success state
        function showSuccess(input) {
            input.classList.add('success');
        }

        // Function to validate all fields
        function validateFields() {
            clearErrors();
            let isValid = true;

            if (striker.value.trim() === "") {
                showError(striker, "Please enter striker name");
                isValid = false;
            } else {
                showSuccess(striker);
            }

            if (nstriker.value.trim() === "") {
                showError(nstriker, "Please enter non-striker name");
                isValid = false;
            } else {
                showSuccess(nstriker);
            }

            if (bowler.value.trim() === "") {
                showError(bowler, "Please enter bowler name");
                isValid = false;
            } else {
                showSuccess(bowler);
            }

            return isValid;
        }

        // Real-time validation on input
        [striker, nstriker, bowler].forEach(input => {
            input.addEventListener('input', function() {
                if (this.value.trim() !== "") {
                    this.classList.remove('error');
                    this.classList.add('success');
                    const errorMsg = this.parentNode.querySelector('.error-message');
                    if (errorMsg) {
                        errorMsg.remove();
                    }
                }
            });
        });

        // Enhanced button click handler
        index2Btn.addEventListener("click", () => {
            if (validateFields()) {
                // Show loading state
                index2Btn.classList.add('loading');
                index2Btn.textContent = '';
                index2Btn.disabled = true;

                // Store values in localStorage
                localStorage.setItem("index2-striker", striker.value.trim());
                localStorage.setItem("index2-bowler", bowler.value.trim());
                localStorage.setItem("index2-nstriker", nstriker.value.trim());
                
                // Simulate loading and redirect
                setTimeout(() => {
                    window.location.href = "dashboard.html";
                }, 1000);
            }
        });

        // Allow Enter key to submit form
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                index2Btn.click();
            }
        });
    </script>
</body>
</html>