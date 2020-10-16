package com.czu.service;

import com.czu.domain.Client;

public interface ClientService {
    Client login(Client client);
    Integer Regist(Client client);
    String Forget(String cno ,String spassword);

    Integer modifyPassword(String cno, String cpassword, String spassword,String ncpassword);

    String findIfRepeat(String cno);
}
