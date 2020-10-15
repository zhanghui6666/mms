package com.czu.service.Impl;

import com.czu.dao.AgencyDao;
import com.czu.dao.Impl.AgencyDaoImpl;
import com.czu.domain.Agency;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.service.AgencyService;

import java.util.List;
import java.util.Map;

public class AgencyServiceImpl implements AgencyService {
    private AgencyDao adao = new AgencyDaoImpl();
    @Override
    public PageBean<Agency> findAgencyByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        PageBean<Agency> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        int totalCount = adao.findTotalCount(condition);
        pb.setTotalCount(totalCount);

        int start = (currentPage-1)*rows;
        List<Agency> list = adao.finByPage(start, rows,condition);
        pb.setList(list);

        int totalPage = (totalCount % rows) ==0 ? totalCount/rows : (totalCount/rows) +1;

        pb.setTotalPage(totalPage);

        return pb;
    }
}
