package zhihu.dao;

import zhihu.entity.CommentEntity;
import zhihu.entity.CommentReplyEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentReplyDao extends BaseDao{

    /**
     * 添加评论回复
     * @param id
     * @param userId
     * @param replyuserId
     * @param content
     * @param approveNum
     * @param commentTime
     * @return
     */
    public int addCommentReply(String rId, String id, String userId, String replyuserId, String content, int approveNum, String commentTime){
        System.err.println("insert commentreply values(?, ? , ? , ? , ? , ? , ?) , "+ rId+", "+ id+ ", "+userId+ ", "+replyuserId+ ", "+content+ ", "+approveNum+ ", "+commentTime);
        return execUpdate("insert commentreply values(?, ? , ? , ? , ? , ? , ?)",rId, id, userId, replyuserId, content, approveNum, commentTime);
    }

    /**
     * 查询评论回复
     * @param id
     * @return
     */
    public List<CommentReplyEntity> selectCommentReply(String id){
        StringBuffer StringBuffer = new StringBuffer("select * from commentreply");
        if (!id.equals("")) {
            StringBuffer.append(" where commentId = '"+ id +"'");
        }
        /*else if (authorId.equals("")) {
            StringBuffer.append(" where authorID = "+authorId);
        }*/

        List<CommentReplyEntity> CommentReplyEntitys = new ArrayList<>();
        StringBuffer.append(" ORDER BY commentTime");
        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                CommentReplyEntity CommentReplyEntity = new CommentReplyEntity(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6),
                        resultSet.getString(7));
                CommentReplyEntitys.add(CommentReplyEntity);
            }
            return CommentReplyEntitys;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 修改赞同数 f
     * @param Num
     * @param id
     * @return
     */
    public int UpdateApproveNum(String Num,String id){
        return execUpdate("UPDATE commentreply SET approveNum = ? WHERE commentId = ?", Num, id);
    }
}
