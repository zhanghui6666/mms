package com.czu.service.Impl;

import com.czu.dao.AdminDao;
import com.czu.dao.Impl.AdminDaoImpl;
import com.czu.domain.AdminUserInfo;
import com.czu.domain.AdminInfo;
import com.czu.domain.Medicine;
import com.czu.domain.PageBean;
import com.czu.service.AdminService;

import java.util.List;
import java.util.Map;

public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao=new AdminDaoImpl();
    @Override
    public List<AdminInfo> findAllAdminInfo() {
        return adminDao.findAllAdmin();
    }

    @Override
    public void addAdminInfo(AdminInfo adminInfo) {
        adminDao.addAdmin(adminInfo);
    }

    @Override
    public void deleteAdminInfo(Integer aid) {
        adminDao.deleteAdmin(aid);
    }

    @Override
    public void updateAdminInfo(String aname, String password) {
        adminDao.updateAdmin(aname,password);
    }


    @Override
    public List<AdminUserInfo> findAllUser() {
       return adminDao.findAllUser();
    }

    @Override
    public void deleteUserInfo(String cno) {
        adminDao.deleteUser(cno);
    }

    @Override
    public AdminUserInfo selectOneUser(String cno) {
        return adminDao.selectOneUser(cno);
    }

    /**
     * 修改一个用户信息
     * @param adminUserInfo
     */
    @Override
    public void updateOneUser(AdminUserInfo adminUserInfo) {
        adminDao.updateUserInfo(adminUserInfo);
    }

    /**
     * 分页查询返回每页数据
     * @param CurrentPage
     * @param Rows
     * @param Condition
     * @return
     */
    @Override
    public PageBean<Medicine> findMedicineByPage(String CurrentPage, String Rows, Map<String, String[]> Condition) {
        //把页码和每页条数转化成int值
        int currentPage=Integer.parseInt(CurrentPage);
        int rows= Integer.parseInt(Rows);
        //把页码和每页条数传给页类
        PageBean<Medicine> pageBean=new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        //找到符合条件的药品个数
        int totalCount=adminDao.findMedicineCount(Condition);
        pageBean.setTotalCount(totalCount);

        //找到符合条件的本页的药品列表
        int startpage=(currentPage-1)*rows;
        List<Medicine> medicineList=adminDao.findMedcineByPage(startpage,rows,Condition);
        pageBean.setList(medicineList);

        //找到总页数
        int totalPage=(totalCount % rows) ==0 ? totalCount/rows : (totalCount/rows) +1;
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    /**
     * 调用删除来删除一个药
     * @param mno
     */
    @Override
    public void deleteOneMedicine(Integer mno) {
        adminDao.deleteOneMedicine(mno);
    }

    @Override
    public boolean searchMedicineMno(String mno) {
        return adminDao.searchMedicineMno(mno);
    }

    /**
     * 添加一个药品
     * @param medicine
     */
    @Override
    public void addMedicine(Medicine medicine) {
        adminDao.addMedicine(medicine);
    }

    @Override
    public Medicine findOneMedicine(Integer mno) {
        return adminDao.findOneMedicine(mno);
    }

    /**
     * 修改药品的信息
     * @param medicine
     */
    @Override
    public void updateMedicine(Medicine medicine) {
        adminDao.updateMedicine(medicine);
    }


}
