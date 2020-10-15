package com.czu.service;

import com.czu.domain.Client;

public interface ClientService {
    Client login(Client client);
    void Regist(Client client);
}
