package com.czu.service.Impl;

import com.czu.dao.Impl.MedicineDaoImpl;
import com.czu.dao.MedicineDao;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.service.MedicineService;

import java.util.List;

public class MedicineServiceImpl implements MedicineService {
    private MedicineDao mdao = new MedicineDaoImpl();
    @Override
    public List<Medicine> finAllMedicine() {
        return mdao.finAllMedicine();
    }

    @Override
    public PageBean<Medicine> findMedicineByPage(String _currentPage, String _rows) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        if (currentPage <= 0){
            currentPage = 1;
        }

        PageBean<Medicine> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        int totalCount = mdao.findTotalCount();
        pb.setTotalCount(totalCount);

        int start = (currentPage-1)*rows;
        List<Medicine> list = mdao.finByPage(start, rows);
        pb.setList(list);

        int totalPage = totalCount % rows ==0 ? totalCount/rows : totalCount/rows +1;

        pb.setTotalPage(totalPage);

        return pb;
    }
}
