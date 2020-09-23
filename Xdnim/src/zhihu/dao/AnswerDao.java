package zhihu.dao;

import com.mysql.jdbc.UpdatableResultSet;
import zhihu.entity.AnswerEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnswerDao extends BaseDao{

    /**
     * 添加回答
     * @param id
     * @param authorId
     * @param approveNum
     * @param browseNum
     * @param editTime
     * @param commentId
     * @param answerContent
     * @param publishTime
     * @return
     */
    public int addAnswer(String id, String authorId, int approveNum, int browseNum, String editTime, String commentId, String answerContent, String cover, String publishTime){
        return execUpdate("insert answer values( ?, ?, ?, ?, ?, ?, ?, ?, ? )", id, authorId, approveNum, browseNum, editTime, commentId, answerContent, cover, publishTime);
    }

    /**
     * 查找回答
     * @param authorId
     * @return
     * @throws SQLException
     */
    public List<AnswerEntity> selectAnswer(String id, String authorId) {
        StringBuffer StringBuffer = new StringBuffer("select * from answer");
        if (!id.equals("")) {
            StringBuffer.append(" where answerID = '"+id+"'");
        }else if (!authorId.equals("")) {
            StringBuffer.append(" where authorID = '"+authorId+"'");
        }

        List<AnswerEntity> AnswerEntitys = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                AnswerEntity AnswerEntity = new AnswerEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getInt(3),resultSet.getInt(4),resultSet.getString(5),resultSet.getString(6),resultSet.getString(7),resultSet.getString(8),resultSet.getString(9),resultSet.getInt(10));
                AnswerEntitys.add(AnswerEntity);
            }
            return AnswerEntitys;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 查找单个回答
     * @param id
     * @return
     */
    public AnswerEntity selectAnseerItem(String id){
        StringBuffer StringBuffer = new StringBuffer("select * from answer");
        if (!id.equals("")) {
            StringBuffer.append(" where answerID = '"+id+"'");
        }
        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                return new AnswerEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getInt(3),resultSet.getInt(4),resultSet.getString(5),resultSet.getString(6),resultSet.getString(7),resultSet.getString(8),resultSet.getString(9),resultSet.getInt(10));
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 修改赞同数
     * @param Numder
     * @param id
     * @return
     */
    public int UpdateApproveNum(String Numder,String id){
        return execUpdate("UPDATE answer SET approveNum = '"+Numder+"' WHERE answerID = '"+ id +"'");
    }
}
