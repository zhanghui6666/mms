package com.czu.service;

import com.czu.domain.adminInfo;

import java.util.List;

public interface AdminService {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<adminInfo> findAllAdminInfo();
}
