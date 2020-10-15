package com.czu.service;

import com.czu.domain.Medicine;
import com.czu.domain.Orders;
import com.czu.domain.PageBean;
import com.czu.domain.ShopCart;

import java.util.List;
import java.util.Map;

public interface ShopCartService {

    List<ShopCart> findShopCart(String cno);

    void deleteShopCart(String cno , String mno);

    void addOrder(Orders orders);

}
