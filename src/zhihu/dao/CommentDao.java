package zhihu.dao;

import zhihu.entity.AnswerEntity;
import zhihu.entity.CommentEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao extends BaseDao{

    /**
     * 查找评论
     * @param affiliationId
     * @return
     * @throws SQLException
     */
    public List<CommentEntity> selectComment( String affiliationId) {
        StringBuffer StringBuffer = new StringBuffer("select * from comment");
        if (!affiliationId.equals("")) {
            StringBuffer.append(" where affiliationId = '"+ affiliationId +"'");
        }
        /*else if (authorId.equals("")) {
            StringBuffer.append(" where authorID = "+authorId);
        }*/

        List<CommentEntity> CommentEntitys = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                CommentEntity CommentEntity = new CommentEntity(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6),
                        resultSet.getString(7));
                CommentEntitys.add(CommentEntity);
            }
            return CommentEntitys;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 查询单个评论
     * @param receiveId
     * @return
     */
    public CommentEntity selectCommentItem(String receiveId) {
        StringBuffer StringBuffer = new StringBuffer("select * from comment");
        if (!receiveId.equals("")) {
            StringBuffer.append(" where receiveID = '"+receiveId+"'");
        }

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                return new CommentEntity(
                        resultSet.getString(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getInt(6),
                        resultSet.getString(7));
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 修改赞同数
     * @param Num
     * @param id
     * @return
     */
    public int UpdateApproveNum(String Num,String id){
        return execUpdate("UPDATE comment SET approveNum = ? WHERE commentID = ?", Num, id);
    }

    /**
     * 添加评论
     * @param id
     * @param answerId
     * @param userId
     * @param affiliationId
     * @param content
     * @param approveNum
     * @param commentTime
     * @return
     */
    public int addComment(String id, String answerId, String userId, String affiliationId, String content, int approveNum, String commentTime){
        System.err.println("insert comment values(?, ? , ? , ? , ? , ? , ?) , "+ id+", "+ answerId+ ", "+userId+ ", "+affiliationId+ ", "+content+ ", "+approveNum+ ", "+commentTime);
        return execUpdate("insert comment values(?, ? , ? , ? , ? , ? , ?)", id, answerId, userId, affiliationId, content, approveNum, commentTime);
    }

}
