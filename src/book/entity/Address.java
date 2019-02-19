package book.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tab_address")
public class Address {
	@Id
	@GeneratedValue(generator = "addressId")
	@GenericGenerator(name = "addressId", strategy = "native")
	private int addressId;
	@ManyToOne
	@JoinColumn(name = "userName", referencedColumnName = "userName")
	private User user;// 用户实体类
	private String province;// 省份
	private String city;// 城市
	private String detailAddress;// 详细地址
	private int postalCode;// 邮编
	private String telNumber;// 联系电话
	private String relName;// 真实姓名
	private int defaultAddress;// 默认地址，默认为false（不是默认地址），ture（为默认地址）

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public Integer getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(Integer postalCode) {
		this.postalCode = postalCode;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getTelNumber() {
		return telNumber;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}

	public String getRelName() {
		return relName;
	}

	public void setRelName(String relName) {
		this.relName = relName;
	}

	

	public int getDefaultAddress() {
		return defaultAddress;
	}

	public void setDefaultAddress(int defaultAddress) {
		this.defaultAddress = defaultAddress;
	}

	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", user=" + user + ", province=" + province + ", city=" + city
				+ ", detailAddress=" + detailAddress + ", postalCode=" + postalCode + ", telNumber=" + telNumber
				+ ", relName=" + relName + ", defaultAddress=" + defaultAddress + "]";
	}

}
