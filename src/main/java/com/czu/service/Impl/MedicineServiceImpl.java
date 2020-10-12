package com.czu.service.Impl;

import com.czu.dao.Impl.MedicineDaoImpl;
import com.czu.dao.MedicineDao;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.domain.SCM;
import com.czu.service.MedicineService;

import java.util.List;
import java.util.Map;

public class MedicineServiceImpl implements MedicineService {
    private MedicineDao mdao = new MedicineDaoImpl();
    @Override
    public List<Medicine> finAllMedicine() {
        return mdao.finAllMedicine();
    }

    @Override
    public PageBean<Medicine> findMedicineByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        PageBean<Medicine> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        int totalCount = mdao.findTotalCount(condition);
        pb.setTotalCount(totalCount);

        int start = (currentPage-1)*rows;
        List<Medicine> list = mdao.finByPage(start, rows,condition);
        pb.setList(list);

        int totalPage = (totalCount % rows) ==0 ? totalCount/rows : (totalCount/rows) +1;

        pb.setTotalPage(totalPage);

        return pb;
    }

    @Override
    public Integer findShopCartExist(SCM scm) {
        return mdao.findShopCartExist(scm);
    }

    @Override
    public void AddIntoShopcart(SCM scm) {
        mdao.AddIntoShopcart(scm);
    }

    @Override
    public void UpdateShopcart(SCM scm) {
        mdao.UpdateShopcart(scm);
    }
}
