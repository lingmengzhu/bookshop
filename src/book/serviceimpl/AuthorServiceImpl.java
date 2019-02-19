package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.AuthorDao;
import book.entity.Author;
import book.entity.PageBean;
import book.service.AuthorService;

@Service("authorService")
@Transactional
public class AuthorServiceImpl implements AuthorService {
	@Autowired // 注入
	private AuthorDao authorDao;


	@Override
	public void addAuthor(Author author) {
		authorDao.addAuthor(author);

	}

	@Override
	public void delAuthor(Author author) {
		authorDao.delAuthor(author);
	}

	@Override
	public void updateAuthor(Author author) {
		authorDao.updateAuthor(author);
	}

	@Override
	public List<Author> findAuthorHotByOrder(String tenagodate, String currentdate) {
		// TODO Auto-generated method stub
		return authorDao.findAuthorHotByOrder(tenagodate,currentdate);
	}

	@Override
	public Author findAuthorByAuthorId(int authorId) {
		// TODO Auto-generated method stub
		return authorDao.findAuthorByAuthorId(authorId);
	}

	@Override
	public List<Author> findAllAuthor() {
		// TODO Auto-generated method stub
		return authorDao.findAllAuthor();
	}

	@Override
	public PageBean<Author> findAuthorByKeywords(int currentPage, int pageSize, String keywords) {
		// TODO Auto-generated method stub
		int count = authorDao.getAuthorCount(keywords); // 求当前类别信息数量
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);// 求总页数
		List<Author> list = authorDao.findAuthorByAuthorId(currentPage, pageSize, keywords); // 求当前页的集合数据
		PageBean<Author> pb = new PageBean<>();
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
	public List<Author> findAuthorById(Integer authorId) {
		// TODO Auto-generated method stub
		return authorDao.findAuthorById(authorId);
	}
	@Override
	public PageBean<Author> findAuByAuthorId(int currentPage, int pageSize, String  keywords) {
		int count = authorDao.getAuthorCount(keywords); // 求当前类别信息数量
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);// 求总页数
		List<Author> list = authorDao.findAuthorByAuthorId(currentPage, pageSize, keywords); // 求当前页的集合数据
		PageBean<Author> pb = new PageBean<>();
		pb.setCount(count);
		if (currentPage == 0)
			currentPage = 1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
}
