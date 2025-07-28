<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Verify OTP</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(-45deg, #667eea, #764ba2, #f093fb, #f5576c);
      background-size: 400% 400%;
      animation: gradientShift 15s ease infinite;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: 1;
    }

    .particle {
      position: absolute;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      animation: float 6s ease-in-out infinite;
    }

    @keyframes float {
      0%, 100% { transform: translateY(0px) rotate(0deg); opacity: 1; }
      50% { transform: translateY(-20px) rotate(180deg); opacity: 0.8; }
    }

    .container {
      background: rgba(255, 255, 255, 0.15);
      backdrop-filter: blur(20px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      padding: 40px;
      border-radius: 20px;
      width: 400px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
      text-align: center;
      position: relative;
      z-index: 2;
      animation: slideIn 0.8s ease-out;
    }

    @keyframes slideIn {
      from {
        opacity: 0;
        transform: translateY(50px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .header {
      margin-bottom: 30px;
    }

    .header h2 {
      font-size: 2rem;
      margin-bottom: 10px;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    .header p {
      opacity: 0.9;
      font-size: 0.95rem;
    }

    .countdown-container {
      margin: 30px 0;
      position: relative;
    }

    .countdown-circle {
      width: 120px;
      height: 120px;
      margin: 0 auto 20px;
      position: relative;
    }

    .countdown-circle svg {
      width: 100%;
      height: 100%;
      transform: rotate(-90deg);
    }

    .countdown-circle .bg-circle {
      fill: none;
      stroke: rgba(255, 255, 255, 0.2);
      stroke-width: 6;
    }

    .countdown-circle .progress-circle {
      fill: none;
      stroke: #00d4ff;
      stroke-width: 6;
      stroke-linecap: round;
      stroke-dasharray: 314;
      stroke-dashoffset: 0;
      transition: stroke-dashoffset 1s linear;
      filter: drop-shadow(0 0 8px #00d4ff);
    }

    .countdown-time {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      font-size: 1.8rem;
      font-weight: bold;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .countdown-label {
      font-size: 0.9rem;
      opacity: 0.8;
      margin-bottom: 20px;
    }

    .otp-form {
      margin-top: 30px;
    }

    .otp-inputs {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin: 20px 0;
    }

    .otp-input {
      width: 60px;
      height: 60px;
      text-align: center;
      font-size: 1.5rem;
      font-weight: bold;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 12px;
      background: rgba(255, 255, 255, 0.1);
      color: #fff;
      outline: none;
      transition: all 0.3s ease;
    }

    .otp-input:focus {
      border-color: #00d4ff;
      background: rgba(255, 255, 255, 0.2);
      box-shadow: 0 0 15px rgba(0, 212, 255, 0.4);
      transform: scale(1.05);
    }

    .verify-btn {
      width: 100%;
      padding: 15px;
      background: linear-gradient(45deg, #00d4ff, #0099cc);
      border: none;
      color: #000;
      font-weight: bold;
      font-size: 1.1rem;
      border-radius: 12px;
      cursor: pointer;
      margin-top: 25px;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 212, 255, 0.3);
    }

    .verify-btn:hover {
      background: linear-gradient(45deg, #0099cc, #0066aa);
      transform: translateY(-2px);
      box-shadow: 0 7px 20px rgba(0, 212, 255, 0.4);
    }

    .verify-btn:active {
      transform: translateY(0);
    }

    .verify-btn:disabled {
      background: rgba(255, 255, 255, 0.3);
      color: rgba(255, 255, 255, 0.6);
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }

    .resend-section {
      margin-top: 25px;
      padding-top: 20px;
      border-top: 1px solid rgba(255, 255, 255, 0.2);
    }

    .resend-btn {
      background: none;
      border: none;
      color: #00d4ff;
      text-decoration: underline;
      cursor: pointer;
      font-size: 0.95rem;
      transition: color 0.3s ease;
    }

    .resend-btn:hover {
      color: #fff;
    }

    .resend-btn:disabled {
      color: rgba(255, 255, 255, 0.5);
      cursor: not-allowed;
      text-decoration: none;
    }

    .status-message {
      margin-top: 15px;
      padding: 10px;
      border-radius: 8px;
      font-size: 0.9rem;
      display: none;
    }

    .status-message.error {
      background: rgba(245, 87, 108, 0.2);
      border: 1px solid rgba(245, 87, 108, 0.5);
      color: #ff6b8a;
    }

    .status-message.success {
      background: rgba(76, 175, 80, 0.2);
      border: 1px solid rgba(76, 175, 80, 0.5);
      color: #4caf50;
    }

    .expired-overlay {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.8);
      display: none;
      align-items: center;
      justify-content: center;
      border-radius: 20px;
      z-index: 10;
    }

    .expired-content {
      text-align: center;
      color: #ff6b8a;
    }

    .expired-content i {
      font-size: 3rem;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>
  <!-- Floating particles -->
  <div class="particles" id="particles"></div>

  <div class="container">
    <div class="header">
      <h2><i class="fas fa-shield-alt"></i> Verify OTP</h2>
      <p>Enter the 4-digit code sent to your device</p>
    </div>

    <div class="countdown-container">
      <div class="countdown-circle">
        <svg>
          <circle class="bg-circle" cx="60" cy="60" r="50"></circle>
          <circle class="progress-circle" cx="60" cy="60" r="50" id="progressCircle"></circle>
        </svg>
        <div class="countdown-time" id="countdownTime">02:00</div>
      </div>
      <div class="countdown-label">Time remaining to enter OTP</div>
    </div>

    <form class="otp-form" action="forget_password.do" method="post" id="otpForm">
      <div class="otp-inputs">
        <input type="text" class="otp-input" maxlength="1" id="otp1" />
        <input type="text" class="otp-input" maxlength="1" id="otp2" />
        <input type="text" class="otp-input" maxlength="1" id="otp3" />
        <input type="text" class="otp-input" maxlength="1" id="otp4" />
      </div>
      <input type="hidden" name="otp" id="hiddenOtp" />
      <button type="submit" class="verify-btn" id="verifyBtn">
        <i class="fas fa-check"></i> Verify OTP
      </button>
    </form>

    <div class="resend-section">
      <p>Didn't receive the code?</p>
      <button type="button" class="resend-btn" id="resendBtn" disabled>
        <i class="fas fa-redo"></i> Resend OTP
      </button>
    </div>

    <div class="status-message" id="statusMessage"></div>

    <div class="expired-overlay" id="expiredOverlay">
      <div class="expired-content">
        <i class="fas fa-clock"></i>
        <h3>OTP Expired</h3>
        <p>Please request a new OTP</p>
      </div>
    </div>
  </div>

  <script>
    // Create floating particles
    function createParticles() {
      const particlesContainer = document.getElementById('particles');
      for (let i = 0; i < 50; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.top = Math.random() * 100 + '%';
        particle.style.width = Math.random() * 10 + 5 + 'px';
        particle.style.height = particle.style.width;
        particle.style.animationDelay = Math.random() * 6 + 's';
        particle.style.animationDuration = (Math.random() * 3 + 3) + 's';
        particlesContainer.appendChild(particle);
      }
    }

    // Countdown timer
    let timeLeft = 120; // 2 minutes in seconds
    const countdownTime = document.getElementById('countdownTime');
    const progressCircle = document.getElementById('progressCircle');
    const expiredOverlay = document.getElementById('expiredOverlay');
    const resendBtn = document.getElementById('resendBtn');
    const verifyBtn = document.getElementById('verifyBtn');
    const circumference = 2 * Math.PI * 50; // radius = 50

    function updateCountdown() {
      const minutes = Math.floor(timeLeft / 60);
      const seconds = timeLeft % 60;
      countdownTime.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
      
      // Update progress circle
      const progress = (120 - timeLeft) / 120;
      const offset = circumference * progress;
      progressCircle.style.strokeDashoffset = offset;
      
      if (timeLeft <= 0) {
        clearInterval(countdownInterval);
        expiredOverlay.style.display = 'flex';
        verifyBtn.disabled = true;
        resendBtn.disabled = false;
        resendBtn.textContent = 'Resend OTP';
        showMessage('OTP has expired. Please request a new code.', 'error');
      } else if (timeLeft <= 30) {
        progressCircle.style.stroke = '#ff6b8a';
        countdownTime.style.color = '#ff6b8a';
      }
      
      timeLeft--;
    }

    // OTP input handling
    const otpInputs = document.querySelectorAll('.otp-input');
    const hiddenOtp = document.getElementById('hiddenOtp');

    otpInputs.forEach((input, index) => {
      input.addEventListener('input', (e) => {
        const value = e.target.value;
        if (value.length === 1 && index < otpInputs.length - 1) {
          otpInputs[index + 1].focus();
        }
        updateHiddenOtp();
      });

      input.addEventListener('keydown', (e) => {
        if (e.key === 'Backspace' && e.target.value === '' && index > 0) {
          otpInputs[index - 1].focus();
        }
      });

      input.addEventListener('paste', (e) => {
        e.preventDefault();
        const pastedData = e.clipboardData.getData('text').slice(0, 4);
        for (let i = 0; i < pastedData.length && i < otpInputs.length; i++) {
          otpInputs[i].value = pastedData[i];
        }
        updateHiddenOtp();
      });
    });

    function updateHiddenOtp() {
      const otp = Array.from(otpInputs).map(input => input.value).join('');
      hiddenOtp.value = otp;
    }

    // Form submission
    document.getElementById('otpForm').addEventListener('submit', (e) => {
      const otp = hiddenOtp.value;
      if (otp.length !== 4) {
        e.preventDefault();
        showMessage('Please enter a complete 4-digit OTP.', 'error');
        return;
      }
      if (timeLeft <= 0) {
        e.preventDefault();
        showMessage('OTP has expired. Please request a new code.', 'error');
        return;
      }
    });

    // Resend functionality
    resendBtn.addEventListener('click', () => {
      // Reset timer
      timeLeft = 120;
      expiredOverlay.style.display = 'none';
      verifyBtn.disabled = false;
      resendBtn.disabled = true;
      progressCircle.style.stroke = '#00d4ff';
      countdownTime.style.color = '#fff';
      
      // Clear OTP inputs
      otpInputs.forEach(input => input.value = '');
      otpInputs[0].focus();
      updateHiddenOtp();
      
      showMessage('New OTP sent successfully!', 'success');
      
      // Restart countdown
      countdownInterval = setInterval(updateCountdown, 1000);
    });

    // Show status messages
    function showMessage(message, type) {
      const statusMessage = document.getElementById('statusMessage');
      statusMessage.textContent = message;
      statusMessage.className = `status-message ${type}`;
      statusMessage.style.display = 'block';
      
      setTimeout(() => {
        statusMessage.style.display = 'none';
      }, 5000);
    }

    // Initialize
    createParticles();
    otpInputs[0].focus();
    const countdownInterval = setInterval(updateCountdown, 1000);
    updateCountdown(); // Initial call
  </script>
</body>
</html>