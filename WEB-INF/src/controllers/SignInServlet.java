package controllers;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;



import models.User;

@WebServlet("/signin.do")
public class SignInServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
        {
            System.out.println("servlet is working");
            response.sendRedirect("signin.jsp");
        }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String email=request.getParameter("uemail");
        String password=request.getParameter("upass");

      User user=new User(email,password);
      Integer check=user.verify();
      if(check==1){
        request.setAttribute("errormsg", "Eerror");

        request.getRequestDispatcher("signin.jsp").forward(request, response);
        // response.sendRedirect("signin.do");
      }

      else if(check==2)
      {
        System.out.println("Incorrect password");
        request.setAttribute("errormsg", "Perror");
        request.getRequestDispatcher("signin.jsp").forward(request, response);
        // response.sendRedirect("signin.do");
      }

      else{
        System.out.println("successful");
        response.sendRedirect("Fronts.html");
      }


    }
}
