package book.dao;

import java.util.List;

import book.entity.Author;

public interface AuthorDao {

	int getAuthorCount(Integer authorId);

	void addAuthor(Author author);

	void delAuthor(Author author);

	void updateAuthor(Author author);

	List<Author> findAuthorHotByOrder(String tenagodate, String currentdate);

	Author findAuthorByAuthorId(int authorId);

	int getAuthorCount(String keywords);

	List<Author> findAuByAuthorId(int currentPage, int pageSize, String keywords);

	List<Author> findAllAuthor();
	
	List<Author> findAuthorById(Integer authorId);
	
	List<Author> findAuthorByAuthorId(int currentPage, int pageSize, String keywords);
}
