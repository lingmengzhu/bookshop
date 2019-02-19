package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.UserDao;
import book.entity.PageBean;
import book.entity.User;
import book.service.UserService;
@Service(value="userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	
	
	@Override
	public void register(User user) {
		userDao.addUser(user);
	}

	@Override
	public User findUserByuserName(String ajaxUsername) {
		return userDao.findUserByuserName(ajaxUsername);
	}

	@Override
	public String check(String userNameAjax) {
		return userDao.check(userNameAjax);
	}

	@Override
	public User findUserByEmail(String recipient) {
		return userDao.findUserByEmail(recipient);
	}

	@Override
	public User queryuserinfobyuserName(String userName) {
		return userDao.queryuserinfobyuserName(userName);
	}

	@Override
	public void updateinfo(User user) {
		userDao.updateinfo(user);
	}

	@Override
	public void repassword(User user) {
		userDao.repassword(user);
	}

	@Override
	public User find(String name) {
		return userDao.find(name);
	}

	@Override
	public PageBean<User> findUser(int currentPage, int pageSize, String userName) {
		int count = userDao.getUserCount(userName); // 求当前类别信息数量
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);// 求总页数
		List<User> list = userDao.findUser(currentPage, pageSize, userName); // 求当前页的集合数据
		PageBean<User> pb = new PageBean<>();
		pb.setCount(count);
		if (currentPage == 0)
			currentPage = 1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

}
