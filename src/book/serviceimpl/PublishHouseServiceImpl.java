package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.PublishHouseDao;
import book.entity.PageBean;
import book.entity.PublishHouse;
import book.service.PublishHouseService;

@Service("publishHouseService")
@Transactional
public class PublishHouseServiceImpl implements PublishHouseService {
	@Autowired // 注入
	private PublishHouseDao publishHouseDao;
	
	@Override
	public void addPublishHouse(PublishHouse publishHouse) {
		publishHouseDao.addPublishHouse(publishHouse);

	}

	@Override
	public void delPublishHouse(PublishHouse publishHouse) {
		publishHouseDao.delPublishHouse(publishHouse);
	}

	@Override
	public void updatePublishHouse(PublishHouse publishHouse) {
		publishHouseDao.updatePublishHouse(publishHouse);
	}

	@Override
	public PageBean<PublishHouse> findPublishHouseBy(int currentPage, int pageSize, String keywords) {
		int count = publishHouseDao.getPublishHouseCount(keywords); // 求信息数量
		int totalPage = (int) Math.ceil(count * 1.0 / pageSize);// 求总页数
		List<PublishHouse> list = publishHouseDao.findPublishHouseBy(currentPage, pageSize,keywords); // 求当前页的集合数据
		PageBean<PublishHouse> pb = new PageBean<>();
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
	public List<PublishHouse> findPublishHouseById(int publishHouseId) {
		return publishHouseDao.findPublishHouseById(publishHouseId);
	}

	@Override
	public List<PublishHouse> findAll() {
		return publishHouseDao.findAll();
	}
}
