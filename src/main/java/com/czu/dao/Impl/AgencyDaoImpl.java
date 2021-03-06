package com.czu.dao.Impl;

import com.czu.dao.AgencyDao;
import com.czu.domain.Agency;
import com.czu.domain.Medicine;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AgencyDaoImpl implements AgencyDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        String sql = "select count(*) from agency where 1 = 1 ";
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
    public List<Agency> finByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from agency where 1 = 1 ";
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
        return template.query(sb.toString(),new BeanPropertyRowMapper<Agency>(Agency.class),params.toArray());
    }
}
