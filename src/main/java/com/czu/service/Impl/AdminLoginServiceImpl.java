package com.czu.service.Impl;

import com.czu.dao.AdminLoginDao;
import com.czu.dao.Impl.AdminLoginDaoImpl;
import com.czu.domain.AdminLogin;
import com.czu.service.AdminLoginService;

public class AdminLoginServiceImpl implements AdminLoginService {
    private AdminLoginDao Adao = new AdminLoginDaoImpl();

    @Override
    public AdminLogin Adlogin(AdminLogin adminLogin) {
        return Adao.Adlogin(adminLogin.getAname(),adminLogin.getApassword());
    }
}
