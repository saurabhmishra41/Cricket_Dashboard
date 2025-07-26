package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import calculations.RandomNumbers;
import utils.EmailSending;

@WebServlet("/forget_password.do")
public class ForgetPasswordServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        response.sendRedirect("forgotPassword.html");

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String ch = request.getParameter("true");
        String nextPage = "forgotPassword.html";
        
        boolean flag=false;

        
        if("true".equals(ch)) {
            flag = true;
        }else{
            flag= false;
        }

        System.out.println("flag is: "+flag);

        if (flag) {
            String email = request.getParameter("email");
            int rNo = RandomNumbers.generate();

            HttpSession session = request.getSession();
            session.setAttribute("rNo", rNo);
            session.setMaxInactiveInterval(60);

            EmailSending.sendForgetPasswordEmail(email, rNo);
            response.sendRedirect("verify_otp.jsp");

            
            return;
        }

        else {
            HttpSession session = request.getSession();
            String otp = request.getParameter("otp");
            String rNo = session.getAttribute("rNo").toString();
            if (rNo.equals(otp)) {
                nextPage = "signin.jsp";
            }
        }

        response.sendRedirect(nextPage);

    }

}
