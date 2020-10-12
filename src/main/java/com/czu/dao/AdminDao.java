package com.czu.dao;

import com.czu.domain.AdminUserInfo;
import com.czu.domain.AdminInfo;

import java.util.List;

public interface AdminDao {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<AdminInfo> findAllAdmin();

    /**
     * 添加一个管理员
     */
    void addAdmin(AdminInfo adminInfo);

    /**
     * 删除一个管理员
     * @param aid 管理员id
     */
    void deleteAdmin(Integer aid);

    /**
     * 找到所有的用户信息
     * @return
     */
    List<AdminUserInfo> findAllUser();

    /**
     * 根据用户名删除一个用户
     * @param cno
     */
    void deleteUser(String cno);


    /**
     * 通过用户名查找一个用户
     * @param cno
     * @return
     */
    AdminUserInfo selectOneUser(String cno);

    /**
     * 修改一个用户信息
     * @param adminUserInfo
     */
    void updateUserInfo(AdminUserInfo adminUserInfo);


    /**
     * 修改一个管理员密码
     * @param aname
     * @param password
     */
    void updateAdmin(String aname, String password);
}
