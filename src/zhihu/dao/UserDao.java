package zhihu.dao;

import zhihu.entity.AnswerEntity;
import zhihu.entity.UserEntity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends BaseDao{

	/**
	 * 添加用户
	 * @param id
	 * @param name
	 * @param password
	 * @param chatHead
	 * @param phone
	 * @param email
	 * @return
	 */
	public int addUser(String id, String name, String password, String chatHead, String phone, String email) {
		return execUpdate("insert user (userID, userName, userPassWord, chatHead, phone, email) values( ? , ? , ? , ? , ? , ?)", id, name, password, chatHead, phone, email);
	}

	/**
	 * 登录验证
	 * @param password
	 * @param phone
	 * @param email
	 * @return
	 */
	public UserEntity login(String password, String phone, String email) {
		StringBuffer stringBuffer = new StringBuffer("select * from user where userPassWord = "+ password +" and");
		if (!phone.equals("")) {
			stringBuffer.append(" phone = "+phone);
		} else {
			stringBuffer.append(" email = "+email);
		}

		System.err.println(stringBuffer.toString());
		resultSet = query(stringBuffer.toString());
		try {
			while (resultSet.next()) {
				return new UserEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5),resultSet.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 查找用户
	 * @param UserId
	 * @return
	 * @throws SQLException
	 */
	public List<UserEntity> selectUser(String UserId){
		StringBuffer StringBuffer = new StringBuffer("select * from user");
		if (!UserId.equals("")) {
			StringBuffer.append(" where UserID = "+ UserId);
		}

		List<UserEntity> UserEntitys = new ArrayList<>();

		System.err.println(StringBuffer.toString());
		resultSet = query(StringBuffer.toString());
		try {
			while (resultSet.next()) {
				UserEntity UserEntity = new UserEntity(resultSet.getString(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getString(6));
				UserEntitys.add(UserEntity);
			}
		}catch (SQLException e){

		}finally {
			closeAll();
		}
		return UserEntitys;
	}

	/**
	 * 查询单个用户
	 * @param id
	 * @return
	 */
	public UserEntity selecUserItem(String id){
		StringBuffer StringBuffer = new StringBuffer("select * from user");
		if (!id.equals("")) {
			StringBuffer.append(" where UserID = '"+ id+"'");
		}

		System.err.println(StringBuffer.toString());
		resultSet = query(StringBuffer.toString());
		try {
		while (resultSet.next()){
			return new UserEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5),resultSet.getString(6));
		}
		}catch (SQLException e){

		}finally {
			closeAll();
		}
		return null;

	}

	public UserEntity selecUserPersonalItem(String id){
		StringBuffer StringBuffer = new StringBuffer("SELECT u.`userID`,u.`userName`,u.`chatHead`,p.`introduce` FROM USER AS u INNER JOIN `personaldata` AS p ON u.`userID` = p.`userID`");
		if (!id.equals("")) {
			StringBuffer.append(" where u.`UserID` = '"+ id +"'");
		}

		System.err.println(StringBuffer.toString());
		resultSet = query(StringBuffer.toString());
		try {
			while (resultSet.next()){
				return new UserEntity(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4));
			}
		}catch (SQLException e){

		}finally {
			closeAll();
		}
		return null;
	}
}
