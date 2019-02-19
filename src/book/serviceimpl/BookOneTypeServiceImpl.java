package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.BookOneTypeDao;
import book.entity.BookOneType;
import book.service.BookOneTypeService;

@Service("bookOneTypeService")
@Transactional
public class BookOneTypeServiceImpl implements BookOneTypeService {

	@Autowired // 注入
	private BookOneTypeDao bookOneTypeDao;

	@Override
	public List<BookOneType> findBookOneType() {
		return bookOneTypeDao.findBookOneType();
	}

}
