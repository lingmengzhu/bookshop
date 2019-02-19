package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.BookTwoTypeDao;
import book.entity.BookTwoType;
import book.service.BookTwoTypeService;

@Service("bookTwoTypeService")
@Transactional
public class BookTwoTypeServiceImpl implements BookTwoTypeService {

	@Autowired // 注入
	private BookTwoTypeDao bookTwoTypeDao;

	@Override
	public List<BookTwoType> findBookTwoType(Integer bookOneTypeId) {
		return bookTwoTypeDao.findBookTwoType(bookOneTypeId);
	}
}
