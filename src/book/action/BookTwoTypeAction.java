package book.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import book.entity.BookTwoType;
import book.entity.PageBean;
import book.service.BookTwoTypeService;
import net.sf.json.JSONArray;

public class BookTwoTypeAction extends ActionSupport implements ModelDriven<BookTwoType> {
	BookTwoType bookTwoType = new BookTwoType();
	public Integer bookOneTypeId;

	public Integer getBookOneTypeId() {
		return bookOneTypeId;
	}

	public void setBookOneTypeId(Integer bookOneTypeId) {
		this.bookOneTypeId = bookOneTypeId;
	}

	@Autowired
	private BookTwoTypeService bookTwoTypeService;
	private List<BookTwoType> list = null;

	public List<BookTwoType> getList() {
		return list;
	}

	public void setList(List<BookTwoType> list) {
		this.list = list;
	}

	private int currentPage = 1; // 当前页
	private int pageSize = 2;// 默认每页显示条数
	private PageBean<BookTwoType> pb; // ${pb}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public PageBean<BookTwoType> getPb() {
		return pb;
	}

	public void setPb(PageBean<BookTwoType> pb) {
		this.pb = pb;
	}

	// 根据一级类别查询对应二级类别
	@Action(value = "findTwoType")
	public void findBookTwoType() {
		try {
			List<BookTwoType> list = bookTwoTypeService.findBookTwoType(bookOneTypeId);
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action(value = "/admin/findTwoByType")
	public void findTwoByType() {
		try {
			List<BookTwoType> list = bookTwoTypeService.findBookTwoType(bookOneTypeId);
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public BookTwoType getModel() {
		// TODO Auto-generated method stub
		return bookTwoType;
	}

}
