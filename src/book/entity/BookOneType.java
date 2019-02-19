package book.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "tab_bookonetype")
public class BookOneType {
	@Id
	@GeneratedValue(generator = "bookOneTypeId")
	@GenericGenerator(name = "bookOneTypeId", strategy = "native")
	private int bookOneTypeId;// 书籍类别id
	private String name;// 书籍一级类别

	

	public int getBookOneTypeId() {
		return bookOneTypeId;
	}

	public void setBookOneTypeId(int bookOneTypeId) {
		this.bookOneTypeId = bookOneTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "BookType [bookOneTypeId=" + bookOneTypeId + ", name=" + name + "]";
	}

}
