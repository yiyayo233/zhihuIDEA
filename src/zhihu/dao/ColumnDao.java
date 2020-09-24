package zhihu.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import zhihu.entity.ColumnEntity;

public class ColumnDao extends BaseDao{
	
	/**
	 * 显示部分专栏信息
	 * @return
	 */
	List<ColumnEntity> list = new ArrayList<ColumnEntity>();
	public List<ColumnEntity> select(){
		String sql = "SELECT * FROM `column` LIMIT 0,4";
		resultSet = super.query(sql);
		
		try {
			while(resultSet.next()){
				ColumnEntity cn = new ColumnEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3),resultSet.getString(4), resultSet.getInt(5));
				list.add(cn);
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
	 * 分页查询
	 */
	public List<ColumnEntity> selectLimit(int curr,int size){
		String sql = "SELECT * FROM `column` LIMIT ?,?";
		resultSet = super.query(sql,(curr-1)*size,size);
		
		try {
			while(resultSet.next()){
				ColumnEntity cn = new ColumnEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3),resultSet.getString(4), resultSet.getInt(5));
				list.add(cn);
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
	 * 查询总条数
	 * @return
	 */
	public int getCount(){
		String sql = "SELECT COUNT(*) FROM `column`";
		resultSet = super.query(sql);
		try {
			if(resultSet.next()){
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return -1;
	}
	
	public ColumnEntity SelectById(String id){
		String sql = "SELECT * FROM `column` WHERE columnID = ?";
		resultSet = super.query(sql, id);
		try {
			if(resultSet.next()){
				return new ColumnEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getInt(5));
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
