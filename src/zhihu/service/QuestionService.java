package zhihu.service;

import zhihu.dao.QuestionDao;
import zhihu.entity.QuestionEntity;

import java.sql.SQLException;
import java.util.List;

public class QuestionService {
    QuestionDao QuestionDao = new QuestionDao();

    public int addQuestion(String id, String authorId, String questionTitle, String questionIntro, int approveNum, int browseNum, int followNum, String commentId, String publishTime){
        return QuestionDao.addQuestion(id, authorId, questionTitle, questionIntro, approveNum, browseNum, followNum, commentId, publishTime);
    }

    public List<QuestionEntity> selectQuestion(String id,String authorId){
        return QuestionDao.selectQuestion(id, authorId);
    }

    public QuestionEntity selectQuestionItem(String id){
        return QuestionDao.selectQuestionItem(id);
    }

    public int UpdateApproveNum(String Num,String id){
        return QuestionDao.UpdateApproveNum(Num, id);
    }

    public int updatebrowseNum(String questionId) {
        return QuestionDao.updatebrowseNum(questionId);
    }

}
