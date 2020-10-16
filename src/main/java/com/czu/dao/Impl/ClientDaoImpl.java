package com.czu.dao.Impl;

import com.czu.dao.ClientDao;
import com.czu.domain.Client;
import com.czu.util.JDBCUtils;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class ClientDaoImpl implements ClientDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public Client login(String cno, String cpassword) {
        try {
            String sql = "select * from client where cno = ? and cpassword = ?";
            return template.queryForObject(sql, new BeanPropertyRowMapper<Client>(Client.class), cno, cpassword);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Integer regist(Client client) {
        try {
            String sql = "insert into client values(?,?,?,?,?,?,?,?,?,?,?,null)";
            Integer flag =  template.update(sql,client.getCno(),client.getCpassword(),client.getSpassword(),client.getCname(),client.getCsex(),client.getCage(),client.getCaddress(),client.getCphone()
                    ,client.getCsymptom(),client.getCdate(),client.getCremark());
            return flag;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public String Forget(String cno ,String spassword) {
        try{
            String sql = "select cpassword from client where cno = ? and spassword = ?";
            return  template.queryForObject(sql,String.class,cno,spassword);

        }catch (Exception e){
            return  null;
        }
    }

    @Override
    public Integer modifyPassword(String cno, String cpassword, String spassword,String ncpassword) {
        try {
            String sql = "update client set cpassword = ? where cno = ? and cpassword = ? and spassword = ?";
            Integer match = template.update(sql,ncpassword,cno,cpassword,spassword);
            return match;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public String findIfRepeat(String cno) {
        try {
            String sql = "select cno from client where cno = ?";
            return template.queryForObject(sql,String.class,cno);
        }catch (Exception e){
            return null;
        }
    }
}
