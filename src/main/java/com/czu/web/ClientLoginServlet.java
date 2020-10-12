package com.czu.web;

import com.czu.dao.ClientDao;
import com.czu.domain.Client;
import com.czu.service.ClientService;
import com.czu.service.Impl.ClientServiceImpl;
import com.mysql.cj.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/clientLoginServlet")
public class ClientLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cno = request.getParameter( "cno" );
        HttpSession session = request.getSession();
        session.setAttribute("cno",cno);
        //获取用户填写的登录密码
        String cpassword = request.getParameter( "cpassword" );
        Client client = new Client();
        client.setCno(cno);
        client.setCpassword(cpassword);
        ClientService clientService = new ClientServiceImpl();
        Client clientLogin = clientService.login(client);
        if(clientLogin == null){
            request.getRequestDispatcher("/loginError.jsp").forward(request,response);
        }
        else {
            request.getRequestDispatcher("/clientHomepage.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
