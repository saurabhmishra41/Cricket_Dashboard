package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

@WebServlet("/set_password.do")
public class SetPasswordServlet extends HttpServlet{
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        String password = request.getParameter("password");
        String email = session.getAttribute("email").toString();

        User user = new User(email, password);
        user.updatePassword();

        response.sendRedirect("signin.jsp");
        


    }
}
