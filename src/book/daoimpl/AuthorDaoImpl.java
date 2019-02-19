package book.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.AuthorDao;
import book.entity.Author;
import book.entity.Book;
import book.entity.Order;

@Repository("authorDao")
public class AuthorDaoImpl implements AuthorDao {
	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public int getAuthorCount(Integer authorId) {
		String sql = "select count(*) from tab_author where 1=1";
		List list1 = new ArrayList<>();
		if (authorId != null) {
			sql += " and authorId = '" + authorId + "'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());
		return list.get(0).intValue();
	}

	@Override
	public void addAuthor(Author author) {
		hibernateTemplate.save(author);
	}

	@Override
	public void delAuthor(Author author) {
		hibernateTemplate.delete(author);
	}

	@Override
	public void updateAuthor(Author author) {
		hibernateTemplate.update(author);
	}

	@Override
	public List<Author> findAuthorHotByOrder(String tenagodate, String currentdate) {
		// TODO Auto-generated method stub
		List<Order> orderlist=(List<Order>) hibernateTemplate.find("select o from Order o where 1=1 and (o.payStatus=1) or (o.payStatus=3) and o.payTime between '"+tenagodate+"' and '"+currentdate+"' group by o.author.authorId order by sum(bookCount) desc");
		List<Author> authorList=new ArrayList();
		for(Order i:orderlist){
			Author author=(i).getAuthor();
			authorList.add(author);
		}
		//select bookISBN,sum(bookCount) as bookSumCount from tab_order where 1=1 and payTime between '2018-06-16 08:25:12' and '2018-06-26 08:25:12' and payStatus= 1 or 3 group by bookISBN order by bookSumCount desc limit 0,2
	return authorList;
	}

	@Override
	public Author findAuthorByAuthorId(int authorId) {
		// TODO Auto-generated method stub
			return hibernateTemplate.get(Author.class, authorId);
	}

	@Override
	public int getAuthorCount(String keywords) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from Author where 1=1";
		List list1 = new ArrayList<>();
		if (keywords != null) {
			sql+=" and authorName like '%"+keywords+"%'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());
		return list.get(0).intValue();
	}

	@Override
	public List<Author> findAuthorByAuthorId(int currentPage, int pageSize, String keywords) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Author.class);
		System.out.println("keywords:"+keywords);
		if (keywords != null) {
			criteria.add(Restrictions.like("authorName", "%"+keywords+"%"));
		}
		System.out.println("查询语句："+criteria);
		List<Author> list=(List<Author>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
		System.out.println("查询结果："+list.toString());
		return list;
	}

	@Override
	public List<Author> findAllAuthor() {
		return (List<Author>) hibernateTemplate.find("from Author");
	}
	@Override
	public List<Author> findAuthorById(Integer authorId) {
		// TODO Auto-generated method stub
		return (List<Author>) hibernateTemplate.find("from Author	 where authorId = ' " + authorId + " '	");
	}
	@Override
	public List<Author> findAuByAuthorId(int currentPage, int pageSize, String keywords) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Author.class);
		System.out.println("keywords:"+keywords);
		if (keywords != null) {
			criteria.add(Restrictions.like("authorName", "%"+keywords+"%"));
		}
		System.out.println("查询语句："+criteria);
		List<Author> list=(List<Author>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize, pageSize);
		System.out.println("查询结果："+list.toString());
		return list;
	}
}
