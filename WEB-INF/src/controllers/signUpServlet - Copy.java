package controllers;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;

import models.User;

@WebServlet("/register.do")
public class signUpServlet extends HttpServlet{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServerException{
        response.sendRedirect("signup.html");
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServerException{
        String name= request.getParameter("uname");
        String email=request.getParameter("uemail");
        String password=request.getParameter("upass");

        User user=new User(name, email, password);
        user.save();

        response.sendRedirect("signin.jsp");
    }
    
}
