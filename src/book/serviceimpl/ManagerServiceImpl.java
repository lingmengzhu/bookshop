package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import book.dao.ManagerDao;
import book.entity.Manager;
import book.service.ManagerService;

@Service("managerService")
@Transactional
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	@Override
	public List<Manager> managerlogin(Manager manager) {
		// TODO Auto-generated method stub
		return managerDao.managerlogin(manager);
	}

}
