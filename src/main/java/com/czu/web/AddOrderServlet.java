package com.czu.web;

import com.czu.domain.Orders;
import com.czu.service.Impl.ShopCartServiceImpl;
import com.czu.service.ShopCartService;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/addOrderServlet")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cno = (String) session.getAttribute("cno");


        Orders orders = new Orders();
        String mno = request.getParameter("mno");
        String mname = request.getParameter("mname");
        String mefficacy = request.getParameter("mefficacy");
        String _mprice = request.getParameter("mprice");
        String _num = request.getParameter("num");
        String _totalprice = request.getParameter("totalprice");

        int mprice = Integer.parseInt(_mprice);
        int num = Integer.parseInt(_num);
        int totalprice = Integer.parseInt(_totalprice);

        orders.setCno(cno);
        orders.setMno(mno);
        orders.setMname(mname);
        orders.setMefficacy(mefficacy);
        orders.setMprice(mprice);
        orders.setNum(num);
        orders.setTotalprice(totalprice);

        ShopCartService shopCartService = new ShopCartServiceImpl();
        shopCartService.addOrder(orders);




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
