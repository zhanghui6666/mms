package com.czu.web;

import com.czu.domain.Client;
import com.czu.domain.FeedBack;
import com.czu.service.ClientService;
import com.czu.service.Impl.ClientServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/feedbackServlet")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String ctext = request.getParameter("ctext");
        String cno = (String) request.getSession().getAttribute("cno");
        //System.out.println("cno"+cno);
        //System.out.println("ctext"+ctext);
        ClientService clientService = new ClientServiceImpl();
        Client client1 = clientService.findClient(cno);
        //System.out.println(client1);
        String cname = client1.getCname();
        FeedBack feedback = new FeedBack();
        feedback.setCno(cno);
        feedback.setCname(cname);
        feedback.setCtext(ctext);
        clientService.Insertfeedback(feedback);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
