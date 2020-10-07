package com.czu.service;

import com.czu.domain.Medicine;
import com.czu.domain.PageBean;

import java.util.List;

public interface MedicineService {
    /**
     * 查询所有药品
     * @return
     */
    List<Medicine> finAllMedicine();

    /**
     * 分页查询
     * @param currentPage
     * @param rows
     * @return
     */
    PageBean<Medicine> findMedicineByPage(String currentPage, String rows);
}
