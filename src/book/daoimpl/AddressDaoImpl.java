package book.daoimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import book.dao.AddressDao;
import book.entity.Address;

@Repository("addressDao")
public class AddressDaoImpl implements AddressDao {
	@Autowired // 按类型注入
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addAddress(Address address) {
		hibernateTemplate.save(address);
	}

	@Override
	public void delAddress(Address address) {
		hibernateTemplate.delete(address);
	}

	@Override
	public void updateAddress(Address address) {
		hibernateTemplate.update(address);
	}

	@Override
	public List<Address> findAddress(String userName) {
		List<Address> list= (List<Address>) hibernateTemplate.find("from Address where userName=?",userName);
		return list;
	}

	@Override
	public void setTheDefaultAddress(Address address) {
		hibernateTemplate.update(address);
	}

	@Override
	public Address find(int id) {
		return hibernateTemplate.get(Address.class,id);
	}

	@Override
	public Address findDefaultAddressByUserName(String userName) {
		// TODO Auto-generated method stub
		List<Address> list= (List<Address>) hibernateTemplate.find("from Address where userName=? and defaultAddress=?",userName,1);
		return list.isEmpty()?null:list.get(0);
	}
}
