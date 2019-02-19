package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.OrderDao;
import book.entity.Book;
import book.entity.Order;
import book.entity.PageBean;
import book.service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {
	@Autowired // 注入
	private OrderDao orderDao;

	@Override
	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	@Override
	public void delOrder(Order order) {
		orderDao.delOrder(order);
	}

	@Override
	public void updateOrder(Order order) {
		orderDao.updateOrder(order);
	}
	@Override
	public List<Order> findOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByUserName(userName);
	}

	@Override
	public List<Order> findPayOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		return orderDao.findPayOrderByUserName(userName);
	}

	@Override
	public Order findOrder(int orderNumber) {
		// TODO Auto-generated method stub
		return orderDao.findOrder(orderNumber);
	}

	@Override
	public List<Order> findPayingOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		return orderDao.findPayingOrderByUserName(userName);
	}

	@Override
	public List<Order> findBalanceOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		return orderDao.findBalanceOrderByUserName(userName);
	}

	@Override
	public Order findOrderByOrderNumber(int orderNumber) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByOrderNumber(orderNumber);
	}
	@Override
	public PageBean<Order> findOrder(int currentPage, int pageSize, int deliverStatus) {
		int count = orderDao.getCount(deliverStatus); // 求当前类别信息数量
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);// 求总页数
		List<Order> list = orderDao.findOrder(currentPage, pageSize, deliverStatus); // 求当前页的集合数据
		PageBean<Order> pb = new PageBean<>();
		pb.setCount(count);
		if (currentPage == 0)
			currentPage = 1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	@Override
	public List<Order> findYesOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		return orderDao.findYesOrderByUserName(userName);
	}

	@Override
	public List<Order> findNoOrderByUserName(String userName) {
		// TODO Auto-generated method stub
		return orderDao.findNoOrderByUserName(userName);
	}
	
	@Override
	public List<Order> findOrderByPublishHouse(int publishHouseId, String tenagodate, String currentdate) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByPublishHouse(publishHouseId,tenagodate,currentdate);
	}

	@Override
	public List<Order> findOrderByBookISBN(int BookISBN) {
		// TODO Auto-generated method stub
		return orderDao.findOrderByBookISBN(BookISBN);
	}

	
}

