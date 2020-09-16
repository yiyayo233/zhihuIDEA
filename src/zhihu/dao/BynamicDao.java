package zhihu.dao;

import zhihu.entity.BynamicEntity;
import zhihu.entity.UserEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BynamicDao extends BaseDao{
    /**
     * ≤È’“∂ØÃ¨
     * @param id
     * @return
     * @throws SQLException
     */
    public List<BynamicEntity> selectPeople(String id){
        StringBuffer StringBuffer = new StringBuffer("select * from bynamic ");
        if (!id.equals("")) {
            StringBuffer.append(" where userId = '"+ id+"'");
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
