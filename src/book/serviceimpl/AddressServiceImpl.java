package book.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import book.dao.AddressDao;
import book.entity.Address;
import book.service.AddressService;

@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService {
	@Autowired // 注入
	private AddressDao addressDao;

	@Override
	public void addAddress(Address address) {
		addressDao.addAddress(address);

	}

	@Override
	public void delAddress(Address address) {
		addressDao.delAddress(address);

	}

	@Override
	public void updateAddress(Address address) {
		addressDao.updateAddress(address);
	}

	@Override
	public List<Address> findAddress(String userName) {
		return (List<Address>) addressDao.findAddress(userName);
	}

	@Override
	public void setTheDefaultAddress(Address address) {
		addressDao.setTheDefaultAddress(address);
	}

	@Override
	public Address find(int id) {
		return addressDao.find(id);
	}

	@Override
	public Address findDefaultAddressByUserName(String userName) {
		// TODO Auto-generated method stub
		return addressDao.findDefaultAddressByUserName(userName);
	}
}
