package zhihu.service;

import zhihu.dao.CommentReplyDao;
import zhihu.entity.CommentReplyEntity;

import java.util.List;

public class CommentReplyService {
    CommentReplyDao CommentReplyDao = new CommentReplyDao();
    public int addCommentReply(String rId, String id, String userId, String replyuserId, String content, int approveNum, String commentTime){
        return CommentReplyDao.addCommentReply(rId, id, userId, replyuserId, content, approveNum, commentTime);
    }

    public List<CommentReplyEntity> selectCommentReply(String id){
        return CommentReplyDao.selectCommentReply(id);
    }

    public int UpdateApproveNum(String Num,String id){
        return CommentReplyDao.UpdateApproveNum(Num, id);
    }

    public List<CommentReplyEntity> selectCommentReplyByAll(String rId, String id, String userId, String replyuserId, String content, int approveNum, String commentTime){
        return CommentReplyDao.selectCommentReplyByAll(rId, id, userId, replyuserId, content, approveNum, commentTime);
    }

}
