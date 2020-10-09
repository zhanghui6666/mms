package com.czu.web;

import com.czu.domain.adminInfo;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;
import com.google.protobuf.Message;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/addAdminServlet")
public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String message;
        //获取要添加的管理员
        Map<String,String[]> map=request.getParameterMap();
        //封装对象
        adminInfo admininfo=new adminInfo();

        try {
            BeanUtils.populate(admininfo,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


        //调用service来判断并保存
        AdminService service=new AdminServiceImpl();
        List<adminInfo> adminInfos=service.findAllAdminInfo();
        int is=0;
        for (adminInfo aadmininfo :
                adminInfos) {
            if (aadmininfo.getAname().equals(admininfo.getAname())){
                is++;
            }
        }
        if (is>0){
            message="添加的是重复的，添加失败";
            request.getSession().setAttribute("message", message);
        }else {
            message="添加成功";
            request.getSession().setAttribute("message", message);
            service.addAdminInfo(admininfo);
        }

        //跳转到查找界面
        response.sendRedirect(request.getContextPath()+"/findAllAdminServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
