package book.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import book.entity.BookOneType;
import book.entity.PageBean;
import book.service.BookOneTypeService;
import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("bookTypeAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class BookOneTypeAction extends ActionSupport implements ModelDriven<BookOneType> {
	BookOneType bookOneType = new BookOneType();

	@Autowired
	private BookOneTypeService bookOneTypeService;
	private List<BookOneType> list = null;

	public List<BookOneType> getList() {
		return list;
	}

	public void setList(List<BookOneType> list) {
		this.list = list;
	}

	private int currentPage = 1; // 当前页
	private int pageSize = 2;// 默认每页显示条数
	private PageBean<BookOneType> pb; // ${pb}

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

	public PageBean<BookOneType> getPb() {
		return pb;
	}

	public void setPb(PageBean<BookOneType> pb) {
		this.pb = pb;
	}

	// 根据keywords查询对应书籍类型
	@Action(value = "findBookOneType")
	public void findBookOneType() {
		try {
			List<BookOneType> list = bookOneTypeService.findBookOneType();
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 根据keywords查询对应书籍类型
		@Action(value = "/admin/findByBookOneType")
		public void findByBookOneType() {
			try {
				List<BookOneType> list = bookOneTypeService.findBookOneType();
				HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
				response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
				PrintWriter out = response.getWriter();
				String json = JSONArray.fromObject(list).toString();
				System.out.println(json);
				out.write(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}


	@Override
	public BookOneType getModel() {
		// TODO Auto-generated method stub
		return bookOneType;
	}

}
