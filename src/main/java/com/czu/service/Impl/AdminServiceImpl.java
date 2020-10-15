package com.czu.service.Impl;

import com.czu.dao.AdminDao;
import com.czu.dao.Impl.AdminDaoImpl;
import com.czu.domain.AdminInfo;
import com.czu.service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao=new AdminDaoImpl();
    @Override
    public List<AdminInfo> findAllAdminInfo() {
        return adminDao.findAllAdmin();
    }
}
