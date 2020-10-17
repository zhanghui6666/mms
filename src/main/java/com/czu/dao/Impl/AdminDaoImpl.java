package com.czu.dao.Impl;

import com.czu.dao.AdminDao;
import com.czu.domain.AdminUserInfo;
import com.czu.domain.AdminInfo;
import com.czu.domain.FeedBack;
import com.czu.domain.Medicine;
import com.czu.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class AdminDaoImpl implements AdminDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<AdminInfo> findAllAdmin() {
        String sql="select * from admin";
        List<AdminInfo> adminInfos=template.query(sql,new BeanPropertyRowMapper<AdminInfo>(AdminInfo.class));
        return adminInfos;
    }

    @Override
    public void addAdmin(AdminInfo admininfo) {
        String sql="insert into admin (aname,apassword) values (?,?)";
        template.update(sql,admininfo.getAname(),admininfo.getApassword());
    }

    @Override
    public void deleteAdmin(Integer aid) {
        String sql="delete from admin where aid=?";
        template.update(sql,aid);
    }

    @Override
    public List<AdminUserInfo> findAllUser() {
        String sql="select * from client";
        List<AdminUserInfo> adminUserInfos=template.query(sql,new BeanPropertyRowMapper<AdminUserInfo>(AdminUserInfo.class));
        return adminUserInfos;
    }

    @Override
    public void deleteUser(String cno) {
        String sql="delete from client where cno=?";
        template.update(sql,cno);
    }

    /**
     * 通过用户名查找一个用户
     * @param cno
     * @return
     */
    @Override
    public AdminUserInfo selectOneUser(String cno) {
        String sql="select * from client where cno=?";
        AdminUserInfo adminUserInfo=template.queryForObject(sql,new BeanPropertyRowMapper<AdminUserInfo>(AdminUserInfo.class),cno);
        return adminUserInfo;
    }

    @Override
    public void updateUserInfo(AdminUserInfo adminUserInfo) {
        String sql="update client set cpassword=?,cname=?,csex=?,cage=?,caddress=?,cphone=?,csymptom=?,cdate=?,cremark=? where cno=?";
        template.update(sql,adminUserInfo.getCpassword(),adminUserInfo.getCname(),adminUserInfo.getCsex(),adminUserInfo.getCage(),adminUserInfo.getCaddress(),adminUserInfo.getCphone(),adminUserInfo.getCsymptom(),adminUserInfo.getCdate(),adminUserInfo.getCremark(),adminUserInfo.getCno());

    }



    /**
     * 修改一个管理员密码
     * @param aname
     */
    public void updateAdmin(String aname, String password) {
        String sql="update admin set apassword=? where aname=?";
        template.update(sql,password,aname);
    }

    /**
     * 查询符合条件的药品总条数
     * @param condition
     * @return
     */
    @Override
    public int findMedicineCount(Map<String, String[]> condition) {
        String sql="select count(*) from medicine where 1 = 1 ";
        StringBuilder stringBuilder=new StringBuilder(sql);

        //遍历所有的条件拼接到sql语句中
        Set<String> keyset = condition.keySet();
        List<Object> params=new ArrayList<>();
        for (String key:keyset){
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value=condition.get(key)[0];
            if(!(value==null||"".equals(value))){
                stringBuilder.append(" and "+key+" like? ");//拼接sql
                params.add("%"+value+"%");//加条件的值
            }
        }
        return template.queryForObject(stringBuilder.toString(),Integer.class,params.toArray());
    }

    /**
     * 找出当前页的药品内容
     * @param startpage
     * @param rows
     * @param condition
     * @return
     */
    @Override
    public List<Medicine> findMedcineByPage(int startpage, int rows, Map<String, String[]> condition) {
        String sql="select * from medicine where 1 = 1 ";
        StringBuilder stringBuilder=new StringBuilder(sql);

        //遍历所有的条件拼接到sql语句中
        //遍历所有的条件拼接到sql语句中
        Set<String> keyset = condition.keySet();
        List<Object> params=new ArrayList<>();
        for (String key:keyset){
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value=condition.get(key)[0];
            if(!(value==null||"".equals(value))){
                stringBuilder.append(" and "+key+" like? ");//拼接sql
                params.add("%"+value+"%");//加条件的值
            }
        }

        stringBuilder.append("limit ?,?");
        params.add(startpage);
        params.add(rows);

        return template.query(stringBuilder.toString(),new BeanPropertyRowMapper<Medicine>(Medicine.class),params.toArray());
    }

    /**
     * 删除一个药品
     * @param mno
     */
    @Override
    public void deleteOneMedicine(Integer mno) {
        String sql="delete from medicine where mno=?";
        template.update(sql,mno);
    }

    @Override
    public boolean searchMedicineMno(String mno) {
        String sql="select * from medicine where mno = ?";
        List<Medicine> medicineList=template.query(sql,new BeanPropertyRowMapper<Medicine>(Medicine.class),mno);
//        Medicine medicine=template.queryForObject(sql,new BeanPropertyRowMapper<Medicine>(Medicine.class),mno);
        if (medicineList.size()==0){
            return false;
        }
        return true;
    }

    /**
     * 添加一个药品
     * @param medicine
     */
    @Override
    public void addMedicine(Medicine medicine) {
        String sql="insert into medicine (mno,mname,mmode,mefficacy,mprice,mnumber) values (?,?,?,?,?,?)";
        template.update(sql,medicine.getMno(),medicine.getMname(),medicine.getMmode(),medicine.getMefficacy(),medicine.getMprice(),medicine.getMnumber());
    }

    /**
     * 查找一个药品
     * @param mno
     * @return
     */
    @Override
    public Medicine findOneMedicine(Integer mno) {
        String sql="select * from medicine where mno = ?";
        Medicine medicine=template.queryForObject(sql,new BeanPropertyRowMapper<>(Medicine.class),mno);
        return medicine;
    }

    /**
     * 修改一个药品信息
     * @param medicine
     */
    @Override
    public void updateMedicine(Medicine medicine) {
        String sql="update medicine set mname=?,mmode=?,mefficacy=?,mprice=?,mnumber=? where mno=?";
        template.update(sql,medicine.getMname(),medicine.getMmode(),medicine.getMefficacy(),medicine.getMprice(),medicine.getMnumber(),medicine.getMno());
    }

    @Override
    public List<FeedBack> finAllFeedback() {
        String sql = "select * from feedback";
        return template.query(sql,new BeanPropertyRowMapper<FeedBack>(FeedBack.class));
    }

    @Override
    public void deleteFeedbackInfo(String fid) {
        String sql="delete from feedback where fid=?";
        template.update(sql,fid);
    }


}
