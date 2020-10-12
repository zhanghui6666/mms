package com.czu.web;

import com.czu.domain.AdminUserInfo;
import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/adminUpdateUserServlet")
public class AdminUpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String cno = request.getParameter("cno");
        String cpassword = request.getParameter("cpassword");
        String cname = request.getParameter("cname");
        String csex = request.getParameter("csex");
        String cage = request.getParameter("cage");
        String caddress = request.getParameter("caddress");
        String cphone = request.getParameter("cphone");
        String csymptom = request.getParameter("csymptom");
        String thedate = request.getParameter("cdate");
        String cremark = request.getParameter("cremark");
        AdminUserInfo adminUserInfo=new AdminUserInfo();
        adminUserInfo.setCno(cno);
        adminUserInfo.setCpassword(cpassword);
        adminUserInfo.setCname(cname);
        adminUserInfo.setCsex(csex);
        adminUserInfo.setCage(cage);
        adminUserInfo.setCaddress(caddress);
        adminUserInfo.setCphone(cphone);
        adminUserInfo.setCsymptom(csymptom);

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        Date cdate= null;
        try {
            cdate = sf.parse(thedate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        adminUserInfo.setCdate(cdate);
        adminUserInfo.setCremark(cremark);
        //2.调用service方法修改用户
        AdminService adminService=new AdminServiceImpl();
        adminService.updateOneUser(adminUserInfo);
//        response.sendRedirect("/findAllUserServlet");
        request.getRequestDispatcher("/findAllUserServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
