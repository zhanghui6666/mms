package com.czu.dao.Impl;

import com.czu.dao.ClientDao;
import com.czu.domain.Client;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class ClientDaoImpl implements ClientDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public Client login(String cno,String cpassword) {
        try{

            String sql="select * from client where cno = ? and cpassword = ?";
            return template.queryForObject(sql,new BeanPropertyRowMapper<Client>(Client.class),cno,cpassword);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
