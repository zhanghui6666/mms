package com.czu.web;

import com.czu.domain.Agency;
import com.czu.domain.PageBean;
import com.czu.domain.ShopCart;
import com.czu.service.AgencyService;
import com.czu.service.Impl.AgencyServiceImpl;
import com.czu.service.Impl.ShopCartServiceImpl;
import com.czu.service.ShopCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/findShopCartByPageServlet")
public class FindShopCartByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示的条数
        HttpSession session = request.getSession();
        String cno = (String) session.getAttribute("cno");



        ShopCartService shopCartService = new ShopCartServiceImpl();
        List<ShopCart> shopcart = shopCartService.findShopCart(cno);

        //System.out.println(pb2);
        session.setAttribute("shopcart", shopcart);

        request.getRequestDispatcher("/clientShopcart.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
