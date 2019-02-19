package book.dao;

import java.util.List;

import book.entity.User;

public interface UserDao {

	void addUser(User user);

	User findUserByuserName(String ajaxUsername);

	String check(String userNameAjax);

	User findUserByEmail(String recipient);

	User queryuserinfobyuserName(String userName);

	void updateinfo(User user);

	void repassword(User user);

	User find(String name);

	int getUserCount(String userName);

	List<User> findUser(int currentPage, int pageSize, String userName);
}
