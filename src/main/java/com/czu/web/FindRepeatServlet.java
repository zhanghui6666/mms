package com.czu.web;

import com.czu.service.ClientService;
import com.czu.service.Impl.ClientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/findRepeatServlet")
public class FindRepeatServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String cno = request.getParameter("cno");
        ClientService clientService = new ClientServiceImpl();
        //异步提交验证cno是否重名
        String cnoflag = clientService.findIfRepeat(cno);
        //System.out.println(cnoflag);
        if (cno.equals(cnoflag)){
            response.getWriter().write("true");
        }else if (cnoflag == null){
            response.getWriter().write("false");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
