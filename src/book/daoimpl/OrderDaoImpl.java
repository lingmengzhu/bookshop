package book.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import book.dao.OrderDao;
import book.entity.Book;
import book.entity.Order;
import book.entity.User;

@Repository("orderDao")
public class OrderDaoImpl implements OrderDao {

	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addOrder(Order order) {
		hibernateTemplate.save(order);
	}

	@Override
	public void delOrder(Order order) {
		hibernateTemplate.delete(order);
	}

	@Override
	public void updateOrder(Order order) {
		hibernateTemplate.update(order);
	}

	@Override
	public List<Order> findOrderByUserName(String userName) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("payStatus",0));
		criteria.add(Restrictions.eq("user.userName",userName));
		return (List<Order>) hibernateTemplate.findByCriteria(criteria);

	}

	@Override
	public List<Order> findPayOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("payStatus",1));
		criteria.add(Restrictions.eq("user.userName",userName));
		return (List<Order>) hibernateTemplate.findByCriteria(criteria);

	}

	@Override
	public Order findOrder(int orderNumber) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Order.class, orderNumber);
	}

	@Override
	public List<Order> findPayingOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("payStatus",2));
		criteria.add(Restrictions.eq("user.userName",userName));
		return (List<Order>) hibernateTemplate.findByCriteria(criteria);
	}
	
	@Override
	public List<Order> findBalanceOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("payStatus",1));
		criteria.add(Restrictions.eq("user.userName",userName));
		return (List<Order>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public Order findOrderByOrderNumber(int orderNumber) {
		// TODO Auto-generated method stub
		return hibernateTemplate.get(Order.class, orderNumber);
	}
	@Override
	public List<Order> findOrder(int currentPage, int pageSize, int deliverStatus) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		
          if(deliverStatus ==1) {
				criteria.add(Restrictions.or(Restrictions.eq("deliverStatus",1),Restrictions.eq("deliverStatus",3)));
		 }if(deliverStatus ==2) {
			criteria.add(Restrictions.or(Restrictions.eq("deliverStatus",0),Restrictions.eq("deliverStatus",2)));
	     }
              
		
		List<Order> list = (List<Order>) hibernateTemplate.findByCriteria(criteria, (currentPage - 1) * pageSize,pageSize);
		return list;
	}

	@Override
	public int getCount(int deliverStatus) {
		String sql = "select count(*) from Order where 1=1";
		List list1 = new ArrayList<>();
		if (deliverStatus == 1) {
				sql += " and (deliverStatus=1 or deliverStatus=3 )";
		}
		if (deliverStatus == 2) {
			sql += " and (deliverStatus=0 or deliverStatus=4 )";
	}
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());
		return list.get(0).intValue();
	}

	@Override
	public List<Order> findYesOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("payStatus",1));
		criteria.add(Restrictions.eq("deliverStatus",1));
		criteria.add(Restrictions.eq("user.userName",userName));
		return (List<Order>) hibernateTemplate.findByCriteria(criteria);
	}

	@Override
	public List<Order> findNoOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("payStatus",1));
		criteria.add(Restrictions.eq("deliverStatus",0));
		criteria.add(Restrictions.eq("user.userName",userName));
		return (List<Order>) hibernateTemplate.findByCriteria(criteria);
	}
	@Override
	public List<Order> findOrderByPublishHouse(int publishHouseId, String tenagodate, String currentdate) {
		// TODO Auto-generated method stub
		List<Order> orderlist=(List<Order>) hibernateTemplate.find("select o from Order o  where 1=1 and o.publishHouse.publishHouseId="+publishHouseId+" and o.deliveTime between '"+tenagodate+"' and '"+currentdate+"' group by o.book.bookISBN order by sum(bookCount) desc");
		//select bookISBN,sum(bookCount) as bookSumCount from tab_order where 1=1 and payTime between '2018-06-16 08:25:12' and '2018-06-26 08:25:12' and payStatus= 1 or 3 group by bookISBN order by bookSumCount desc limit 0,2
	return orderlist;
	}

	@Override
	public List<Order> findOrderByBookISBN(int bookISBN) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Order.class);
		criteria.add(Restrictions.eq("book.bookISBN",bookISBN));
		List<Order> orderlist=(List<Order>) hibernateTemplate.findByCriteria(criteria);
		return orderlist.isEmpty()?null:orderlist;
	}


}
