package com.czu.web;

import com.czu.domain.Orders;
import com.czu.service.Impl.ShopCartServiceImpl;
import com.czu.service.ShopCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findAllOrdersServlet")
public class FindAllOrdersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String cno = (String) request.getSession().getAttribute("cno");
        //System.out.println(cno);
        ShopCartService shopCartService = new ShopCartServiceImpl();
        List<Orders> orders = shopCartService.findAllOrders(cno);
        request.getSession().setAttribute("orders",orders);
        //System.out.println(orders);
        request.getRequestDispatcher("/clientOrders.jsp").forward(request,response);



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
