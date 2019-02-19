package book.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.PublishHouseDao;
import book.entity.PublishHouse;

@Repository("publishHouseDao")
public class PublishHouesDaoImpl implements PublishHouseDao {
	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public void updatePublishHouse(PublishHouse publishHouse) {
		System.out.println("jdkjifjksdofj"+publishHouse);
		hibernateTemplate.update(publishHouse);
	}

	@Override
	public void delPublishHouse(PublishHouse publishHouse) {
		hibernateTemplate.delete(publishHouse);
	}

	@Override
	public void addPublishHouse(PublishHouse publishHouse) {
		hibernateTemplate.save(publishHouse);
	}

	@Override
	public int getPublishHouseCount(String keywords) {
		String sql = "select count(*) from PublishHouse where 1=1";
		List list1 = new ArrayList<>();
		if (keywords != null) {
			sql+=" and publishHouseName like '%"+keywords+"%'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());
		return list.get(0).intValue();
	}

	@Override
	public List<PublishHouse> findPublishHouseBy(int currentPage, int pageSize, String keywords) {
		DetachedCriteria criteria = DetachedCriteria.forClass(PublishHouse.class);
		if (keywords != null) {
			criteria.add(Restrictions.like("publishHouseName", "%"+keywords+"%"));
		}
		return (List<PublishHouse>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
	}

	@Override
	public List<PublishHouse> findPublishHouseById(int publishHouseId) {
		return (List<PublishHouse>) hibernateTemplate.find("from PublishHouse where publishHouseId = ' " + publishHouseId + " '	");
	}

	@Override
	public List<PublishHouse> findAll() {
		// TODO Auto-generated method stub
		return (List<PublishHouse>) hibernateTemplate.find("from PublishHouse");
	}

}
