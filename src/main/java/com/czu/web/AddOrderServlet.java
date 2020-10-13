package com.czu.web;

import com.czu.domain.Orders;
import com.czu.domain.ShopCart;
import com.czu.service.Impl.ShopCartServiceImpl;
import com.czu.service.ShopCartService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/addOrderServlet")
public class AddOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cno = (String) session.getAttribute("cno");
        String mno = request.getParameter("mno");
        System.out.println(cno);
        System.out.println(mno);
        ShopCartService shopCartService = new ShopCartServiceImpl();
        shopCartService.deleteShopCart(cno,mno);
        response.sendRedirect(request.getContextPath()+"/findShopCartByPageServlet");

       /* Map<String, String[]> map = request.getParameterMap();
        Orders orders = new Orders();
        try {
            BeanUtils.populate(orders,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(orders);
        List<ShopCart> shopcart = (List<ShopCart>) session.getAttribute("shopcart");
        System.out.println(shopcart);*/

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
