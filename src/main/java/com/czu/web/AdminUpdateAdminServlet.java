package com.czu.web;

import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminUpdateAdminServlet")
public class AdminUpdateAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String aname = request.getParameter("aname");
        String apassword = request.getParameter("apassword");
        //调用方法修改密码
        AdminService adminService=new AdminServiceImpl();
        adminService.updateAdminInfo(aname,apassword);
        String updateAdminMessage="修改成功";
        request.getSession().setAttribute("updateAdminMessage", updateAdminMessage);
        //跳转到对应界面
        request.getRequestDispatcher("/findAllAdminServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
