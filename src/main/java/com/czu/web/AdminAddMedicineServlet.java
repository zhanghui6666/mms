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

@WebServlet("/adminAddMedicineServlet")
public class AdminAddMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String addMedicineMessage="";
        //获取药品数据
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
        //判断是否重复
        AdminService service=new AdminServiceImpl();
        if (service.searchMedicineMno(medicine.getMno())){
            addMedicineMessage="添加的是重复的，添加失败";
            request.getSession().setAttribute("addMedicineMessage", addMedicineMessage);

        }else {
            addMedicineMessage="添加成功";
            service.addMedicine(medicine);
            request.getSession().setAttribute("addMedicineMessage", addMedicineMessage);
        }
        //跳转到查找界面
        response.sendRedirect(request.getContextPath()+"/adminControlMedicineServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
