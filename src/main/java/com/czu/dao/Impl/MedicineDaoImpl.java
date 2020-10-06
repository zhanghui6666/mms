package com.czu.dao.Impl;

import com.czu.dao.MedicineDao;
import com.czu.domain.Medicine;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class MedicineDaoImpl implements MedicineDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<Medicine> finAllMedicine() {
        String sql = "select * from medicine";
        List<Medicine> medicines = template.query(sql, new BeanPropertyRowMapper<Medicine>(Medicine.class));
        return medicines;
    }
}
