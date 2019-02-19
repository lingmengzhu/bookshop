package book.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.BookOneTypeDao;
import book.entity.BookOneType;

@Repository("bookOneTypeDao")
public class BookOneTypeDaoImpl implements BookOneTypeDao {

	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public List<BookOneType> findBookOneType() {
		return (List<BookOneType>) hibernateTemplate.find("from BookOneType");
	}

}
