package com.czu.web;

import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDeleteChooseMedicineServlet")
public class AdminDeleteChooseMedicineServlet extends HttpServlet {
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("utf-8");
            //1.获取参数
            String mno = request.getParameter("mnos");//要删除的编号集合
            String[] mnos=mno.split(",");
            AdminService adminService=new AdminServiceImpl();
            for (int i=0;i< mnos.length;i++){
                adminService.deleteOneMedicine(Integer.valueOf(mnos[i]));
            }
            String deleteMedicineMessage="删除成功";
            request.getSession().setAttribute("deleteMedicineMessage", deleteMedicineMessage);
            //跳转到查找界面
            //response.sendRedirect(request.getContextPath()+"/adminControlMedicineServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
