package com.czu.dao;

import com.czu.domain.Agency;
import com.czu.domain.Orders;
import com.czu.domain.ShopCart;

import java.util.List;
import java.util.Map;

public interface ShopCartDao {

    /**
     * 查询总记录数
     */
    int findTotalCount(String cno);


    List<ShopCart> findShopCart(String cno);

    void deleteShopCart(String cno, String mno);

    void addOrder(Orders orders);
}
