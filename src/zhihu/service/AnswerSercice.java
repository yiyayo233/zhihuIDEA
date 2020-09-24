package zhihu.service;

import zhihu.dao.AnswerDao;
import zhihu.entity.AnswerEntity;

import java.util.List;

public class AnswerSercice {
    AnswerDao AnswerDao = new AnswerDao();
    public int addAnswer(String id, String authorId, int approveNum, int browseNum, String editTime, String commentId, String answerContent, String cover, String publishTime, int isFond){
        return AnswerDao.addAnswer(id, authorId, approveNum , browseNum,editTime, commentId, answerContent ,cover ,publishTime,isFond);
    }

    public List<AnswerEntity> selectAnswer(String id,String authorId){
        return AnswerDao.selectAnswer(id, authorId);
    }

    public AnswerEntity selectAnseerItem(String id){
        return AnswerDao.selectAnseerItem(id);
    }

    public int UpdateApproveNum(String Numder,String id){
        return AnswerDao.UpdateApproveNum(Numder, id);
    }
}

