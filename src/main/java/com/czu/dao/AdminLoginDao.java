package com.czu.dao;

import com.czu.domain.AdminLogin;

public interface AdminLoginDao {
    AdminLogin Adlogin(String aname, String apassword);
}
