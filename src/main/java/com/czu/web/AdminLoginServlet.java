package com.czu.web;

import com.czu.domain.AdminLogin;
import com.czu.service.AdminLoginService;
import com.czu.service.Impl.AdminLoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String aname = request.getParameter("aname");
        String apassword = request.getParameter("apassword");
        AdminLogin adminLogin = new AdminLogin();
        adminLogin.setAname(aname);
        adminLogin.setApassword(apassword);
        AdminLoginService adminLoginService = new AdminLoginServiceImpl();
        AdminLogin adminlogin= adminLoginService.Adlogin(adminLogin);
        System.out.println(adminlogin);
        if(adminlogin == null){
            request.getRequestDispatcher("/loginError.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("/adminchoose.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
