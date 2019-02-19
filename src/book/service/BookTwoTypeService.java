package book.service;

import java.util.List;

import book.entity.BookTwoType;

public interface BookTwoTypeService {

	List<BookTwoType> findBookTwoType(Integer bookOneTypeId);

}
