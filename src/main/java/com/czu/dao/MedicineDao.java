package com.czu.dao;

import com.czu.domain.Medicine;

import java.util.List;

public interface MedicineDao {
    /**
     * 查询总药品
     * @return
     */
    List<Medicine> finAllMedicine();

    /**
     * 查询总记录数
     * @return
     */
    int findTotalCount();

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @return
     */
    List<Medicine> finByPage(int start, int rows);
}
