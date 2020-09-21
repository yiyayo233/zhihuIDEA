package zhihu.dao;

import zhihu.entity.BrowseEntity;
import zhihu.entity.BynamicEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrowseDao extends BaseDao{
    /**
     * 添加浏览
     * @param id
     * @param uId
     * @param objectId
     * @param browseTime
     * @param objectType
     * @return
     */
    public int addBrowse(String id, String uId, String objectId, String browseTime, String objectType, String authorId){
        System.err.println("insert browse values('"+ id +"', '"+ uId +"', '"+ objectId +"', '"+ browseTime +"', '"+ objectId +"', '"+ authorId +"')");
        return execUpdate("insert browse values(?, ?, ?, ?, ?, ?)", id, uId, objectId, browseTime, objectType, authorId);
    }

    /**
     * 查询该用户
     * @param uId
     * @param objectId
     * @param objectType
     * @return
     */
    public List<BrowseEntity> selectBrowse(String uId, String objectId, String objectType){
        StringBuffer StringBuffer = new StringBuffer("select * from browse ");

        if (!uId.equals("") || !objectId.equals("") || !objectType.equals("")){
            StringBuffer.append(" where");
        }
        if (!uId.equals("")) {
            StringBuffer.append(" userId = '"+ uId+"'");
        }
        if (!objectId.equals("")) {
            StringBuffer.append("and objectId = '"+ objectId+"'");
        }
        if (!objectType.equals("")) {
            StringBuffer.append("and objectType = '"+ objectType+"'");
        }
        StringBuffer.append(" ORDER BY browseTime DESC");

        List<BrowseEntity> browseEntityList = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                BrowseEntity browseEntity = new BrowseEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
                browseEntityList.add(browseEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return browseEntityList;
    }

    /**
     * 根据时间查询该用户的浏览该对象的数据
     * @param uId
     * @param objectId
     * @param browseTime 1(当天) : 7(一周) : 30(一月): ""(all) : -1(前一天)
     * @param objectType
     * @param authorId
     * @return
0     */
    public List<BrowseEntity> selectBrowseByAll(String uId, String objectId, String browseTime, String objectType, String authorId){
        StringBuffer StringBuffer = new StringBuffer("select * from browse ");
        int i = 0;

        if (!uId.equals("") || !objectId.equals("") || !browseTime.equals("") || !objectType.equals("") || !authorId.equals("")){
            StringBuffer.append(" where");
        }
        if (!uId.equals("")) {
            StringBuffer.append(" userId = '"+ uId+"'");
            i++;
        }
        if (!objectId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" objectId = '"+ objectId+"'");
            i++;
        }
        if (!browseTime.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            if (browseTime.equals("1")){
                StringBuffer.append(" TO_DAYS(NOW()) = TO_DAYS(browseTime)");
            }else if (browseTime.equals("7")){
                StringBuffer.append(" DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= DATE(browseTime)");
            }else if (browseTime.equals("14")){
                StringBuffer.append(" WHERE DATE_SUB(CURDATE(), INTERVAL 14 DAY) <= DATE(browseTime)");
            }else if (browseTime.equals("30")){
                StringBuffer.append(" WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) <= DATE(browseTime)");
            }else if (browseTime.equals("90")){
                StringBuffer.append(" WHERE DATE_SUB(CURDATE(), INTERVAL 90 DAY) <= DATE(browseTime)");
            }else if (browseTime.equals("-1")){
                StringBuffer.append(" TO_DAYS( NOW( ) ) - TO_DAYS(browseTime) = 1");
            }else if (browseTime.equals("-2")){
                StringBuffer.append(" TO_DAYS( NOW( ) ) - TO_DAYS(browseTime) = 2");
            }
            i++;
        }
        if (!objectType.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" objectType = '"+ objectType +"'");
            i++;
        }
        if (!authorId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" authorId = '"+ authorId +"'");
            i++;
        }
        StringBuffer.append(" ORDER BY browseTime DESC");

        List<BrowseEntity> browseEntityList = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                BrowseEntity browseEntity = new BrowseEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
                browseEntityList.add(browseEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return browseEntityList;
    }


    /**
     * 根据时间查询该用户的浏览该对象的数据
     * @param uId
     * @param objectId
     * @param browseTime 通过时间模糊查询
     * @param objectType
     * @param authorId
     * @return
    0     */
    public List<BrowseEntity> selectBrowseByTime(String uId, String objectId, String browseTime, String objectType, String authorId){
        StringBuffer StringBuffer = new StringBuffer("select * from browse ");
        int i = 0;

        if (!uId.equals("") || !objectId.equals("") || !browseTime.equals("") || !objectType.equals("") || !authorId.equals("")){
            StringBuffer.append(" where");
        }
        if (!uId.equals("")) {
            StringBuffer.append(" userId = '"+ uId+"'");
            i++;
        }
        if (!objectId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" objectId = '"+ objectId+"'");
            i++;
        }
        if (!browseTime.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" browseTime LIKE '"+ browseTime +"%'");
            i++;
        }
        if (!objectType.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" objectType = '"+ objectType +"'");
            i++;
        }
        if (!authorId.equals("")) {
            if (i>0){
                StringBuffer.append(" and");
            }
            StringBuffer.append(" authorId = '"+ authorId +"'");
            i++;
        }
        StringBuffer.append(" ORDER BY browseTime DESC");

        List<BrowseEntity> browseEntityList = new ArrayList<>();

        System.err.println(StringBuffer.toString());
        resultSet = query(StringBuffer.toString());
        try {
            while (resultSet.next()) {
                BrowseEntity browseEntity = new BrowseEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
                browseEntityList.add(browseEntity);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return browseEntityList;
    }
}




