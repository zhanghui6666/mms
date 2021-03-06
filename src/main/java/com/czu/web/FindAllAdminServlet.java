package com.czu.web;

import com.czu.domain.AdminInfo;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findAllAdminServlet")
public class FindAllAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService adminService=new AdminServiceImpl();
        List<AdminInfo> adminInfos=adminService.findAllAdminInfo();
        request.setAttribute("adminInfos",adminInfos);
        request.getRequestDispatcher("/admincontroladminList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
