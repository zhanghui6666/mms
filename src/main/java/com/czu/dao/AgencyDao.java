package com.czu.dao;

import com.czu.domain.Agency;
import com.czu.domain.Medicine;

import java.util.List;
import java.util.Map;

public interface AgencyDao {
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
    List<Agency> finByPage(int start, int rows, Map<String, String[]> condition);

}
