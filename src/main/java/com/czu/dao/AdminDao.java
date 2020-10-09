package com.czu.dao;

import com.czu.domain.adminInfo;

import java.util.List;

public interface AdminDao {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<adminInfo> findAllAdmin();

    /**
     * 添加一个管理员
     */
    void addAdmin(adminInfo adminInfo);

    /**
     * 删除一个管理员
     * @param aid 管理员id
     */
    void deleteAdmin(Integer aid);
}
