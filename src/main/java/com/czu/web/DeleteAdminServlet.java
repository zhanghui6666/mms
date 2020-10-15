package com.czu.web;

import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String aid = request.getParameter("aid");//当前页码
        //2.调用service方法删除管理员
        AdminService adminService=new AdminServiceImpl();
        adminService.deleteAdminInfo(Integer.valueOf(aid));
        String deleteAdminMessage="删除成功";
        request.getSession().setAttribute("deleteAdminMessage", deleteAdminMessage);
        //跳转到查找界面
        response.sendRedirect(request.getContextPath()+"/findAllAdminServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
