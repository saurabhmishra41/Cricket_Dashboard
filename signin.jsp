<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signing in</title>
    <link rel="stylesheet" href="singin.css">
</head>
<body>
    <div class="container">
        <h2>Sign In</h2>
        <form action="signin.do" method="post">
        <div class="username">
            <label for="gmail">Enter email</label>
            <input type="text" placeholder="ex: saurabh@gmail.com" id="gmail" name="uemail">
        </div>

        <div class="password">
            <label for="pass">Enter password</label>
            <input type="password" id="pass" name="upass">
        </div>

        <% 
            String error = (String) request.getAttribute("errormsg"); 
             if ("Eerror".equals(error)) { 
        %>

             <div style="color: red;">Email doesn't exist</div>
        <%
            } else if ("Perror".equals(error)) { 
        %>
            <div style="color: red;">Incorrect password!</div>
            <a href="forget.do">Forget password</a>
        <% 
            } 
        %>   

        <button type="submit">submit</button>
        <p>Haven't account<a href="register.do">create account</a></p>
    </form>
    </div>
</body>
</html>