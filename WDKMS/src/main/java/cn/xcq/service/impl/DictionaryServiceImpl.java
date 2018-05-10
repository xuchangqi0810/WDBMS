package cn.xcq.service.impl;

import cn.xcq.dao.IDictionaryDAO;
import cn.xcq.entity.Dictionary;
import cn.xcq.entity.UserInfo;
import cn.xcq.service.IDictionaryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/18.
 */
@Service("dicService")
public class DictionaryServiceImpl implements IDictionaryService {
    @Resource(name = "IDictionaryDAO")
    private IDictionaryDAO iDictionaryDAO;

    public List<Dictionary> getDictionary() {
        return iDictionaryDAO.getDictionary();
    }

    //根据当前登录对象id获取其所有班级
    public List<Dictionary> getClassAll(int uid) {
        return iDictionaryDAO.getClassAll(uid);
    }

    //根据班级id获取其所有学员
    public List<UserInfo> getUserAll(int dicval) {
        return iDictionaryDAO.getUserAll(dicval);
    }

    //添加事物
    @Transactional
    public int addSign(Integer studentid, String gradeid, Integer attendanceid, Date attendancetime) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("studentid",studentid);
        map.put("gradeid",gradeid);
        map.put("attendanceid",attendanceid);
        map.put("attendancetime",attendancetime);

        return iDictionaryDAO.addSign(map);
    }

    //添加事物
    @Transactional
    public int ifattendance(int gradeid, String datetime) {
        return iDictionaryDAO.ifattendance(gradeid,datetime);
    }


    public IDictionaryDAO getiDictionaryDAO() {
        return iDictionaryDAO;
    }

    public void setiDictionaryDAO(IDictionaryDAO iDictionaryDAO) {
        this.iDictionaryDAO = iDictionaryDAO;
    }
}
