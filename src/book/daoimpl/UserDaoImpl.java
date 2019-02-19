package book.daoimpl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import book.dao.UserDao;
import book.entity.User;

@Repository(value="userDao")
public class UserDaoImpl implements UserDao{
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public void addUser(User user) {
		hibernateTemplate.save(user);
	}
	@Override
	public User findUserByuserName(String ajaxUsername) {
		List<User> list = (List<User>) hibernateTemplate.find("from User where userName=?", ajaxUsername);
		return list.isEmpty()?null:list.get(0);
	}
	
	@Override
	public String check(String userNameAjax) {
		List<User> list=(List<User>)hibernateTemplate.find("from User where userName=?", userNameAjax);
		return list.isEmpty()?null:list.get(0).getPassword();
	}
	@Override
	public User findUserByEmail(String recipient) {
		// TODO Auto-generated method stub
		List<User> list = (List<User>) hibernateTemplate.find("from User where email=?", recipient);
		return list.isEmpty()?null:list.get(0);
	}
@Override
	public User queryuserinfobyuserName(String userName) { 
	    List list = hibernateTemplate.find("from User where userName=?" , userName);
	    User user=(User)list.get(0);
	    return user;

	}
	@Override
	public void updateinfo(User user) {
		hibernateTemplate.update(user);
	}
	@Override
	public void repassword(User user) {
		hibernateTemplate.update(user);
	}
	@Override
	public User find(String name) {
		List list= hibernateTemplate.find("from  User user where user.userName='"+name+"'");
		User user=(User) list.get(0);
		return user;
	}
	@Override
	public int getUserCount(String userName) {
		String sql = "select count(*) from User where 1=1";
		List list1 = new ArrayList<>();
		if (userName != null && userName.length() > 0) {
			sql += " and userName = '" + userName + "'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());
		return list.get(0).intValue();
	}

	@Override
	public List<User> findUser(int currentPage, int pageSize, String userName) {
	    DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		if (userName != null && userName.length() > 0) {
			criteria.add(Restrictions.like("userName", "%"+userName+"%"));
		}
		return (List<User>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}
	
}
