package book.service;

import java.util.List;

import book.entity.Book;
import book.entity.PageBean;

public interface BookService {

	void addBook(Book book);

	void delBook(Book book);

	void updateBook(Book book);

	PageBean<Book> findConditionByKeywords(int currentPage, int pageSize, String condition, String keywords);

	List<Book> findBook(Integer bookISBN);

	List<Book> findBookByAuthorId(int authorId);

	List findBookHotByOrder(String tenagodate, String currentdate);

	PageBean<Book> findBookByKeywords(int currentPage, int pageSize, int bookOneTypeId, String keywords);

	PageBean<Book> showBookByOneType(int currentPage, int pageSize, int bookOneTypeId);

	

}