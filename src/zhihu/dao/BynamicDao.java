package zhihu.dao;

import zhihu.entity.BynamicEntity;
import zhihu.entity.UserEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BynamicDao extends BaseDao{
    /**
     * 查找动态
     * @param uId
     * @return
     * @throws SQLException
     */
    public List<BynamicEntity> selectPeople(String uId){
        StringBuffer StringBuffer = new StringBuffer("select * from bynamic ");
        if (!uId.equals("")) {
            StringBuffer.append(" where userId = '"+ uId+"'");
        }
        StringBuffer.append(" ORDER BY bynamicTiem DESC");

        List<BynamicEntity> bynamicEntities = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                BynamicEntity bynamicEntity = new BynamicEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5));
                bynamicEntities.add(bynamicEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return bynamicEntities;
    }

    /**
     * 添加动态
     * @param id
     * @param userId
     * @param byBynamicId
     * @param bynamicTiem
     * @param bynamicType
     * @return
     */
    public int addBynamic(String id,String userId,String byBynamicId,String bynamicTiem,String bynamicType){
        return execUpdate("INSERT bynamic values(? ,? ,? ,? ,?)", id, userId, byBynamicId, bynamicTiem, bynamicType);
    }

    /**
     * 删除动态
     * @param userId
     * @param byBynamicId
     * @param bynamicType
     * @return
     */
    public int deleteBynamic(String userId,String byBynamicId,String bynamicType){
        return execUpdate("DELETE FROM bynamic WHERE userId = ? AND byBynamicID = ? AND bynamicType = ?", userId, byBynamicId, bynamicType);
    }

    /**
     * 查找动态
     * @param userId
     * @param byBynamicId
     * @param bynamicType
     * @return
     */
    public List<BynamicEntity> selectBynamic(String userId,String byBynamicId,String bynamicType){
        StringBuffer StringBuffer = new StringBuffer("select * from bynamic ");
        if (!userId.equals("") || !byBynamicId.equals("") || !bynamicType.equals("")){
            StringBuffer.append(" where");
        }
        if (!userId.equals("")) {
            StringBuffer.append(" userId = '"+ userId+"'");
        }
        if (!byBynamicId.equals("")) {
            StringBuffer.append("and byBynamicID = '"+ byBynamicId+"'");
        }
        if (!bynamicType.equals("")) {
            StringBuffer.append("and bynamicType = '"+ bynamicType+"'");
        }
        StringBuffer.append(" ORDER BY bynamicTiem DESC");

        List<BynamicEntity> bynamicEntities = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                BynamicEntity bynamicEntity = new BynamicEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5));
                bynamicEntities.add(bynamicEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return bynamicEntities;
    }

}
