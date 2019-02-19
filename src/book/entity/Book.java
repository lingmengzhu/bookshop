package book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tab_book")
public class Book {
	@Id
	@GeneratedValue(generator = "bookISBN")
	@GenericGenerator(name = "bookISBN", strategy = "native")
	private int bookISBN;// 图书编号
	private String bookName;// 图书名
	private String bookImage;// 图书图片
	private Double bookUnitPrice;// 图书单价
	private String addTime;// 图书上架时间
	private int bookStock;
	@ManyToOne
	@JoinColumn(name = "bookOneTypeId")
	private BookOneType bookOneType;
	@ManyToOne
	@JoinColumn(name = "bookTwoTypeId")
	private BookTwoType bookTwoType;
	@Column(name = "bookIntroduction", columnDefinition = "TEXT", nullable = true)
	private String bookIntroduction;// 图书简介
	@ManyToOne
	@JoinColumn(name = "authorId")
	private Author author;// 作者实体类
	@ManyToOne
	@JoinColumn(name = "publishHouseId")
	private PublishHouse publishHouse;// 出版社实体类

	public BookOneType getBookOneType() {
		return bookOneType;
	}

	public void setBookOneType(BookOneType bookOneType) {
		this.bookOneType = bookOneType;
	}

	public int getBookStock() {
		return bookStock;
	}

	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}

	public int getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(int bookISBN) {
		this.bookISBN = bookISBN;
	}

	public String getAddTime() {
		return addTime;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}

	public Double getBookUnitPrice() {
		return bookUnitPrice;
	}

	public void setBookUnitPrice(Double bookUnitPrice) {
		this.bookUnitPrice = bookUnitPrice;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public String getBookIntroduction() {
		return bookIntroduction;
	}

	public void setBookIntroduction(String bookIntroduction) {
		this.bookIntroduction = bookIntroduction;
	}

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

	public void setBookISBN(Integer bookISBN) {
		this.bookISBN = bookISBN;
	}

	public BookTwoType getBookTwoType() {
		return bookTwoType;
	}

	public void setBookTwoType(BookTwoType bookTwoType) {
		this.bookTwoType = bookTwoType;
	}

	@Override
	public String toString() {
		return "Book [bookISBN=" + bookISBN + ", bookName=" + bookName + ", bookImage=" + bookImage + ", bookUnitPrice="
				+ bookUnitPrice + ", addTime=" + addTime + ", bookStock=" + bookStock + ", bookOneType=" + bookOneType
				+ ", bookTwoType=" + bookTwoType + ", bookIntroduction=" + bookIntroduction + ", author=" + author
				+ ", publishHouse=" + publishHouse + "]";
	}

	
}
