package com.czu.service;

import com.czu.domain.Agency;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;

import java.util.Map;

public interface AgencyService {
    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Agency> findAgencyByPage(String currentPage, String rows, Map<String, String[]> condition);
}
