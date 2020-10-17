package com.czu.service.Impl;

import com.czu.dao.ClientDao;
import com.czu.dao.Impl.ClientDaoImpl;
import com.czu.domain.Client;
import com.czu.domain.FeedBack;
import com.czu.service.ClientService;

public class ClientServiceImpl implements ClientService {
    private ClientDao cdao= new ClientDaoImpl();
    @Override
    public Client login(Client client) {

        return cdao.login(client.getCno(),client.getCpassword());
    }

    @Override
    public Integer Regist(Client client) {
        return cdao.regist(client);
    }

    @Override
    public String Forget(String cno ,String spassword) {
        return cdao.Forget(cno,spassword);
    }

    @Override
    public Integer modifyPassword(String cno, String cpassword, String spassword,String ncpassword) {
        return cdao.modifyPassword(cno,cpassword,spassword,ncpassword);
    }

    @Override
    public String findIfRepeat(String cno) {
        return cdao.findIfRepeat(cno);
    }

    @Override
    public Client findClient(String cno) {
        return cdao.findClient(cno);
    }

    @Override
    public void Insertfeedback(FeedBack feedBack) {
        cdao.Insertfeedback(feedBack);
    }
}
