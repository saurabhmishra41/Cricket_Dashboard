<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cricket Scorer Setup</title>
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
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 40% 40%, rgba(120, 200, 255, 0.3) 0%, transparent 50%);
            animation: backgroundShift 10s ease-in-out infinite alternate;
            pointer-events: none;
        }

        @keyframes backgroundShift {
            0% { 
                background: radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                            radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%);
            }
            100% { 
                background: radial-gradient(circle at 80% 20%, rgba(120, 200, 255, 0.3) 0%, transparent 50%),
                            radial-gradient(circle at 20% 80%, rgba(255, 200, 100, 0.3) 0%, transparent 50%);
            }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 40px;
            max-width: 500px;
            width: 100%;
            box-shadow: 
                0 20px 40px rgba(0, 0, 0, 0.1),
                0 0 0 1px rgba(255, 255, 255, 0.2),
                inset 0 1px 0 rgba(255, 255, 255, 0.9);
            position: relative;
            animation: containerSlideIn 0.8s cubic-bezier(0.34, 1.56, 0.64, 1);
            overflow: hidden;
        }

        @keyframes containerSlideIn {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            animation: containerShine 3s infinite;
        }

        @keyframes containerShine {
            0% { left: -100%; }
            50% { left: 100%; }
            100% { left: -100%; }
        }

        h2 {
            text-align: center;
            color: #2d3748;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 30px;
            position: relative;
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: titlePulse 2s ease-in-out infinite alternate;
        }

        @keyframes titlePulse {
            from { 
                transform: scale(1);
                filter: drop-shadow(0 2px 4px rgba(0,0,0,0.1));
            }
            to { 
                transform: scale(1.02);
                filter: drop-shadow(0 4px 8px rgba(0,0,0,0.15));
            }
        }

        h2::after {
            content: '\f432';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            right: -40px;
            top: 0;
            font-size: 2rem;
            animation: iconBounce 2s ease-in-out infinite;
            color: #8B4513;
        }

        @keyframes iconBounce {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-5px) rotate(10deg); }
        }

        label {
            display: block;
            margin: 20px 0 8px 0;
            color: #4a5568;
            font-weight: 600;
            font-size: 1.1rem;
            position: relative;
            animation: labelSlide 0.6s ease-out forwards;
            opacity: 0;
        }

        label:nth-of-type(1) { animation-delay: 0.1s; }
        label:nth-of-type(2) { animation-delay: 0.2s; }
        label:nth-of-type(3) { animation-delay: 0.3s; }
        label:nth-of-type(4) { animation-delay: 0.4s; }
        label:nth-of-type(5) { animation-delay: 0.5s; }

        @keyframes labelSlide {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        input[type="text"], 
        input[type="number"] {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 15px;
            font-size: 1rem;
            color: #2d3748;
            background: rgba(255, 255, 255, 0.9);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        input[type="text"]:focus, 
        input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 
                0 0 0 3px rgba(102, 126, 234, 0.1),
                inset 0 2px 4px rgba(0, 0, 0, 0.05),
                0 4px 12px rgba(102, 126, 234, 0.15);
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 1);
        }

        input[type="text"]:hover, 
        input[type="number"]:hover {
            border-color: #a0aec0;
            transform: translateY(-1px);
            box-shadow: 
                inset 0 2px 4px rgba(0, 0, 0, 0.05),
                0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin: 10px 0 20px 0;
            flex-wrap: wrap;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.8);
            padding: 12px 20px;
            border-radius: 25px;
            border: 2px solid #e2e8f0;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            margin: 0;
            font-weight: 500;
            position: relative;
            overflow: hidden;
            min-width: 120px;
            justify-content: center;
        }

        .radio-group label::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(102, 126, 234, 0.1), transparent);
            transition: left 0.6s;
        }

        .radio-group label:hover::before {
            left: 100%;
        }

        .radio-group label:hover {
            border-color: #667eea;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.2);
            background: rgba(255, 255, 255, 1);
        }

        .radio-group input[type="radio"] {
            margin-right: 10px;
            width: 18px;
            height: 18px;
            accent-color: #667eea;
            cursor: pointer;
        }

        .radio-group input[type="radio"]:checked + label,
        .radio-group label:has(input[type="radio"]:checked) {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border-color: #667eea;
            transform: translateY(-2px) scale(1.05);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        .button-link {
            display: block;
            width: 100%;
            padding: 18px;
            background: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            text-align: center;
            font-size: 1.3rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 30px;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            border: none;
            cursor: pointer;
        }

        .button-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }

        .button-link:hover::before {
            left: 100%;
        }

        .button-link:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
            background: linear-gradient(45deg, #5a67d8 0%, #6b46c1 100%);
        }

        .button-link:active {
            transform: translateY(-1px) scale(1.01);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.3);
        }

        /* Cricket themed decorations */
        .cricket-decoration {
            position: absolute;
            font-size: 20px;
            opacity: 0.1;
            animation: float 6s ease-in-out infinite;
            pointer-events: none;
            z-index: -1;
        }

        .cricket-decoration:nth-child(1) {
            top: 10%;
            left: 5%;
            animation-delay: 0s;
            color: #8B4513;
        }

        .cricket-decoration:nth-child(2) {
            top: 20%;
            right: 5%;
            animation-delay: 2s;
            color: #FFD700;
        }

        .cricket-decoration:nth-child(3) {
            bottom: 10%;
            left: 10%;
            animation-delay: 4s;
            color: #2F4F4F;
        }

        @keyframes float {
            0%, 100% { 
                transform: translateY(0px) rotate(0deg); 
            }
            50% { 
                transform: translateY(-10px) rotate(5deg); 
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 30px 25px;
                margin: 10px;
            }
            
            h2 {
                font-size: 2rem;
            }
            
            h2::after {
                right: -30px;
                font-size: 1.5rem;
            }
            
            .radio-group {
                flex-direction: column;
                gap: 10px;
            }
            
            .radio-group label {
                min-width: auto;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 25px 20px;
            }
            
            h2 {
                font-size: 1.8rem;
            }
            
            input[type="text"], 
            input[type="number"] {
                padding: 12px 15px;
            }
            
            .button-link {
                padding: 16px;
                font-size: 1.1rem;
            }
        }

        /* Loading animation for form elements */
        .container > * {
            animation: formElementFadeIn 0.6s ease-out forwards;
            opacity: 0;
        }

        .container > *:nth-child(1) { animation-delay: 0.1s; }
        .container > *:nth-child(2) { animation-delay: 0.2s; }
        .container > *:nth-child(3) { animation-delay: 0.3s; }
        .container > *:nth-child(4) { animation-delay: 0.4s; }
        .container > *:nth-child(5) { animation-delay: 0.5s; }
        .container > *:nth-child(6) { animation-delay: 0.6s; }
        .container > *:nth-child(7) { animation-delay: 0.7s; }
        .container > *:nth-child(8) { animation-delay: 0.8s; }
        .container > *:nth-child(9) { animation-delay: 0.9s; }
        .container > *:nth-child(10) { animation-delay: 1s; }

        @keyframes formElementFadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <!-- Cricket Decorations -->
    <div class="cricket-decoration"><i class="fas fa-baseball-bat-ball"></i></div>
    <div class="cricket-decoration"><i class="fas fa-trophy"></i></div>
    <div class="cricket-decoration"><i class="fas fa-baseball-ball"></i></div>

    <div class="container">
        <h2>Cricket Scorer</h2>

        <label>Host Team</label>
        <input type="text" placeholder="Enter Host Team Name" id="host"/>

        <label>Visitor Team</label>
        <input type="text" placeholder="Enter Visitor Team Name" id="visitor"/>

        <label>Toss Won By?</label>
        <div class="radio-group" id="toss">
            <label><input type="radio" name="toss" checked /> Host Team</label>
            <label><input type="radio" name="toss" /> Visitor Team</label>
        </div>

        <label>Opted To?</label>
        <div class="radio-group" id="elect">
            <label><input type="radio" name="opted" checked /> Bat</label>
            <label><input type="radio" name="opted" /> Bowl</label>
        </div>

        <label>Number of Overs</label>
        <input type="number" placeholder="Enter number of overs" id="over" min="1" max="50"/>

        <a href="index2.jsp" class="button-link" id="start"><i class="fas fa-rocket"></i> Start Match</a>
    </div>

    <script src="script.js"></script>

    <script>
        // Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Input field animations
            const inputs = document.querySelectorAll('input[type="text"], input[type="number"]');
            
            inputs.forEach(input => {
                // Add floating label effect
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    if (this.value === '') {
                        this.parentElement.classList.remove('focused');
                    }
                });

                // Add typing sound effect (visual)
                input.addEventListener('input', function() {
                    this.style.transform = 'scale(1.02)';
                    setTimeout(() => {
                        this.style.transform = 'scale(1)';
                    }, 100);
                });
            });

            // Radio button enhanced interactions
            const radioGroups = document.querySelectorAll('.radio-group');
            radioGroups.forEach(group => {
                const radios = group.querySelectorAll('input[type="radio"]');
                radios.forEach(radio => {
                    radio.addEventListener('change', function() {
                        // Add selection animation
                        const label = this.parentElement;
                        label.style.transform = 'scale(1.1)';
                        setTimeout(() => {
                            label.style.transform = '';
                        }, 200);
                    });
                });
            });

            // Start button enhancement
            const startButton = document.getElementById('start');
            startButton.addEventListener('click', function(e) {
                // Validate form before proceeding
                const hostTeam = document.getElementById('host').value.trim();
                const visitorTeam = document.getElementById('visitor').value.trim();
                const overs = document.getElementById('over').value;

                if (!hostTeam || !visitorTeam || !overs) {
                    e.preventDefault();
                    
                    // Shake animation for empty fields
                    const emptyFields = [];
                    if (!hostTeam) emptyFields.push(document.getElementById('host'));
                    if (!visitorTeam) emptyFields.push(document.getElementById('visitor'));
                    if (!overs) emptyFields.push(document.getElementById('over'));

                    emptyFields.forEach(field => {
                        field.style.animation = 'shake 0.5s ease-in-out';
                        field.style.borderColor = '#e53e3e';
                        setTimeout(() => {
                            field.style.animation = '';
                            field.style.borderColor = '';
                        }, 500);
                    });

                    // Show error message
                    const errorMsg = document.createElement('div');
                    errorMsg.textContent = 'Please fill all required fields!';
                    errorMsg.style.cssText = `
                        position: fixed;
                        top: 20px;
                        left: 50%;
                        transform: translateX(-50%);
                        background: #fed7d7;
                        color: #c53030;
                        padding: 15px 25px;
                        border-radius: 10px;
                        font-weight: 600;
                        z-index: 1000;
                        animation: slideDown 0.3s ease-out;
                    `;
                    document.body.appendChild(errorMsg);

                    setTimeout(() => {
                        errorMsg.remove();
                    }, 3000);
                } else {
                    // Success animation
                    this.innerHTML = '<i class="fas fa-check"></i> Loading Match...';
                    this.style.background = 'linear-gradient(45deg, #48bb78, #38a169)';
                }
            });

            // Add shake animation CSS
            const style = document.createElement('style');
            style.textContent = `
                @keyframes shake {
                    0%, 100% { transform: translateX(0); }
                    25% { transform: translateX(-5px); }
                    75% { transform: translateX(5px); }
                }
                @keyframes slideDown {
                    from { transform: translateX(-50%) translateY(-100%); }
                    to { transform: translateX(-50%) translateY(0); }
                }
            `;
            document.head.appendChild(style);
        });
    </script>
</body>
</html>