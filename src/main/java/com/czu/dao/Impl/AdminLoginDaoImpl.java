package com.czu.dao.Impl;

import com.czu.dao.AdminLoginDao;
import com.czu.domain.AdminLogin;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AdminLoginDaoImpl implements AdminLoginDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public AdminLogin Adlogin(String aname, String apassword) {
        try{
                String sql ="select * from admin where aname=? and apassword=? ";
                return template.queryForObject(sql,new BeanPropertyRowMapper<AdminLogin>(AdminLogin.class),aname,apassword);
        }catch (Exception e){
            return null;
        }
    }
}
