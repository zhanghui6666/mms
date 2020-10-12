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
import java.io.IOException;


@WebServlet("/clientLoginServlet")
public class ClientLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cno = request.getParameter( "cno" );
        //获取用户填写的登录密码
        String cpassword = request.getParameter( "cpassword" );
        Client client = new Client();
        client.setCno(cno);
        client.setCpassword(cpassword);
        ClientService clientService = new ClientServiceImpl();
        Client clientLogin = clientService.login(client);
        System.out.println(clientLogin);
        if(clientLogin == null){
            request.getRequestDispatcher("/loginError.jsp").forward(request,response);
        }
        else {
            request.getRequestDispatcher("/homepage.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
