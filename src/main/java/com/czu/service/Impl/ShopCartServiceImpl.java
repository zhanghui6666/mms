package com.czu.service.Impl;

import com.czu.dao.Impl.ShopCartDaoImpl;
import com.czu.dao.ShopCartDao;
import com.czu.domain.PageBean;
import com.czu.domain.ShopCart;
import com.czu.service.ShopCartService;

import java.util.List;
import java.util.Map;

public class ShopCartServiceImpl implements ShopCartService {
    private ShopCartDao sdao = new ShopCartDaoImpl();

    @Override
    public PageBean<ShopCart> findShopCartByPage(String _currentPage, String _rows,String cno) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        PageBean<ShopCart> pb2 = new PageBean<>();
        pb2.setCurrentPage(currentPage);
        pb2.setRows(rows);

        int totalCount = sdao.findTotalCount(cno);
        pb2.setTotalCount(totalCount);

        int start = (currentPage-1)*rows;
        List<ShopCart> list = sdao.finByPage(start, rows,cno);
        pb2.setList(list);

        int totalPage = (totalCount % rows) ==0 ? totalCount/rows : (totalCount/rows) +1;

        pb2.setTotalPage(totalPage);

        return pb2;
    }
}
