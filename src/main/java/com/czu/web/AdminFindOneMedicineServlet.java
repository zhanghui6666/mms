package com.czu.web;

import com.czu.domain.Medicine;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminFindOneMedicineServlet")
public class AdminFindOneMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String updateMedicineMessage="";
        //获取药品数据
        String mno=request.getParameter("mno");
        Integer themno= Integer.valueOf(mno);
        Medicine medicine=new Medicine();
        //查找并赋给medicine
        AdminService adminService=new AdminServiceImpl();
        medicine=adminService.findOneMedicine(themno);
        //将药放入request并传回界面
        request.setAttribute("medicine",medicine);
        request.getRequestDispatcher("/adminUpdateMedicine.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
