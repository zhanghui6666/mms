package com.czu.dao;

import com.czu.domain.Client;

public interface ClientDao {
    Client login(String cno,String cpassword);

    Integer regist(Client client);

    String Forget(String cno ,String spassword);

    Integer modifyPassword(String cno, String cpassword, String spassword,String ncpassword);

    String findIfRepeat(String cno);
}
