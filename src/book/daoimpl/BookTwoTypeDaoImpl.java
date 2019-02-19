package book.daoimpl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.BookTwoTypeDao;
import book.entity.BookTwoType;

@Repository("bookTwoTypeDao")
public class BookTwoTypeDaoImpl implements BookTwoTypeDao {

	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<BookTwoType> findBookTwoType(Integer bookOneTypeId) {
		DetachedCriteria criteria = DetachedCriteria.forClass(BookTwoType.class);
		if(bookOneTypeId!=null){
		criteria.add(Restrictions.eq("bookOneType.bookOneTypeId", bookOneTypeId));
		}
		return (List<BookTwoType>) hibernateTemplate.findByCriteria(criteria);
	}

}
