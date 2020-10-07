package com.czu.dao.Impl;

import com.czu.dao.AdminDao;
import com.czu.domain.adminInfo;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AdminDaoImpl implements AdminDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<adminInfo> findAllAdmin() {
        String sql="select * from admin";
        List<adminInfo> adminInfos=template.query(sql,new BeanPropertyRowMapper<adminInfo>(adminInfo.class));
        return adminInfos;
    }
}
