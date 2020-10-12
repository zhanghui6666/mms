package com.czu.service;

import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.domain.ShopCart;

import java.util.Map;

public interface ShopCartService {

    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<ShopCart> findShopCartByPage(String currentPage, String rows,String cno);

}
