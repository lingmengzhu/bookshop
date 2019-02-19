package book.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tab_order")

public class Order {
	@Id
	@GeneratedValue(generator = "orderNumber")
	@GenericGenerator(name = "orderNumber", strategy = "native")
	private int orderNumber;// 订单id
	@ManyToOne
	@JoinColumn(name = "bookISBN")
	private Book book;// 图书实体类
	@ManyToOne
	@JoinColumn(name = "userName")
	private User user;//用户实体类
	@ManyToOne
	@JoinColumn(name = "authorId")
	private Author author;// 作者实体类
	@ManyToOne
	@JoinColumn(name = "publishHouseId")
	private PublishHouse publishHouse;// 出版社实体类
	private String deliveTime;// 发货时间
	private int deliverStatus;// 发货状态，默认为（0未发货）（1已发货）
	private String payTime;// 订单支付时间
	private int payStatus;// 支付状态，默认为（0未支付）（1已支付）
	private int bookCount;// 图书数量
    private String provice;
    private String city;
    private String detailAddress;
    
	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public PublishHouse getPublishHouse() {
		return publishHouse;
	}

	public void setPublishHouse(PublishHouse publishHouse) {
		this.publishHouse = publishHouse;
	}

	public String getProvice() {
		return provice;
	}

	public void setProvice(String provice) {
		this.provice = provice;
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

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	
	public String getDeliveTime() {
		return deliveTime;
	}

	public void setDeliveTime(String deliveTime) {
		this.deliveTime = deliveTime;
	}

	public String getPayTime() {
		return payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	public int getDeliverStatus() {
		return deliverStatus;
	}

	public void setDeliverStatus(int deliverStatus) {
		this.deliverStatus = deliverStatus;
	}

	public int getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	public Integer getBookCount() {
		return bookCount;
	}

	public void setBookCount(Integer bookCount) {
		this.bookCount = bookCount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Order [orderNumber=" + orderNumber + ", book=" + book + ", user=" + user + ", deliveTime=" + deliveTime
				+ ", deliverStatus=" + deliverStatus + ", payTime=" + payTime + ", payStatus=" + payStatus
				+ ", bookCount=" + bookCount + ", provice=" + provice + ", city=" + city + ", detailAddress="
				+ detailAddress + "]";
	}

	
	

	
}
