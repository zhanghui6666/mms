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
import java.io.PrintWriter;


@WebServlet("/clientLoginServlet")
public class ClientLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cno = request.getParameter( "cno" );
        //获取用户填写的登录密码
        String cpassword = request.getParameter( "cpassword" );
        response.setContentType("text/html;charset=UTF-8");
        Client client = new Client();
        client.setCno(cno);
        client.setCpassword(cpassword);
        ClientService clientService = new ClientServiceImpl();
        Client clientLogin = clientService.login(client);
        System.out.println(clientLogin);
        PrintWriter out = response.getWriter();
        if(clientLogin == null){
            /*request.getRequestDispatcher("/loginError.jsp").forward(request,response);*/
            out.print("<script>alert('用户名或密码错误，登录失败');window.location.href='http://localhost:8080/mms/login.jsp'</script>");
        }
        else {
            /*request.getRequestDispatcher("/homepage.jsp").forward(request,response);*/
          /*  out.print("<script>alert('登陆成功!');window.location.href='http://localhost:8080/mms/homepage.jsp'</script>");*/
           out.print( "<head><script src='js/sweetalert-dev.js'></script>");
           out.print("<link rel='stylesheet' href='css/sweetalert.css'></head>");
           out.print("<script>swal('这是一条信息！', '很漂亮，不是吗？')</script>");
            out.print("<script>window.location.href='http://localhost:8080/mms/homepage.jsp'</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
