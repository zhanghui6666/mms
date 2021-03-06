package com.czu.web;

import com.czu.service.AdminService;
import com.czu.service.Impl.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDeleteChooseFeedbackServlet")
public class AdminDeleteChooseFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String fid = request.getParameter("fids");//要删除的编号集合
        String[] fids=fid.split(",");
        AdminService adminService=new AdminServiceImpl();
        for (int i=0;i< fids.length;i++){
            System.out.println(fids[i]);
            adminService.deleteFeedbackInfo(fids[i]);
        }
        String deleteFeedbackMessage="删除成功";
        request.getSession().setAttribute("deleteUserMessage", deleteFeedbackMessage);
        //跳转到查找界面
        response.sendRedirect(request.getContextPath()+"/adminFeedbackServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
