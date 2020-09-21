package zhihu.service;

import zhihu.dao.CommentDao;
import zhihu.entity.CommentEntity;

import java.util.List;

public class CommentService {

    CommentDao CommentDao = new CommentDao();
    public List<CommentEntity> selectComment( String affiliationId) {
        return CommentDao.selectComment(affiliationId);
    }

    public CommentEntity selectCommentItem(String id) {
        return CommentDao.selectCommentItem(id);
    }

    public int UpdateApproveNum(String Num, String id){
        return CommentDao.UpdateApproveNum(Num, id);
    }

    public int addComment(String id, String answerId, String userId, String affiliationId, String content, int approveNum, String commentTime){
        return CommentDao.addComment(id, answerId, userId, affiliationId, content, approveNum, commentTime);
    }

    public List<CommentEntity> selectCommentByAll(String id, String answerId, String userId, String affiliationId, String content, int approveNum, String commentTime){
        return CommentDao.selectCommentByAll(id, answerId, userId, affiliationId, content, approveNum, commentTime);
    }
}
