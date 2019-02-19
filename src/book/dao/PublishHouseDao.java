package book.dao;

import java.util.List;

import book.entity.PublishHouse;

public interface PublishHouseDao {

	void updatePublishHouse(PublishHouse publishHouse);

	void delPublishHouse(PublishHouse publishHouse);

	void addPublishHouse(PublishHouse publishHouse);

	int getPublishHouseCount(String keywords);

	List<PublishHouse> findPublishHouseBy(int currentPage, int pageSize, String keywords);

	List<PublishHouse> findPublishHouseById(int publishHouseId);

	List<PublishHouse> findAll();

}
