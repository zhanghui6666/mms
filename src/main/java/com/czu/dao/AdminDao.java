package com.czu.dao;

import com.czu.domain.AdminUserInfo;
import com.czu.domain.AdminInfo;
import com.czu.domain.FeedBack;
import com.czu.domain.Medicine;

import java.util.List;
import java.util.Map;

public interface AdminDao {
    /**
     * 查询所有的管理员信息
     * @return
     */
    List<AdminInfo> findAllAdmin();

    /**
     * 添加一个管理员
     */
    void addAdmin(AdminInfo adminInfo);

    /**
     * 删除一个管理员
     * @param aid 管理员id
     */
    void deleteAdmin(Integer aid);

    /**
     * 找到所有的用户信息
     * @return
     */
    List<AdminUserInfo> findAllUser();

    /**
     * 根据用户名删除一个用户
     * @param cno
     */
    void deleteUser(String cno);


    /**
     * 通过用户名查找一个用户
     * @param cno
     * @return
     */
    AdminUserInfo selectOneUser(String cno);

    /**
     * 修改一个用户信息
     * @param adminUserInfo
     */
    void updateUserInfo(AdminUserInfo adminUserInfo);


    /**
     * 修改一个管理员密码
     * @param aname
     * @param password
     */
    Integer updateAdmin(String aname, String password);

    /**
     * 查询符合条件的药品总条数
     * @param condition
     * @return
     */
    int findMedicineCount(Map<String, String[]> condition);

    /**
     * 找出当前页的药品内容
     * @param startpage
     * @param rows
     * @param condition
     * @return
     */
    List<Medicine> findMedcineByPage(int startpage, int rows, Map<String, String[]> condition);

    /**
     * 删除一个药品
     * @param mno
     */
    void deleteOneMedicine(Integer mno);

    /**
     * 查询药编号是否已经存在
     * @param mno
     * @return
     */
    boolean searchMedicineMno(String mno);

    /**
     * 添加一个药品
     * @param medicine
     */
    void addMedicine(Medicine medicine);

    /**
     * 查找一个药品
     * @param mno
     * @return
     */
    Medicine findOneMedicine(Integer mno);

    /**
     *
     * @param medicine
     */
    void updateMedicine(Medicine medicine);

    List<FeedBack> finAllFeedback();

    void deleteFeedbackInfo(String fid);
}
