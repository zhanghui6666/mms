package com.czu.dao.Impl;

import com.czu.dao.AdminDao;
import com.czu.domain.AdminInfo;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class AdminDaoImpl implements AdminDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<AdminInfo> findAllAdmin() {
        String sql="select * from admin";
        List<AdminInfo> AdminInfos =template.query(sql,new BeanPropertyRowMapper<AdminInfo>(AdminInfo.class));
        return AdminInfos;
    }
}
