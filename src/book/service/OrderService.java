package book.service;

import java.util.List;

import book.entity.Book;
import book.entity.Order;
import book.entity.PageBean; 

public interface OrderService {

	void addOrder(Order order);

	void delOrder(Order order);

	void updateOrder(Order order);

	List<Order> findOrderByUserName(String userName);

	List<Order> findPayOrderByUserName(String userName);

	Order findOrder(int orderNumber);

	List<Order> findPayingOrderByUserName(String userName);

	List<Order> findBalanceOrderByUserName(String userName);

	Order findOrderByOrderNumber(int orderNumber);

	PageBean<Order> findOrder(int currentPage, int pageSize, int deliverStatus);

	List<Order> findYesOrderByUserName(String userName);

	List<Order> findNoOrderByUserName(String userName);

	List<Order> findOrderByPublishHouse(int publishHouseId, String tenagodate, String currentdate);

	List<Order> findOrderByBookISBN(int BookISBN);

	
}