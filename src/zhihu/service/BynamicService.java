package zhihu.service;

import zhihu.dao.BynamicDao;
import zhihu.entity.BynamicEntity;

import java.util.List;

public class BynamicService {
    BynamicDao BynamicDao = new BynamicDao();
    public List<BynamicEntity> selectPeople(String id){
        return BynamicDao.selectPeople(id);
    }
}
