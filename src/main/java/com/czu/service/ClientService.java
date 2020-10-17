package com.czu.service;

import com.czu.domain.Client;
import com.czu.domain.FeedBack;

public interface ClientService {
    Client login(Client client);
    Integer Regist(Client client);
    String Forget(String cno ,String spassword);

    Integer modifyPassword(String cno, String cpassword, String spassword,String ncpassword);

    String findIfRepeat(String cno);

    Client findClient(String cno);

    void Insertfeedback(FeedBack feedBack);
}
