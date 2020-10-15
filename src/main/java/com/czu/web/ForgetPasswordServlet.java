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

@WebServlet("/forgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String cno = request.getParameter("cno");
        String spassword = request.getParameter("spassword");
        request.getSession().setAttribute("cno", cno);

        ClientService clientService = new ClientServiceImpl();
        String cpassword = clientService.Forget(cno,spassword);

        //request.getRequestDispatcher("/findPassword.jsp").forward(request,response);
      if (cpassword != null){
          request.getSession().setAttribute("cpassword", cpassword);
          response.getWriter().write("success");
      }else {
          response.getWriter().write("error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
