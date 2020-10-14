package com.czu.web;

import com.czu.domain.Medicine;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/adminUpdateMedicineServlet")
public class AdminUpdateMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        Map<String,String[]> medicineMap=request.getParameterMap();
        //封装对象
        Medicine medicine=new Medicine();
        try {
            BeanUtils.populate(medicine,medicineMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        AdminService adminService=new AdminServiceImpl();
        String updateMedicineMessage="修改成功";
        adminService.updateMedicine(medicine);
        request.getSession().setAttribute("updateMedicineMessage", updateMedicineMessage);
        //跳转到查找界面
        response.sendRedirect(request.getContextPath()+"/adminControlMedicineServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
