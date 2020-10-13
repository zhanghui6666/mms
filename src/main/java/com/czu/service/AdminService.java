package com.czu.service;

import com.czu.domain.AdminUserInfo;
import com.czu.domain.AdminInfo;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface AdminService {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<AdminInfo> findAllAdminInfo();

    /**
     * 添加一个管理员
     * @param adminInfo
     */
    void addAdminInfo(AdminInfo adminInfo);

    /**
     * 删除一个管理员
     * @param aid
     */
    void deleteAdminInfo(Integer aid);

    /**
     * 修改一个管理员密码
     * @param aid
     */
    void updateAdminInfo(String aid,String password);

    /**
     * 查询所有的用户信息
     * @return
     */
    List<AdminUserInfo> findAllUser();

    /**
     * 根据用户名删除用户
     * @param cno
     */
    void deleteUserInfo(String cno);

    /**
     * 通过用户名查找指定用户
     * @param cno
     * @return
     */
    AdminUserInfo selectOneUser(String cno);

    /**
     * 修改一个用户的信息
     * @param adminUserInfo
     */
    void updateOneUser(AdminUserInfo adminUserInfo);

    /**
     * 分页查询药品
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Medicine> findMedicineByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 删除一个药品
     * @param mno
     */
    void deleteOneMedicine(Integer mno);
}
