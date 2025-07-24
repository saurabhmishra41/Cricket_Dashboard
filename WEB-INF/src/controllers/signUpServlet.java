package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

import models.User;

@WebServlet("/register.do")
public class signUpServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.sendRedirect("signup.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String SECRET_KEY = "6LfGC44rAAAAAP6TEJRWGeAcFZvF-OU2U2UWBhXg";

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");

        String uri = "https://www.google.com/recaptcha/api/siteverify";

        String params = "secret=" + SECRET_KEY + "&response=" + gRecaptchaResponse;

        URL url = new URL(uri);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.connect();

        DataOutputStream dos = new DataOutputStream(connection.getOutputStream());

        dos.writeBytes(params);
        dos.flush();
        dos.close();

        InputStream is = connection.getInputStream();

        JsonReader jr = Json.createReader(is);

        JsonObject jo = jr.readObject();

        jr.close();

        boolean success = jo.getBoolean("success");

        if (success) {

            String name = request.getParameter("uname");
            String email = request.getParameter("uemail");
            String password = request.getParameter("upass");

            User user = new User(name, email, password);
            user.save();

            response.sendRedirect("signin.jsp");

        } else {
            response.getWriter().println("recaptcha failed. Try agian.");
        }

    }

}
