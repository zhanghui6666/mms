package com.czu.dao;

import com.czu.domain.Agency;
import com.czu.domain.ShopCart;

import java.util.List;
import java.util.Map;

public interface ShopCartDao {

    /**
     * 查询总记录数
     */
    int findTotalCount(String cno);

    /**
     * 分页条件查询每页记录
     * @param start
     * @param rows
     * @return
     */
    List<ShopCart> finByPage(int start, int rows,String cno);
}
