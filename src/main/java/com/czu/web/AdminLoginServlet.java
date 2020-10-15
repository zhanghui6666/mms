package com.czu.web;

import com.czu.domain.AdminLogin;
import com.czu.service.AdminLoginService;
import com.czu.service.Impl.AdminLoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String aname = request.getParameter("aname");
        String apassword = request.getParameter("apassword");

        //验证码校验
        String verifycode = request.getParameter("verifycode");
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//确保验证码一次性

        AdminLogin adminLogin = new AdminLogin();
        adminLogin.setAname(aname);
        adminLogin.setApassword(apassword);
        AdminLoginService adminLoginService = new AdminLoginServiceImpl();
        AdminLogin adminlogin = adminLoginService.Adlogin(adminLogin);
        System.out.println(verifycode);
        System.out.println(adminlogin);

        if ("".equals(verifycode) || verifycode==null && adminlogin == null) {
            System.out.println("error");
            response.getWriter().write("error");
        }else if (!checkcode_server.equalsIgnoreCase(verifycode) && adminlogin == null){
            System.out.println("all_error");
            response.getWriter().write("all_error");
        }
        else if (!checkcode_server.equalsIgnoreCase(verifycode) && adminlogin != null) {
            System.out.println("verifycode_error");
            response.getWriter().write("verifycode_error");
        } else if (checkcode_server.equalsIgnoreCase(verifycode) && adminlogin == null) {
            System.out.println("login_error");
            response.getWriter().write("login_error");
        } else if (checkcode_server.equalsIgnoreCase(verifycode) && adminlogin != null) {
            System.out.println("login_success");
            request.getSession().setAttribute("aname", aname);
            response.getWriter().write("login_success");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
