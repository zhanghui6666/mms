package com.czu.web;

import com.czu.domain.AdminInfo;
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
        AdminInfo admininfo=new AdminInfo();

        try {
            BeanUtils.populate(admininfo,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //System.out.println(admininfo);
        //调用service来判断并保存
        AdminService service=new AdminServiceImpl();
        List<AdminInfo> adminInfos=service.findAllAdminInfo();
        int is=0;
        for (AdminInfo aadmininfo : adminInfos) {
            if (aadmininfo.getAname().equals(admininfo.getAname())){
                is++;
            }
        }
        //System.out.println(is);
        if (is>0){
            response.getWriter().write("error");
        }else {
            service.addAdminInfo(admininfo);
            response.getWriter().write("success");
        }

        //跳转到查找界面
        //response.sendRedirect(request.getContextPath()+"/findAllAdminServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
