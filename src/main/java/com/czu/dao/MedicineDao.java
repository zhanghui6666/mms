package com.czu.dao;

import com.czu.domain.Medicine;
import com.czu.domain.SCM;

import java.util.List;
import java.util.Map;

public interface MedicineDao {
    /**
     * 查询总药品
     * @return
     */
    List<Medicine> finAllMedicine();

    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);

    /**
     * 分页条件查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Medicine> finByPage(int start, int rows, Map<String, String[]> condition);

    void AddIntoShopcart(SCM scm);

    Integer findShopCartExist(SCM scm);

    void UpdateShopcart(SCM scm);
}
