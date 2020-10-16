package com.czu.web;

import com.czu.dao.ClientDao;
import com.czu.domain.Client;
import com.czu.service.ClientService;
import com.czu.service.Impl.ClientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/clientLoginServlet")
public class ClientLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String cno = request.getParameter("cno");
        String cpassword = request.getParameter("cpassword");
        //验证码校验
        String verifycode = request.getParameter("verifycode");
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//确保验证码一次性

        Client client = new Client();
        client.setCno(cno);
        client.setCpassword(cpassword);
        ClientService clientService = new ClientServiceImpl();
        Client clientLogin = clientService.login(client);



        if (verifycode==null || verifycode.length()<=0 && clientLogin == null) {
            response.getWriter().write("error");
        }else if (!checkcode_server.equalsIgnoreCase(verifycode) && clientLogin == null){
            response.getWriter().write("all_error");
        }
        else if (!checkcode_server.equalsIgnoreCase(verifycode) && clientLogin != null) {
            response.getWriter().write("verifycode_error");
        } else if (checkcode_server.equalsIgnoreCase(verifycode) && clientLogin == null) {
            response.getWriter().write("login_error");
        } else if (checkcode_server.equalsIgnoreCase(verifycode) && clientLogin != null) {
            request.getSession().setAttribute("cno", cno);
            response.getWriter().write("login_success");
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
