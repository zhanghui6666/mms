package com.czu.web;

import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDeleteMedicineServlet")
public class AdminDeleteMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String mno = request.getParameter("mno");
        int themno= Integer.parseInt(mno);
        //2.调用service方法删除药品
        AdminService adminService=new AdminServiceImpl();
        adminService.deleteOneMedicine(themno);
        //跳转到对应界面
//        request.getRequestDispatcher("/adminControlMedicineServlet").forward(request,response);
        response.sendRedirect(request.getContextPath()+"/adminControlMedicineServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
