package book.service;

import java.util.List;

import book.entity.Address;

public interface AddressService {

	void addAddress(Address address);

	void delAddress(Address address);

	void updateAddress(Address address);

	List<Address> findAddress(String userName);

	void setTheDefaultAddress(Address address);
	Address find(int id);

	Address findDefaultAddressByUserName(String userName);

}