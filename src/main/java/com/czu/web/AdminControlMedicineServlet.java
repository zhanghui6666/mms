package com.czu.web;

import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/adminControlMedicineServlet")
public class AdminControlMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码格式
        request.setCharacterEncoding("utf-8");
        //获取页面传过来的几个参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示的条数
        Map<String,String[]> condition = request.getParameterMap();
        if (currentPage ==null || "".equals(currentPage)){
            currentPage = "1";
        }
        if (rows ==null || "".equals(rows)){
            rows = "10";
        }
        //调用查找方法找出要显示的药品列表
        AdminService adminService=new AdminServiceImpl();
        PageBean<Medicine> medicinePageBean= adminService.findMedicineByPage(currentPage,rows,condition);

        //将查出来的药品页码表以及条件传回给页面并实现跳转
        request.setAttribute("medicinePageBean",medicinePageBean);
        request.setAttribute("condition",condition);

        request.getRequestDispatcher("/admincontrolmedicineList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
