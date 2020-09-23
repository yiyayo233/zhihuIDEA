package zhihu.dao;

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


    /**
     * 查询h回复评论ByAll
     * @param id
     * @param userId
     * @param replyuserId
     * @param content
     * @param approveNum
     * @param commentTime
     * @return
     */
    public List<CommentReplyEntity> selectCommentReplyByAll(String rId, String id, String userId, String replyuserId, String content, int approveNum, String commentTime){
        StringBuffer StringBuffer = new StringBuffer("select * from commentreply ");
        int i = 0;

        if (!rId.equals("") || !id.equals("") || !userId.equals("") || !replyuserId.equals("") || !content.equals("") || approveNum!=0 || approveNum==0 || commentTime.equals("")){
            StringBuffer.append(" where");
        }
        if (!rId.equals("")) {
            StringBuffer.append(" commentReplyId = '"+ rId+"'");
            i++;
        }
        if (!id.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" commentId = '"+ id+"'");
            i++;
        }
        if (!userId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" userId = '"+ userId+"'");
            i++;
        }
        if (!replyuserId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" replyuserId = '"+ replyuserId +"'");
            i++;
        }
        if (!content.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" content = '"+ content +"'");
            i++;
        }
        if (!commentTime.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" commentTime like '"+ commentTime +"%'");
            i++;
        }
        StringBuffer.append(" ORDER BY commentTime DESC");

        List<CommentReplyEntity> commentReplyEntityList = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                CommentReplyEntity commentReplyEntity = new CommentReplyEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getInt(6), resultSet.getString(7));
                commentReplyEntityList.add(commentReplyEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return commentReplyEntityList;
    }
}
