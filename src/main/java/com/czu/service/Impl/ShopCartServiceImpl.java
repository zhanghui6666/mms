package com.czu.service.Impl;

import com.czu.dao.Impl.ShopCartDaoImpl;
import com.czu.dao.ShopCartDao;
import com.czu.domain.Orders;
import com.czu.domain.PageBean;
import com.czu.domain.ShopCart;
import com.czu.service.ShopCartService;

import java.util.List;
import java.util.Map;

public class ShopCartServiceImpl implements ShopCartService {
    private ShopCartDao sdao = new ShopCartDaoImpl();


    @Override
    public List<ShopCart> findShopCart(String cno) {
        return  sdao.findShopCart(cno);
    }

    @Override
    public void deleteShopCart(String cno, String mno) {
        sdao.deleteShopCart(cno,mno);
    }

    @Override
    public void addOrder(Orders orders) {
        sdao.addOrder(orders);
    }
}
