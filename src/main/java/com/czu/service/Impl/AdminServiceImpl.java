package com.czu.service.Impl;

import com.czu.dao.AdminDao;
import com.czu.dao.Impl.AdminDaoImpl;
import com.czu.domain.AdminUserInfo;
import com.czu.domain.AdminInfo;
import com.czu.service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao=new AdminDaoImpl();
    @Override
    public List<AdminInfo> findAllAdminInfo() {
        return adminDao.findAllAdmin();
    }

    @Override
    public void addAdminInfo(AdminInfo adminInfo) {
        adminDao.addAdmin(adminInfo);
    }

    @Override
    public void deleteAdminInfo(Integer aid) {
        adminDao.deleteAdmin(aid);
    }

    @Override
    public void updateAdminInfo(String aname, String password) {
        adminDao.updateAdmin(aname,password);
    }


    @Override
    public List<AdminUserInfo> findAllUser() {
       return adminDao.findAllUser();
    }

    @Override
    public void deleteUserInfo(String cno) {
        adminDao.deleteUser(cno);
    }

    @Override
    public AdminUserInfo selectOneUser(String cno) {
        return adminDao.selectOneUser(cno);
    }

    /**
     * 修改一个用户信息
     * @param adminUserInfo
     */
    @Override
    public void updateOneUser(AdminUserInfo adminUserInfo) {
        adminDao.updateUserInfo(adminUserInfo);
    }


}
