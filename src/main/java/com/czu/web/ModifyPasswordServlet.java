package com.czu.web;

import com.czu.domain.Client;
import com.czu.service.ClientService;
import com.czu.service.Impl.ClientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modifyPasswordServlet")
public class ModifyPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String cno = request.getParameter("cno");
        String cpassword = request.getParameter("cpassword");
        String spassword = request.getParameter("spassword");
        String ncpassword = request.getParameter("ncpassword");
        ClientService clientService = new ClientServiceImpl();
        //System.out.println(cno+","+cpassword+","+spassword+","+ncpassword+",");
        Integer match = clientService.modifyPassword(cno,cpassword,spassword,ncpassword);
        //System.out.println(match);
        if (match == 1){
            response.getWriter().write("success");
        }else {
            response.getWriter().write("error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
