package com.czu.dao.Impl;

import com.czu.dao.AdminDao;
import com.czu.domain.AdminUserInfo;
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
        List<AdminInfo> adminInfos=template.query(sql,new BeanPropertyRowMapper<AdminInfo>(AdminInfo.class));
        return adminInfos;
    }

    @Override
    public void addAdmin(AdminInfo admininfo) {
        String sql="insert into admin (aname,apassword) values (?,?)";
        template.update(sql,admininfo.getAname(),admininfo.getApassword());
    }

    @Override
    public void deleteAdmin(Integer aid) {
        String sql="delete from admin where aid=?";
        template.update(sql,aid);
    }

    @Override
    public List<AdminUserInfo> findAllUser() {
        String sql="select * from client";
        List<AdminUserInfo> adminUserInfos=template.query(sql,new BeanPropertyRowMapper<AdminUserInfo>(AdminUserInfo.class));
        return adminUserInfos;
    }

    @Override
    public void deleteUser(String cno) {
        String sql="delete from client where cno=?";
        template.update(sql,cno);
    }

    /**
     * 通过用户名查找一个用户
     * @param cno
     * @return
     */
    @Override
    public AdminUserInfo selectOneUser(String cno) {
        String sql="select * from client where cno=?";
        AdminUserInfo adminUserInfo=template.queryForObject(sql,new BeanPropertyRowMapper<AdminUserInfo>(AdminUserInfo.class),cno);
        return adminUserInfo;
    }

    @Override
    public void updateUserInfo(AdminUserInfo adminUserInfo) {
        String sql="update client set cpassword=?,cname=?,csex=?,cage=?,caddress=?,cphone=?,csymptom=?,cdate=?,cremark=? where cno=?";
        template.update(sql,adminUserInfo.getCpassword(),adminUserInfo.getCname(),adminUserInfo.getCsex(),adminUserInfo.getCage(),adminUserInfo.getCaddress(),adminUserInfo.getCphone(),adminUserInfo.getCsymptom(),adminUserInfo.getCdate(),adminUserInfo.getCremark(),adminUserInfo.getCno());

    }



    /**
     * 修改一个管理员密码
     * @param aname
     */
    public void updateAdmin(String aname, String password) {
        String sql="update admin set apassword=? where aname=?";
        template.update(sql,password,aname);
    }


}
