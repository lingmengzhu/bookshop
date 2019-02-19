package book.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tab_booktwotype")
public class BookTwoType {

	@Id
	@GeneratedValue(generator = "bookTwoTypeId")
	@GenericGenerator(name = "bookTwoTypeId", strategy = "native")
	private Integer bookTwoTypeId;// 书籍一级类别id
	@ManyToOne
	@JoinColumn(name = "bookOneTypeId")
	private BookOneType bookOneType;
	private String name;// 书籍二级类别

	public Integer getBookTwoTypeId() {
		return bookTwoTypeId;
	}

	public void setBookTwoTypeId(Integer bookTwoTypeId) {
		this.bookTwoTypeId = bookTwoTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "BookTwoType [bookTwoTypeId=" + bookTwoTypeId + ", name=" + name + "]";
	}
}
