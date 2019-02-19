package book.dao;

import java.util.List;

import book.entity.BookTwoType;

public interface BookTwoTypeDao {

	List<BookTwoType> findBookTwoType(Integer bookOneTypeId);

}
