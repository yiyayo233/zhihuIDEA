package zhihu.dao;

import zhihu.entity.AnswerEntity;
import zhihu.entity.QuestionEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDao extends BaseDao{

    /**
     * 添加问题
     * @param id
     * @param authorId
     * @param questionTitle
     * @param questionIntro
     * @param approveNum
     * @param browseNum
     * @param followNum
     * @param commentId
     * @param publishTime
     * @return
     */
    public int addQuestion(String id, String authorId, String questionTitle, String questionIntro, int approveNum, int browseNum, int followNum, String commentId, String publishTime){
        return execUpdate("insert question values( ? , ? , ? , ? , ? , ? , ? , ?, ?)", id, authorId, questionTitle, questionIntro, approveNum, browseNum, followNum, commentId, publishTime);
    }

    /**
     * 查找问题
     * @param authorId
     * @return
     * @throws SQLException
     */
    public List<QuestionEntity> selectQuestion(String id, String authorId) {
        StringBuffer StringBuffer = new StringBuffer("select * from question");
        if (!id.equals("")) {
            StringBuffer.append(" where questionID = "+id);
        }else if (!authorId.equals("")) {
            StringBuffer.append(" where authorID = "+authorId);
        }

        List<QuestionEntity> QuestionEntitys = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                QuestionEntity QuestionEntity = new QuestionEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getInt(5),resultSet.getInt(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9));
                QuestionEntitys.add(QuestionEntity);
            }
            return QuestionEntitys;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 获取单个问题
     * @param id
     * @return
     */
    public QuestionEntity selectQuestionItem(String id){
        StringBuffer StringBuffer = new StringBuffer("select * from question");
        if (!id.equals("")) {
            StringBuffer.append(" where questionID = '"+id+"'");
        }
        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                return new QuestionEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getInt(5),resultSet.getInt(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9));
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
        return execUpdate("UPDATE question SET approveNum = ? WHERE questionId = ? ", Num, id);
    }

    /**
     * 添加浏览量
     * @param questionId
     * @return
     */
    public int updatebrowseNum(String questionId) {
        System.err.println("UPDATE question SET browseNum = browseNum+1 WHERE questionId = '"+ questionId +"'");
        return execUpdate("UPDATE question SET browseNum = browseNum+1 WHERE questionId = '"+ questionId +"'");
    }
}
