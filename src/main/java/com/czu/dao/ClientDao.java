package com.czu.dao;

import com.czu.domain.Client;

public interface ClientDao {
    Client login(String cno,String cpassword);

    void regist(Client client);
}
