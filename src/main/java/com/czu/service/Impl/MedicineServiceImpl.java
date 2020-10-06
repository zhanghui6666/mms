package com.czu.service.Impl;

import com.czu.dao.Impl.MedicineDaoImpl;
import com.czu.dao.MedicineDao;
import com.czu.domain.Medicine;
import com.czu.service.MedicineService;

import java.util.List;

public class MedicineServiceImpl implements MedicineService {
    private MedicineDao mdao = new MedicineDaoImpl();
    @Override
    public List<Medicine> finAllMedicine() {
        return mdao.finAllMedicine();
    }
}
