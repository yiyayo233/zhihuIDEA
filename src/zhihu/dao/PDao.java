package zhihu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import zhihu.entity.PEntity;

public class PDao extends BaseDao{
	public PEntity selectById(String id){
		String sql = "SELECT * FROM p WHERE pid = ?";
		resultSet=super.query(sql, id);


		try {
			while(resultSet.next()){
				return new PEntity(resultSet.getString(1), resultSet.getString(1), resultSet.getInt(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return null;
	}
}
