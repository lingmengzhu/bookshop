package book.service;

import java.util.List;

import book.entity.Author;
import book.entity.Book;
import book.entity.PageBean;

public interface AuthorService {

	void addAuthor(Author author);

	void delAuthor(Author author);

	void updateAuthor(Author author);

	List<Author> findAuthorHotByOrder(String tenagodate, String currentdate);

	Author findAuthorByAuthorId(int authorId);

	List<Author> findAllAuthor();

	PageBean<Author> findAuthorByKeywords(int currentPage, int pageSize, String keywords);
  
	List<Author> findAuthorById(Integer authorId);

	PageBean<Author> findAuByAuthorId(int currentPage, int pageSize, String keywords);
}