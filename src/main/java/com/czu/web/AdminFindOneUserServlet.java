package com.czu.web;

import com.czu.domain.AdminUserInfo;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminFindOneUserServlet")
public class AdminFindOneUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String cno = request.getParameter("cno");
        //查找用户
        AdminService adminService=new AdminServiceImpl();
        AdminUserInfo adminUserInfo=adminService.selectOneUser(cno);
        //返回到界面
        request.setAttribute("adminUserInfo",adminUserInfo);
        request.getRequestDispatcher("/adminChangeUserInfo.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
