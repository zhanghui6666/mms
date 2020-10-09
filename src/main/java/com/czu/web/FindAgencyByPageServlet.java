package com.czu.web;

import com.czu.domain.Agency;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.service.AgencyService;
import com.czu.service.Impl.AgencyServiceImpl;
import com.czu.service.Impl.MedicineServiceImpl;
import com.czu.service.MedicineService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/FindAgencyByPageServlet")
public class FindAgencyByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示的条数

        if (currentPage ==null || "".equals(currentPage)){
            currentPage = "1";
        }
        if (rows ==null || "".equals(rows)){
            rows = "20";
        }
        //获取查询条件
        Map<String, String[]> condition = request.getParameterMap();

        AgencyService agencyService = new AgencyServiceImpl();
        PageBean<Agency> pb = agencyService.findAgencyByPage(currentPage, rows,condition);

        //System.out.println(pb);
        request.setAttribute("pb", pb);
        request.setAttribute("condition",condition);//将查询条件存入request

        request.getRequestDispatcher("/clientAgencyList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
