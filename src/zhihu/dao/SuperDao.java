package zhihu.dao;

import zhihu.entity.SuperEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SuperDao extends BaseDao{

    /**
     * 添加
     * @param tableName
     * @param id1
     * @param id2
     * @return
     */
    public int addSuper(String tableName, String id1, String id2) {
        return execUpdate("insert ? values( ? , ? )",tableName,  id1, id2);
    }

    /**
     * 查询
     * @param tableName
     * @return
     */
    public List<SuperEntity> selectSpper(String tableName){
        StringBuffer StringBuffer = new StringBuffer("select * from ");
        StringBuffer.append(tableName);
        System.err.println(StringBuffer.toString());
        resultSet= query(StringBuffer.toString());
        List<SuperEntity> superEntityList = new ArrayList<>();
        try{
        while (resultSet.next()){
            SuperEntity SuperEntity = new SuperEntity(resultSet.getString(1), resultSet.getString(2));
            superEntityList.add(SuperEntity);
        }
        return superEntityList;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 查询by
     * @param tableName
     * @return
     */
    public List<SuperEntity> selectSpperby(String tableName, String id1, String id2){

        String re = selectColumn(tableName);
        String re1 = "";
        String re2 = "";

        if (re1.equals("")) {
            re1 = re.split(" ")[1];
        }

        if (re2.equals("")) {
            re2 = re.split(" ")[2];
        }
        System.out.println(re1+"=="+re2);

        StringBuffer StringBuffer = new StringBuffer("select * from "+tableName
        );
        if (!id1.equals("") || !id2.equals("")){
            StringBuffer.append(" where ");
        }
        if (!id1.equals("")){
            StringBuffer.append( re1+" = '"+ id1 +"'");
        }else if (!id2.equals("")){
            StringBuffer.append( re2+" = '"+ id2 +"'");
        }
        System.err.println(StringBuffer.toString());
        resultSet= query(StringBuffer.toString());
        List<SuperEntity> superEntityList = new ArrayList<>();
        try{
            while (resultSet.next()){
                SuperEntity SuperEntity = new SuperEntity(resultSet.getString(1), resultSet.getString(2));
                superEntityList.add(SuperEntity);
            }
            return superEntityList;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 获取列名
     * @param tableName
     * @return
     */
    public String selectColumn(String tableName){
        String sql1 = "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME='" + tableName + "'";
        resultSet= query(sql1);
        String re = "";
        try{
            while (resultSet.next()){
                re = re+ " " + resultSet.getString(1);
            }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        String sql2 = "SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME='" + tableName + "' LIMIT 1,1";
        return re;
    }

    /**
     * 查询 去重
     * @param tableName
     * @return
     */
    public List<SuperEntity> selectSpperDistinct(String tableName){

        String re = selectColumn(tableName);
        String re1 = "";
        String re2 = "";

        if (re1.equals("")) {
            re1 = re.split(" ")[1];
        }

        if (re2.equals("")) {
            re2 = re.split(" ")[2];
        }
        System.out.println(re1+"=="+re2);

        StringBuffer StringBuffer = new StringBuffer("SELECT DISTINCT `" + re1 + "` FROM `"+ tableName +"`");

        System.err.println(StringBuffer.toString());
        resultSet= query(StringBuffer.toString());
        List<SuperEntity> superEntityList = new ArrayList<>();
        try{
            while (resultSet.next()){
                SuperEntity SuperEntity = new SuperEntity(resultSet.getString(1));
                superEntityList.add(SuperEntity);
            }
            return superEntityList;
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }

    /**
     * 查询单个
     * @param tableName
     * @param id1
     * @param id2
     * @return
     */
    public SuperEntity selectSpperItem(String tableName, String id1, String id2) {
        String re = selectColumn(tableName);
        String re1 = "";
        String re2 = "";

        if (re1.equals("")) {
            re1 = re.split(" ")[1];
        }

        if (re2.equals("")) {
            re2 = re.split(" ")[2];
        }
        System.out.println(re1+"=="+re2);

        StringBuffer StringBuffer = new StringBuffer("select * from "+tableName
        );
        if (!id1.equals("") || !id2.equals("")){
            StringBuffer.append(" where ");
        }
        if (!id1.equals("")){
            StringBuffer.append( re1+" = '"+ id1 +"'");
        }else if (!id2.equals("")){
            StringBuffer.append( re2+" = '"+ id2 +"'");
        }
        System.err.println(StringBuffer.toString());
        resultSet= query(StringBuffer.toString());
        try{
            while (resultSet.next()){
                return new SuperEntity(resultSet.getString(1), resultSet.getString(2));
                }
        }catch (SQLException e){

        }finally {
            closeAll();
        }
        return null;
    }
}
