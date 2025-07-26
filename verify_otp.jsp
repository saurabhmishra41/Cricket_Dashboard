<!-- verify_otp.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Verify OTP</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      font-family: Arial, sans-serif;
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      background: rgba(255,255,255,0.1);
      padding: 30px;
      border-radius: 12px;
      width: 320px;
      box-shadow: 0 0 10px rgba(0,0,0,0.5);
    }
    h2 {
      text-align: center;
    }
    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      border-radius: 6px;
      border: none;
    }
    button {
      margin-top: 20px;
      width: 100%;
      padding: 12px;
      background-color: #00d4ff;
      border: none;
      color: #000;
      font-weight: bold;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover {
      background-color: #00b0cc;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Verify OTP</h2>
    <form action="forget_password.do" method="post">
      <label for="otp">Enter 4-digit OTP:</label>
      <input type="text" name="otp" id="otp" maxlength="4" required />
      <button type="submit">Verify</button>
    </form>
  </div>
</body>
</html>
