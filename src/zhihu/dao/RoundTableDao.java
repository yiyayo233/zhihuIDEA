package zhihu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import zhihu.entity.RoundtableEntity;
import zhihu.entity.UserEntity;

public class RoundTableDao extends BaseDao{


	/**
	 * 显示部分圆桌信息
	 * @return
	 */
	List<RoundtableEntity> list = new ArrayList<RoundtableEntity>();
	public List<RoundtableEntity> select(){
		String sql = "SELECT * FROM roundtable LIMIT 0,4";
		resultSet = super.query(sql);

		try {
			while(resultSet.next()){
				RoundtableEntity rt = new RoundtableEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getInt(4), resultSet.getInt(5),resultSet.getString(6), resultSet.getString(7), resultSet.getString(8),resultSet.getString(9));
				list.add(rt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return list;
	}

	/**
	 * 显示所有圆桌部分信息
	 * @return
	 */
	public List<RoundtableEntity> allselect(){
		String sql = "SELECT * FROM roundtable";
		resultSet = super.query(sql);
		try {
			while(resultSet.next()){
				RoundtableEntity rt = new RoundtableEntity(resultSet.getString(1), resultSet.getString(2),resultSet.getString(3), resultSet.getInt(4), resultSet.getInt(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8),resultSet.getString(9));
				list.add(rt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return list;
	}

	/**
	 * 根据id查询圆桌
	 * @param id
	 * @return
	 */
	public RoundtableEntity selectById(String id){
		String sql = "SELECT * FROM roundtable WHERE roundtableID = ?";
		resultSet = super.query(sql, id);
		try {
			while(resultSet.next()){
				return new RoundtableEntity(resultSet.getString(1), resultSet.getString(2),resultSet.getString(3), resultSet.getInt(4), resultSet.getInt(5), resultSet.getString(6), resultSet.getString(7), resultSet.getString(8),resultSet.getString(9));
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
