package zhihu.service;

import zhihu.dao.BynamicDao;
import zhihu.entity.BynamicEntity;

import java.util.List;

public class BynamicService {
    BynamicDao BynamicDao = new BynamicDao();
    public List<BynamicEntity> selectPeople(String id){
        return BynamicDao.selectPeople(id);
    }

    public int addBynamic(String id,String userId,String byBynamicId,String bynamicTiem,String bynamicType, String authorId){
        return BynamicDao.addBynamic(id, userId, byBynamicId, bynamicTiem, bynamicType, authorId);
    }

    public int deleteBynamic(String userId,String byBynamicId,String bynamicType){
        return BynamicDao.deleteBynamic(userId, byBynamicId, bynamicType);
    }

    public List<BynamicEntity> selectBynamic(String userId,String byBynamicId,String bynamicType){
        return BynamicDao.selectBynamic(userId, byBynamicId, bynamicType);
    }

    public List<BynamicEntity> selectBynamicByAll(String id,String userId,String byBynamicId,String bynamicTiem,String bynamicType,String authorId){
        return BynamicDao.selectBynamicByAll(id, userId, byBynamicId, bynamicTiem, bynamicType, authorId);
    }

    public List<BynamicEntity> selectBynamicByTime(String id,String userId,String byBynamicId,String bynamicTiem,String bynamicType,String authorId) {
        return BynamicDao.selectBynamicByTime(id, userId, byBynamicId, bynamicTiem, bynamicType, authorId);
    }
}
