package com.czu.dao.Impl;

import com.czu.dao.ShopCartDao;
import com.czu.domain.Medicine;
import com.czu.domain.Orders;
import com.czu.domain.ShopCart;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ShopCartDaoImpl implements ShopCartDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int findTotalCount(String cno) {
        String sql = "select count(*) from shopcart where cno = ? ";
        return template.queryForObject(sql,Integer.class,cno);
    }

    @Override
    public List<ShopCart> findShopCart(String cno) {
        String sql = "SELECT m.mno,m.mname,m.mefficacy,m.mprice,s.num FROM shopcart s LEFT JOIN CLIENT c ON c.cno=s.cno LEFT JOIN medicine m ON m.mno = s.mno WHERE s.cno= ? ";
        return template.query(sql,new BeanPropertyRowMapper<ShopCart>(ShopCart.class),cno);
    }

    @Override
    public void deleteShopCart(String cno, String mno) {
        String sql = "delete from shopcart where cno = ? and mno = ? ";
        template.update(sql,cno,mno);
    }

    @Override
    public void addOrder(Orders orders) {
        String sql = "insert into orders values(null,?,?,?,?,?,?,?,?)";
        template.update(sql,orders.getCno(),orders.getMno(),orders.getMname(),orders.getMefficacy(),orders.getMprice(),orders.getNum(),orders.getTotalprice(),orders.getDate());
    }

    @Override
    public List<Orders> findAllOrders(String cno) {
        String sql = "select * from orders where cno = ?";
        List<Orders> orders = template.query(sql,new BeanPropertyRowMapper<Orders>(Orders.class),cno);
        return orders;
    }

    @Override
    public void deleteOrders(String cno, String oid) {
        String sql = "delete from orders where oid = ? and cno = ?";
        template.update(sql,oid,cno);
    }
}
