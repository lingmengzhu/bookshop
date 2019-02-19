package book.daoimpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.BookDao;
import book.entity.Book;
import book.entity.Order;

@Repository("bookDao")
public class BookDaoImpl implements BookDao{
	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;
	List<Book> list=null;
	@Override
	public void addBook(Book book) {
		hibernateTemplate.save(book);
	}

	@Override
	public void delBook(Book book) {
		hibernateTemplate.delete(book);
	}

	@Override
	public void updateBook(Book book) {
		System.out.println("aa"+book);
		hibernateTemplate.update(book);
	}

	@Override
	public int getConditionCount(String condition, String keywords) {
		String sql = "select count(*) from Book where 1=1";
		List list1 = new ArrayList<>();
		if (keywords != null && keywords.length() > 0) {
			if (condition == "bookName")
				sql += " and bookName = '" + keywords + "'";
		}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());
		return list.get(0).intValue();
	}

	@Override
	public List<Book> findConditionByKeywords(int currentPage, int pageSize, String condition, String keywords) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		if (keywords != null && keywords.length() > 0) {
			if (condition == "bookName"){
				System.out.println("aaa");
				criteria.add(Restrictions.like("bookName", "%"+keywords+"%"));
		}else{
			System.out.println("aa");
			int bookTwoTypeId=Integer.parseInt(keywords);
		criteria.add(Restrictions.eq("bookTwoType.bookTwoTypeId",Integer.parseInt(keywords)));
		}
		}
		/*criteria.addOrder(Order.desc("addTime"));*/
		List<Book> list = (List<Book>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize,
				pageSize);
		return list;

	}

	@Override
	public List<Book> findBook(Integer bookISBN) {
		return (List<Book>) hibernateTemplate.find("from Book where bookISBN = ' " + bookISBN + " '	");

	}

	@Override
	public List<Book> findBookByAuthorId(int authorId) {
		// TODO Auto-generated method stub
		List<Book> list = (List<Book>) hibernateTemplate.find("from Book where author=?", authorId);
		return list;
	}

	@Override
	public List<Book> findBookByKeywords(int currentPage, int pageSize, int bookOneTypeId, String keywords) {
		// TODO Auto-generated method stub
		if (keywords != null && keywords.length() > 0) {
			 list = (List<Book>) hibernateTemplate.find("from Book where bookName like '%"+keywords+"%' or bookIntroduction like '%"+keywords+"%'");
			}
		else if(bookOneTypeId != 0){
			System.out.println(bookOneTypeId);
			 list = (List<Book>) hibernateTemplate.find("from Book B where B.bookOneType.bookOneTypeId=?",bookOneTypeId);
			}
		else if(bookOneTypeId == 0){
			list = (List<Book>) hibernateTemplate.find("from Book");
			};
		return list;
	}

	@Override
	public List<Book> showBookByOneType(int currentPage, int pageSize, int bookOneTypeId) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.eq("bookOneType.bookOneTypeId",bookOneTypeId));
		List<Book> list = (List<Book>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize,
		pageSize);
		return list.isEmpty()?null:list;
	}

	@Override
	public List<Book> findBookHotByOrder(String tenagodate, String currentdate) {
		// TODO Auto-generated method stub//"select o,sum(bookCount) as bookSumCount from Order o where 1=1 and (o.payStatus=1) or (o.payStatus=3) and o.payTime between '"+tenagodate+"' and '"+currentdate+"' group by o.book.bookISBN order by bookSumCount desc"
		List<Order> orderlist=(List<Order>) hibernateTemplate.find("select o from Order o where 1=1 and (o.payStatus=1) or (o.payStatus=3) and o.payTime between '"+tenagodate+"' and '"+currentdate+"' group by o.book.bookISBN order by sum(bookCount) desc");
		List<Book> booklist=new ArrayList();
		for(Order i:orderlist){
			Book book=(i).getBook();
			booklist.add(book);
		}
		//select bookISBN,sum(bookCount) as bookSumCount from tab_order where 1=1 and payTime between '2018-06-16 08:25:12' and '2018-06-26 08:25:12' and payStatus= 1 or 3 group by bookISBN order by bookSumCount desc limit 0,2
	return booklist;
	}

}
