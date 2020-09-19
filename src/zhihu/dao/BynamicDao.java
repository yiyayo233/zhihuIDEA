package zhihu.dao;

import zhihu.entity.BrowseEntity;
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
                BynamicEntity bynamicEntity = new BynamicEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
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
     * @param authorId
     * @return
     */
    public int addBynamic(String id,String userId,String byBynamicId,String bynamicTiem,String bynamicType, String authorId){
        return execUpdate("INSERT bynamic values(? ,? ,? ,? ,?, ?)", id, userId, byBynamicId, bynamicTiem, bynamicType, authorId);
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
                BynamicEntity bynamicEntity = new BynamicEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
                bynamicEntities.add(bynamicEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return bynamicEntities;
    }

    /**
     * 查询动态各种by
     * @param id
     * @param userId
     * @param byBynamicId
     * @param bynamicTiem 1(当天) : 7(一周) : 30(一月): ""(all) : -1(前一天)
     * @param bynamicType
     * @param authorId
     * @return
        */
    public List<BynamicEntity> selectBynamicByAll(String id,String userId,String byBynamicId,String bynamicTiem,String bynamicType,String authorId){
        StringBuffer StringBuffer = new StringBuffer("select * from Bynamic ");
        int i = 0;

        if (!id.equals("") || !userId.equals("") || !byBynamicId.equals("") || !bynamicTiem.equals("") || !bynamicType.equals("") || !authorId.equals("")){
            StringBuffer.append(" where");
        }
        if (!id.equals("")) {
            StringBuffer.append(" Bynamic = '"+ id+"'");
            i++;
        }
        if (!userId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" userId = '"+ userId+"'");
            i++;
        }
        if (!byBynamicId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" byBynamicId = '"+ byBynamicId+"'");
            i++;
        }
        if (!bynamicTiem.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            if (bynamicTiem.equals("1")){
                StringBuffer.append(" TO_DAYS(NOW()) = TO_DAYS(bynamicTiem)");
            }else if (bynamicTiem.equals("7")){
                StringBuffer.append(" DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= DATE(bynamicTiem)");
            }else if (bynamicTiem.equals("30")){
                StringBuffer.append(" WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= DATE(bynamicTiem)");
            }else if (bynamicTiem.equals("-1")){
                StringBuffer.append(" TO_DAYS( NOW( ) ) - TO_DAYS(bynamicTiem) = 1");
            }
            i++;
        }
        if (!bynamicType.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" bynamicType = '"+ bynamicType +"'");
            i++;
        }
        if (!authorId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" authorId = '"+ authorId +"'");
            i++;
        }
        StringBuffer.append(" ORDER BY bynamicTiem DESC");

        List<BynamicEntity> bynamicEntityList = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                BynamicEntity bynamicEntity = new BynamicEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
                bynamicEntityList.add(bynamicEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return bynamicEntityList;
    }

}
