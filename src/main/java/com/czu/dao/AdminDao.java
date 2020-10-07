package com.czu.dao;

import com.czu.domain.adminInfo;

import java.util.List;

public interface AdminDao {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<adminInfo> findAllAdmin();
}
