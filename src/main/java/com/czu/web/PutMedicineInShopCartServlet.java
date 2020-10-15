package com.czu.web;

import com.czu.domain.SCM;
import com.czu.service.Impl.MedicineServiceImpl;
import com.czu.service.MedicineService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/putMedicineInShopCartServlet")
public class PutMedicineInShopCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String mno = request.getParameter("mno");
        HttpSession session = request.getSession();
        String cno = (String) session.getAttribute("cno");
        SCM scm = new SCM();
        scm.setCno(cno);
        scm.setMno(mno);
        MedicineService medicineService = new MedicineServiceImpl();
        Integer totalMedicineNum = medicineService.findMedicineToalNum(mno);
        if (totalMedicineNum-1 <0){
            response.getWriter().write("false");
            /*request.getSession().setAttribute("addMsg","库存不足，请通知管理员添加药品！");
            System.out.println("test111");*/
        }else{
            Integer num = medicineService.findShopCartExist(scm);
            if (num == null || num == 0){
                scm.setNum(1);
                medicineService.AddIntoShopcart(scm);
                medicineService.DecreaseMedicine(mno);
            }else {
                scm.setNum(num+1);
                medicineService.UpdateShopcart(scm);
                medicineService.DecreaseMedicine(mno);
            }
            response.sendRedirect(request.getContextPath()+"/findMedicineByPageServlet");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
