package book.service;

import java.util.List;

import book.entity.PageBean;
import book.entity.PublishHouse;

public interface PublishHouseService {

	void addPublishHouse(PublishHouse publishHouse);

	void delPublishHouse(PublishHouse publishHouse);

	void updatePublishHouse(PublishHouse publishHouse);

	PageBean<PublishHouse> findPublishHouseBy(int currentPage, int pageSize, String keywords);

	List<PublishHouse> findPublishHouseById(int publishHouseId);

	List<PublishHouse> findAll();

}