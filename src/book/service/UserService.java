package book.service;

import book.entity.PageBean;
import book.entity.User;

public interface UserService {

	void register(User user);

	User findUserByuserName(String ajaxUsername);

	String check(String userNameAjax);

	User findUserByEmail(String recipient);

	User queryuserinfobyuserName(String userName);

	void updateinfo(User user);

	void repassword(User user);
	
	User find(String name);

	PageBean<User> findUser(int currentPage, int pageSize, String userName);
}
