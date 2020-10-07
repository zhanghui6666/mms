package com.czu.web;

import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.service.Impl.MedicineServiceImpl;
import com.czu.service.MedicineService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findMedicineByPageServlet")
public class FindMedicineByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示的条数

        if (currentPage ==null || "".equals(currentPage)){
            currentPage = "1";
        }
        if (rows ==null || "".equals(rows)){
            rows = "50";
        }
        MedicineService medicineService = new MedicineServiceImpl();
        PageBean<Medicine> pb = medicineService.findMedicineByPage(currentPage, rows);

        System.out.println(pb);
        request.setAttribute("pb", pb);

        request.getRequestDispatcher("/medicineList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
