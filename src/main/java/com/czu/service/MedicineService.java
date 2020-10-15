package com.czu.service;

import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.domain.SCM;

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

    Integer findShopCartExist(SCM scm);

    void AddIntoShopcart(SCM scm);

    void UpdateShopcart(SCM scm);

    Integer findMedicineToalNum(String mno);

    void DecreaseMedicine(String mno);
}
