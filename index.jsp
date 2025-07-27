<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cricket Game</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
            background: #000;
        }

        /* Video Background */
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
            object-fit: cover;
            filter: brightness(0.4) contrast(1.2) saturate(1.1);
            opacity: 0.8;
        }

        /* Video overlay for better text readability */
        .video-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: rgba(0, 0, 0, 0.3);
            background: radial-gradient(ellipse at center, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0.5) 100%);
        }

        /* Animated Cricket Stadium Background */
        .stadium-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: linear-gradient(135deg, #1a472a 0%, #2d5a3d 25%, #0f3818 50%, #1a472a 75%, #2d5a3d 100%);
            background-size: 200% 200%;
            animation: stadiumShift 8s ease-in-out infinite;
        }

        @keyframes stadiumShift {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        /* Animated Cricket Ball */
        .cricket-ball {
            position: absolute;
            width: 50px;
            height: 50px;
            background: radial-gradient(circle at 30% 30%, #fff, #ddd, #8B4513);
            border-radius: 50%;
            box-shadow: 
                inset -10px -10px 20px rgba(0,0,0,0.3),
                0 0 20px rgba(255,255,255,0.2);
            animation: ballFly 6s linear infinite;
        }

        .cricket-ball::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 2px;
            background: #8B4513;
            transform: translateY(-1px);
        }

        .cricket-ball::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 2px;
            background: #8B4513;
            transform: translateY(1px);
        }

        @keyframes ballFly {
            0% { 
                transform: translate(-100px, 50vh) scale(0.5);
                opacity: 0;
            }
            10% { 
                opacity: 1;
                transform: translate(20vw, 20vh) scale(1) rotate(180deg);
            }
            50% { 
                transform: translate(50vw, 10vh) scale(1.2) rotate(540deg);
            }
            90% { 
                opacity: 1;
                transform: translate(80vw, 30vh) scale(0.8) rotate(900deg);
            }
            100% { 
                transform: translate(120vw, 60vh) scale(0.3) rotate(1080deg);
                opacity: 0;
            }
        }

        /* Floating Cricket Elements */
        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .floating-bat {
            position: absolute;
            font-size: 60px;
            top: 18%;
            left: 8%;
            opacity: 0.7;
            animation: batFloat 5s ease-in-out infinite;
            color: #8B4513;
        }

        .floating-wicket {
            position: absolute;
            font-size: 55px;
            top: 65%;
            right: 12%;
            opacity: 0.7;
            animation: wicketFloat 6s ease-in-out infinite;
            color: #2F4F4F;
        }

        .floating-trophy {
            position: absolute;
            font-size: 70px;
            top: 78%;
            left: 72%;
            opacity: 0.7;
            animation: trophyFloat 7s ease-in-out infinite;
            color: #FFD700;
        }

        @keyframes batFloat {
            0%, 100% { transform: translateY(0) rotate(-10deg); }
            50% { transform: translateY(-30px) rotate(15deg); }
        }

        @keyframes wicketFloat {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-25px) rotate(-10deg); }
        }

        @keyframes trophyFloat {
            0%, 100% { transform: translateY(0) scale(1); }
            50% { transform: translateY(-35px) scale(1.1) rotate(10deg); }
        }

        /* Light Rays Animation */
        .light-rays {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: conic-gradient(from 0deg, transparent, rgba(255,255,255,0.03), transparent, rgba(255,255,255,0.03), transparent);
            animation: rotateRays 20s linear infinite;
            pointer-events: none;
            z-index: 0;
        }

        @keyframes rotateRays {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .container {
            position: relative;
            width: 100%;
            max-width: 600px;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 10;
        }

        .main-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(25px);
            border-radius: 30px;
            padding: 50px 40px;
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.5),
                inset 0 1px 0 rgba(255, 255, 255, 0.3),
                0 0 100px rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            text-align: center;
            position: relative;
            overflow: hidden;
            animation: cardEntrance 1.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            transform-style: preserve-3d;
        }

        @keyframes cardEntrance {
            0% {
                opacity: 0;
                transform: perspective(1000px) rotateX(-30deg) translateY(100px) scale(0.8);
            }
            100% {
                opacity: 1;
                transform: perspective(1000px) rotateX(0deg) translateY(0px) scale(1);
            }
        }

        .main-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(45deg);
            animation: cardShine 4s infinite;
        }

        @keyframes cardShine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            50% { transform: translateX(100%) translateY(100%) rotate(45deg); }
            100% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
        }

        .logo-section {
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }

        .cricket-icon {
            font-size: 100px;
            margin-bottom: 20px;
            color: #8B4513;
            filter: drop-shadow(3px 3px 6px rgba(0, 0, 0, 0.5));
            animation: iconPulse 3s ease-in-out infinite;
            transform-origin: center;
        }

        @keyframes iconPulse {
            0%, 100% { 
                transform: scale(1) rotate(0deg); 
            }
            25% { 
                transform: scale(1.1) rotate(-5deg); 
            }
            50% { 
                transform: scale(1.15) rotate(0deg); 
            }
            75% { 
                transform: scale(1.05) rotate(5deg); 
            }
        }



        .title {
            font-size: 3rem;
            font-weight: bold;
            background: linear-gradient(45deg, #ffffff, #f0f0f0, #ffffff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 10px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.3);
            animation: titleGlow 2s ease-in-out infinite alternate;
            letter-spacing: 2px;
        }

        @keyframes titleGlow {
            from { 
                filter: drop-shadow(0 0 5px rgba(255, 255, 255, 0.5));
                transform: scale(1);
            }
            to { 
                filter: drop-shadow(0 0 20px rgba(255, 255, 255, 0.8));
                transform: scale(1.02);
            }
        }

        .subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.2rem;
            margin-bottom: 40px;
            opacity: 0.9;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
            animation: subtitleFade 3s ease-in-out infinite;
        }

        @keyframes subtitleFade {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }

        .buttons-container {
            display: flex;
            flex-direction: column;
            gap: 25px;
            align-items: center;
            position: relative;
            z-index: 2;
        }

        .game-button {
            display: inline-block;
            text-decoration: none;
            width: 280px;
            animation: buttonSlide 1s ease-out;
            animation-fill-mode: both;
        }

        .game-button:nth-child(1) { animation-delay: 0.5s; }
        .game-button:nth-child(2) { animation-delay: 0.7s; }

        @keyframes buttonSlide {
            from {
                opacity: 0;
                transform: translateX(-50px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .button {
            width: 100%;
            font-size: 1.4rem;
            font-weight: 700;
            padding: 18px 35px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
            overflow: hidden;
            background: linear-gradient(45deg, #1e3c72, #2a5298, #1e3c72);
            background-size: 200% 200%;
            color: white;
            box-shadow: 
                0 10px 25px rgba(30, 60, 114, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
        }

        .button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s;
        }

        .button:hover::before {
            left: 100%;
        }

        .button:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 
                0 15px 35px rgba(30, 60, 114, 0.5),
                0 0 50px rgba(255, 255, 255, 0.2);
            background-position: 100% 50%;
        }

        .button:active {
            transform: translateY(-2px) scale(1.02);
        }

        .button.guest {
            background: linear-gradient(45deg, #ff6b35, #f7931e, #ff6b35);
            background-size: 200% 200%;
            box-shadow: 
                0 10px 25px rgba(255, 107, 53, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
        }

        .button.guest:hover {
            box-shadow: 
                0 15px 35px rgba(255, 107, 53, 0.5),
                0 0 50px rgba(255, 165, 0, 0.3);
            background-position: 100% 50%;
        }

        /* Sparkle Animation */
        .sparkle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: white;
            border-radius: 50%;
            animation: sparkleFloat 3s linear infinite;
        }

        .sparkle:nth-child(1) { top: 10%; left: 20%; animation-delay: 0s; }
        .sparkle:nth-child(2) { top: 30%; right: 15%; animation-delay: 1s; }
        .sparkle:nth-child(3) { bottom: 20%; left: 30%; animation-delay: 2s; }
        .sparkle:nth-child(4) { bottom: 40%; right: 25%; animation-delay: 0.5s; }

        @keyframes sparkleFloat {
            0%, 100% { 
                opacity: 0; 
                transform: scale(0); 
            }
            50% { 
                opacity: 1; 
                transform: scale(1); 
            }
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .main-card {
                margin: 20px;
                padding: 40px 30px;
            }
            
            .title {
                font-size: 2.5rem;
            }
            
            .cricket-icon {
                font-size: 80px;
            }
            
            .game-button {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .main-card {
                padding: 30px 20px;
            }
            
            .title {
                font-size: 2rem;
            }
            
            .button {
                font-size: 1.2rem;
                padding: 16px 30px;
            }
        }
    </style>
</head>
<body>
    <!-- Video Background with multiple cricket video sources -->
    <video class="video-background" autoplay muted loop playsinline>
        <!-- Cricket Stadium Video -->
        <source src="https://cdn.pixabay.com/video/2019/06/25/25045-345231516_large.mp4" type="video/mp4">
        <!-- Cricket Match Video -->
        <source src="https://cdn.pixabay.com/video/2020/07/15/43726-439952946_large.mp4" type="video/mp4">
        <!-- Cricket Ground Video -->
        <source src="https://cdn.pixabay.com/video/2021/08/12/84942-588932644_large.mp4" type="video/mp4">
        <!-- Sports Background Video -->
        <source src="https://cdn.pixabay.com/video/2018/12/11/20139-307040435_large.mp4" type="video/mp4">
    </video>
    
    <!-- Animated Stadium Background -->
    <div class="stadium-bg"></div>
    
    <!-- Light Rays -->
    <div class="light-rays"></div>
    
    <!-- Floating Cricket Elements -->
    <div class="floating-elements">
        <div class="floating-bat"><i class="fas fa-baseball-bat-ball"></i></div>
        <div class="floating-wicket"><i class="fas fa-hockey-stick"></i></div>
        <div class="floating-trophy"><i class="fas fa-trophy"></i></div>
    </div>
    
    <!-- Flying Cricket Ball -->
    <div class="cricket-ball"></div>
    
    <div class="container">
        <div class="main-card">
            <!-- Sparkle Effects -->
            <div class="sparkle"></div>
            <div class="sparkle"></div>
            <div class="sparkle"></div>
            <div class="sparkle"></div>
            
            <div class="logo-section">
                <div class="cricket-icon"><i class="fas fa-baseball-bat-ball"></i></div>
                <h1 class="title">CRICKET GAME</h1>
                <p class="subtitle">Experience the ultimate cricket adventure</p>
            </div>
            
            <div class="buttons-container">
                <a href="signin.do" class="game-button">
                    <button class="button">Sign In</button>
                </a>
                <a href="Fronts.jsp" class="game-button">
                    <button class="button guest">Play as Guest</button>
                </a>
            </div>
        </div>
    </div>

    <script>
        // Enhanced Interactive Animations
        document.addEventListener('DOMContentLoaded', function() {
            // Create additional flying balls at random intervals
            function createFlyingBall() {
                const ball = document.createElement('div');
                ball.className = 'cricket-ball';
                ball.style.animationDelay = Math.random() * 3 + 's';
                ball.style.top = Math.random() * 50 + 25 + '%';
                document.body.appendChild(ball);
                
                setTimeout(() => {
                    ball.remove();
                }, 6000);
            }
            
            // Create new ball every 8 seconds
            setInterval(createFlyingBall, 8000);
            
            // Mouse trail effect
            let mouseTrail = [];
            document.addEventListener('mousemove', function(e) {
                mouseTrail.push({x: e.clientX, y: e.clientY, life: 20});
                
                if (mouseTrail.length > 5) {
                    mouseTrail.shift();
                }
                
                // Create sparkle at mouse position occasionally
                if (Math.random() < 0.1) {
                    createSparkle(e.clientX, e.clientY);
                }
            });
            
            function createSparkle(x, y) {
                const sparkle = document.createElement('div');
                sparkle.style.position = 'fixed';
                sparkle.style.left = x + 'px';
                sparkle.style.top = y + 'px';
                sparkle.style.width = '6px';
                sparkle.style.height = '6px';
                sparkle.style.background = '#fff';
                sparkle.style.borderRadius = '50%';
                sparkle.style.pointerEvents = 'none';
                sparkle.style.zIndex = '1000';
                sparkle.style.animation = 'sparkleFloat 1s linear forwards';
                document.body.appendChild(sparkle);
                
                setTimeout(() => sparkle.remove(), 1000);
            }
            
            // Button hover sound effect (visual feedback)
            const buttons = document.querySelectorAll('.button');
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.animation = 'none';
                    setTimeout(() => {
                        this.style.animation = '';
                    }, 10);
                });
            });
            
            // Dynamic background color based on time
            function updateBackgroundColor() {
                const hour = new Date().getHours();
                let gradient;
                
                if (hour >= 6 && hour < 12) {
                    // Morning
                    gradient = 'linear-gradient(135deg, #ff9a9e 0%, #fecfef 50%, #fecfef 100%)';
                } else if (hour >= 12 && hour < 18) {
                    // Afternoon  
                    gradient = 'linear-gradient(135deg, #a8edea 0%, #fed6e3 50%, #a8edea 100%)';
                } else if (hour >= 18 && hour < 21) {
                    // Evening
                    gradient = 'linear-gradient(135deg, #ff8a80 0%, #ffb74d 50%, #ff8a80 100%)';
                } else {
                    // Night
                    gradient = 'linear-gradient(135deg, #1a472a 0%, #2d5a3d 25%, #0f3818 50%, #1a472a 75%, #2d5a3d 100%)';
                }
                
                document.querySelector('.stadium-bg').style.background = gradient;
            }
            
            updateBackgroundColor();
            setInterval(updateBackgroundColor, 60000); // Update every minute
        });
    </script>
</body>
</html>