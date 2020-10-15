package com.czu.dao;

import com.czu.domain.AdminInfo;

import java.util.List;

public interface AdminDao {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<AdminInfo> findAllAdmin();
}
