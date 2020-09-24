package zhihu.dao;

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
    public int addQuestion(String id, String authorId, String questionTitle, String questionIntro, int approveNum, int browseNum, int followNum, String commentId, String publishTime, int isFold){
        return execUpdate("insert question values( ? , ? , ? , ? , ? , ? , ? , ?, ?, ?)", id, authorId, questionTitle, questionIntro, approveNum, browseNum, followNum, commentId, publishTime, isFold);
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
                QuestionEntity QuestionEntity = new QuestionEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getInt(5),resultSet.getInt(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9), resultSet.getInt(10));
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
    public QuestionEntity selectQuestionItem(String id, int isFond){
        StringBuffer StringBuffer = new StringBuffer("select * from question");
        if (!"".equals(id) || !"".equals(isFond)){
            StringBuffer.append( " where" );
        }
        int num = 0;
        if (!"".equals(id)) {
            StringBuffer.append(" questionID = '"+id+"'");
            num++;
        }
        if (!"".equals(isFond)){
            if (num > 0){
                StringBuffer.append(" and ");
            }
            StringBuffer.append("  questionID = '"+id+"'");
            num++;
        }
        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                return new QuestionEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getInt(5),resultSet.getInt(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9), resultSet.getInt(10));
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

    public int updateFold(String questionId,String is){
        return execUpdate("UPDATE question SET isFold = "+ is +" WHERE questionId = '"+ questionId +"'");
    }

    /**
     * 查询问题ByALL
     * @param id
     * @param authorId
     * @param approveNum
     * @param browseNum
     * @param followNum
     * @param commentId
     * @param publishTime
     * @param isFold
     * @return
     */
    public List<QuestionEntity> SelectQuestionByAll(String id, String authorId, int approveNum, int browseNum, int followNum, String commentId, String publishTime, int isFold){
        StringBuffer StringBuffer = new StringBuffer("select * from question");
        if (!id.equals("") || !authorId.equals("") || approveNum != -1 || browseNum != -1 || followNum != -1 || !commentId.equals("") || !publishTime.equals("") || isFold != -1){
            StringBuffer.append("where");
        }
        int i = 0;
        if (!id.equals("")){
            StringBuffer.append(" questionID = '"+ id+"'");
            i++;
        }
        if (!authorId.equals("")){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" authorId = '"+ authorId+"'");
            i++;
        }
        if (approveNum != -1){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" approveNum = '"+ approveNum+"'");
            i++;
        }
        if (browseNum != -1){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" browseNum = '"+ browseNum+"'");
            i++;
        }
        if (followNum != -1){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" followNum = '"+ followNum+"'");
            i++;
        }
        if (!commentId.equals("")){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" commentId = '"+ commentId+"'");
            i++;
        }
        if (!publishTime.equals("")){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" publishTime like '"+ publishTime+"%'");
            i++;
        }
        if (isFold != -1){
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" isFold = '"+ isFold+"'");
            i++;
        }

        List<QuestionEntity> QuestionEntitys = new ArrayList<>();
        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                QuestionEntity QuestionEntity = new QuestionEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getInt(5),resultSet.getInt(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9), resultSet.getInt(10));
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
     * 查询问题管理员ByALL
     * @param id
     * @param minTime
     * @param maxTime
     * @param isFold
     * @return
     */
    public List<QuestionEntity> SelectQuestionByAdminAll(String id,String minTime,String maxTime, int isFold ,int curr ,int size){
        StringBuffer StringBuffer = new StringBuffer("select * from question");
        if (!id.equals("") || !minTime.equals("") || !maxTime.equals("") || isFold != -1){
            StringBuffer.append(" where");
        }
        int i = 0;
        if (!id.equals("")){
            StringBuffer.append(" questionID = '"+ id+"'");
            i++;
        }
        if (!minTime.equals("")){
            if (i>0){
                StringBuffer.append("and");
            }
            StringBuffer.append(" publishTime > '"+ minTime+"'");
            i++;
        }
        if (!maxTime.equals("")){
            if (i>0){
                StringBuffer.append("and");
            }
            StringBuffer.append(" publishTime < '"+ maxTime+"'");
            i++;
        }
        if (isFold != -1){
            if (i>0){
                StringBuffer.append("and");
            }
            StringBuffer.append(" isFold = '"+ isFold+"'");
            i++;
        }
        if (curr != -1){
            StringBuffer.append(" LIMIT "+ (curr-1)*size +","+ size +"");
        }

        List<QuestionEntity> QuestionEntitys = new ArrayList<>();
        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()){
                QuestionEntity QuestionEntity = new QuestionEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getInt(5),resultSet.getInt(6),resultSet.getInt(7),resultSet.getString(8),resultSet.getString(9), resultSet.getInt(10));
                QuestionEntitys.add(QuestionEntity);
            }
            return QuestionEntitys;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }
}
