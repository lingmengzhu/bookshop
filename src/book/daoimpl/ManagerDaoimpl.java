package book.daoimpl;



import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.ManagerDao;
import book.entity.Manager;
@Repository("managerDao")
public class ManagerDaoimpl implements ManagerDao{
	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<Manager> managerlogin(Manager manager) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Manager.class);
		criteria.add(Restrictions.eq("managerName", manager.getManagerName()));
		return(List<Manager>) hibernateTemplate.findByCriteria(criteria);
	}


}
