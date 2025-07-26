package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import models.User;
import utils.AppUtil;
import utils.EmailSending;

@WebServlet("/register.do")
public class signUpServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.sendRedirect("signup.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
        
        boolean success=AppUtil.checkRecaptchaResponse(gRecaptchaResponse);
        

        if (success) {

            String name = request.getParameter("uname");
            String email = request.getParameter("uemail");
            String password = request.getParameter("upass");

            User user = new User(name, email, password);
            user.save();

            EmailSending.sendRegistrationEmail(email,name);

            response.sendRedirect("signin.jsp");

        } else {
            response.getWriter().println("recaptcha failed. Try agian.");
        }

    }

}
