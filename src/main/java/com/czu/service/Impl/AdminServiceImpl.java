package com.czu.service.Impl;

import com.czu.dao.AdminDao;
import com.czu.dao.Impl.AdminDaoImpl;
import com.czu.dao.MedicineDao;
import com.czu.domain.adminInfo;
import com.czu.service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao=new AdminDaoImpl();
    @Override
    public List<adminInfo> findAllAdminInfo() {
        return adminDao.findAllAdmin();
    }

    @Override
    public void addAdminInfo(adminInfo adminInfo) {
        adminDao.addAdmin(adminInfo);
    }

    @Override
    public void deleteAdminInfo(Integer aid) {
        adminDao.deleteAdmin(aid);
    }


}
