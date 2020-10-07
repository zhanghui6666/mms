package com.czu.service.Impl;

import com.czu.dao.ClientDao;
import com.czu.dao.Impl.ClientDaoImpl;
import com.czu.domain.Client;
import com.czu.service.ClientService;

public class ClientServiceImpl implements ClientService {
    private ClientDao cdao= new ClientDaoImpl();
    @Override
    public Client login(Client client) {

        return cdao.login(client.getCno(),client.getCpassword());
    }
}
