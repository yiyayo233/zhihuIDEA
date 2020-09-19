package zhihu.service;

import zhihu.dao.BrowseDao;
import zhihu.entity.BrowseEntity;

import java.util.List;

public class BrowseService {
    BrowseDao BrowseDao = new BrowseDao();
    public int addBrowse(String id, String uId, String objectId, String browseTime, String objectType, String authorId){
        return BrowseDao.addBrowse(id, uId, objectId, browseTime, objectType, authorId);
    }

    public List<BrowseEntity> selectBrowse(String uId, String objectId, String objectType){
        return BrowseDao.selectBrowse(uId, objectId, objectType);
    }

    public List<BrowseEntity> selectBrowseByTime(String uId, String objectId, String browseTime, String objectType, String authorId){
        return BrowseDao.selectBrowseByTime(uId, objectId, browseTime, objectType, authorId);
    }
}
