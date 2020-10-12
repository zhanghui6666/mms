package com.czu.dao.Impl;

import com.czu.dao.MedicineDao;
import com.czu.domain.Medicine;
import com.czu.domain.SCM;
import com.czu.util.JDBCUtils;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class MedicineDaoImpl implements MedicineDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<Medicine> finAllMedicine() {
        String sql = "select * from medicine";
        List<Medicine> medicines = template.query(sql, new BeanPropertyRowMapper<Medicine>(Medicine.class));
        return medicines;
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        String sql = "select count(*) from medicine where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);

        //遍历
        Set<String> keyset = condition.keySet();
        ArrayList<Object> params = new ArrayList<>();
        for (String key : keyset) {
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];
            if (value != null && !"".equals(value)){
                sb.append(" and "+key+" like? ");
                params.add("%"+value+"%");//加条件的值
            }
        }

        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<Medicine> finByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from medicine where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);

        //遍历
        Set<String> keyset = condition.keySet();
        ArrayList<Object> params = new ArrayList<>();
        for (String key : keyset) {
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];
            if (value != null && !"".equals(value)){
                sb.append(" and "+key+" like? ");
                params.add("%"+value+"%");//加条件的值
            }
        }

        sb.append("limit ? , ? ");
        params.add(start);
        params.add(rows);
        return template.query(sb.toString(),new BeanPropertyRowMapper<Medicine>(Medicine.class),params.toArray());
    }

    @Override
    public void AddIntoShopcart(SCM scm) {
        String sql = "INSERT INTO shopcart(cno,mno,num) values(?,?,?)";
        template.update(sql,scm.getCno(),scm.getMno(),scm.getNum());
    }

    @Override
    public Integer findShopCartExist(SCM scm) {
        String sql = "select num from shopcart where cno = ? and mno = ? ";
        Integer num = null;
        try {
            num = template.queryForObject(sql, Integer.class, scm.getCno(), scm.getMno());
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
        return num;
    }

    @Override
    public void UpdateShopcart(SCM scm) {
        String sql = "update shopcart set num = ? where cno = ? and mno = ?";
        template.update(sql,scm.getNum(),scm.getCno(),scm.getMno());

    }
}
