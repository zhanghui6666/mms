package com.czu.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminSendAdminServlet")
public class AdminSendAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String aname = request.getParameter("aname");
        String apassword = request.getParameter("apassword");
        //传递值
        request.setAttribute("updateAname",aname);
        request.setAttribute("updateApassword",apassword);
        //跳转页面
        request.getRequestDispatcher("/adminUpdateAdmin.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
