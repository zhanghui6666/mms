package com.czu.web;

import com.czu.service.Impl.ShopCartServiceImpl;
import com.czu.service.ShopCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/deleteShopcartServlet")
public class DeleteShopcartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ShopCartService shopCartService = new ShopCartServiceImpl();
        String cno = (String) session.getAttribute("cno");
        String _mnos = request.getParameter("mno");
        String[] mnos = _mnos.split(",");
        for (String mno : mnos) {
            //System.out.println(mno);
            shopCartService.deleteShopCart(cno,mno);
        }
        //request.getRequestDispatcher("/findShopCartByPageServlet").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
