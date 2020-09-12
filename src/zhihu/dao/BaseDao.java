package zhihu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mysql.jdbc.Driver;

/**
 * 工具类 数据访问层的工作
 * @author hp
 *
 */
public class BaseDao {
	private String user = "root";
	private String password = "748123";
	private String url = "jdbc:mysql://127.0.0.1:3306/zhihu";
	private String driver = "com.mysql.jdbc.Driver";
	
	Connection connection;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	
	/**
	 * 连接数据库
	 */
	public void getConn() {
		try {
			Class.forName(driver);




			connection = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询的通用方法
	 */
	//									不限制长度和类型的数组
	public ResultSet query(String sql, Object...objects) {
		//1.获取连接
		this.getConn();
		//2.编译sql语句
		try {
			preparedStatement = connection.prepareStatement(sql);
			//3.判断在数组中是否则替换？替换
			if (objects != null) {
				//4.循环数组
				for (int i = 0; i < objects.length; i++) {
					preparedStatement.setObject(i+1, objects[i]);
				}
			}
			//执行sql
			resultSet = preparedStatement.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}
	
	/**
	 * 增删改的通用方法
	 */
	//									不限制长度和类型的数组
	public int execUpdate(String sql, Object...objects) {
		//1.获取连接
		this.getConn();
		//2.编译sql语句
		try {
			preparedStatement = connection.prepareStatement(sql);
			//3.判断在数组中是否则替换？替换
			if (objects != null) {
				//4.循环数组
				for (int i = 0; i < objects.length; i++) {
					preparedStatement.setObject(i+1, objects[i]);
				}
			}
			//执行sql
			return preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * 关闭
	 */
	public void closeAll() {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
}
