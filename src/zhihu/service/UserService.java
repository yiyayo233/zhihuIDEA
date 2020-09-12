package zhihu.service;

import zhihu.dao.UserDao;
import zhihu.entity.UserEntity;

public class UserService {
	UserDao userDao  = new UserDao();

	public int addUser(String id, String name, String password, String chatHead, String phone, String email) {
		return userDao.addUser(id, name, password, chatHead, phone, email);
	}
	public UserEntity login(String password, String phone, String email) {
		return userDao.login(password, phone, email);
	}

	public UserEntity selecUserItem(String id){
		return userDao.selecUserItem(id);
	}

	public UserEntity selecUserPersonalItem(String id){
		return userDao.selecUserPersonalItem(id);
	}
}
