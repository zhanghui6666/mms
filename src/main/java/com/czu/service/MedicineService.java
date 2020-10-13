package com.czu.service;

import com.czu.domain.Medicine;
import com.czu.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface MedicineService {
    /**
     * 查询所有药品
     * @return
     */
    List<Medicine> finAllMedicine();

    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Medicine> findMedicineByPage(String currentPage, String rows, Map<String, String[]> condition);
}
