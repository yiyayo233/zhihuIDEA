package zhihu.service;

import zhihu.dao.SuperDao;
import zhihu.entity.SuperEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SuperService {
    SuperDao SuperDao = new SuperDao();
    public int addSuper(String tableName, String id1, String id2) {
        return SuperDao.addSuper(tableName, id1, id2);
    }

    public List<SuperEntity> selectSpper(String tableName){
        return SuperDao.selectSpper(tableName);
    }

    public List<SuperEntity> selectSpperby(String questionanswer, String id1, String id2) {
        return SuperDao.selectSpperby(questionanswer, id1, id2);
    }

    public List<SuperEntity> selectSpperDistinct(String tableName){
        return SuperDao.selectSpperDistinct(tableName);
    }

    public SuperEntity selectSpperItem(String tableName, String id1, String id2) {
        return SuperDao.selectSpperItem(tableName, id1, id2);

    }
    public List<SuperEntity> selectSpperDistinct2(String tableName){
        return SuperDao.selectSpperDistinct2(tableName);
    }
}