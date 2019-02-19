package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import book.entity.Book;
import book.entity.Order;
import book.entity.PageBean;
import book.service.BookService;
import book.service.OrderService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("bookAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class BookAction extends ActionSupport implements ModelDriven<Book>,ServletRequestAware,ServletResponseAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Book book = new Book();
	private String condition;
	private String keywords;
	private Integer bookISBN;
	private HttpServletRequest request ;
	private HttpServletResponse response;

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		return book;
	}

	@Autowired
	private BookService bookService;
	private List<Book> list = null;
	@Autowired
	private OrderService orderService;
	
	public List<Book> getList() {
		return list;
	}

	public void setList(List<Book> list) {
		this.list = list;
	}

	private int currentPage = 1; // 当前页
	private int pageSize = 4;// 默认每页显示条数
	private PageBean<Book> pb; // ${pb}

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

	public PageBean<Book> getPb() {
		return pb;
	}

	public void setPb(PageBean<Book> pb) {
		this.pb = pb;
	}

	// 根据bookISBN查询书籍信息
		@Action(value = "/admin/findBook")
		public void findBook() {
			try {
				bookISBN = book.getBookISBN();
				List<Book> list = bookService.findBook(bookISBN);
				HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
				response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
				PrintWriter out = response.getWriter();
				String json = JSONArray.fromObject(list).toString();
				out.write(json);
				System.out.println(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	@Action(value="findBookByAuthorId")//根据authorId查询图书
	public void findBookByAuthorId(){
		int authorId=Integer.parseInt(request.getParameter("authorId"));
		list = bookService.findBookByAuthorId(authorId);
	}
	// 根据bookISBN查询书籍信息
		@Action(value = "findBookByBookISBN",results = {
				@Result(name = "success", location = "/book_information.jsp") })
		public String findBookByBookISBN() {
			try {
			    bookISBN=Integer.parseInt(request.getParameter("bookISBN"));
				List<Book> list = bookService.findBook(bookISBN);
				book=list.get(0);
				this.setBook(book);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "success";
			
		}
		// 根据keywords查询对应name数据
				@Action(value = "/admin/findByKeywords", results = {
						@Result(name = "findConditionByKeywords", location = "/bookshop_admin/book_bmanage.jsp") })
				public String findByKeywords() {
					if (keywords != null) {
						keywords = keywords.trim();
					}
					pageSize=6;
					String condition="bookName";
					pb = bookService.findConditionByKeywords(currentPage, pageSize, condition, keywords);
					this.setPb(pb);
					return "findConditionByKeywords";
				}
	// 主页搜索框
		@Action(value = "findBookByKeywords", results = {
				@Result(name = "success", location = "/book_cort.jsp") })
		public String findBookByKeywords() {
			try {
				keywords=request.getParameter("keywords");
				int bookOneTypeId=Integer.parseInt(request.getParameter("bookOneTypeId"));
				pageSize=8;
				pb = bookService.findBookByKeywords(currentPage, pageSize, bookOneTypeId, keywords);
				this.setPb(pb);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "success";
		}
	// 根据keywords查询对应condition数据  后台
		@Action(value = "/admin/findConditionByKeywords", results = {
				@Result(name = "findConditionByKeywords", location = "/bookshop_admin/book_bmanage.jsp") })
		public String findConditionsByKeywords() {
			if (keywords != null) {
				keywords = keywords.trim();
			}
			pageSize=6;
			pb = bookService.findConditionByKeywords(currentPage, pageSize, condition, keywords);
			this.setPb(pb);
			return "findConditionByKeywords";
		}
		
	@Action(value = "findCondition")//新书上架		
	public void findCondition() {
		try{
		pageSize=15;
		currentPage=Integer.parseInt(request.getParameter("formdata"));
		System.out.println(currentPage);
		pb = bookService.findConditionByKeywords(currentPage, pageSize, condition, keywords);
		list=pb.getList();
		response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
		PrintWriter out = null;
		out = response.getWriter();
		String json = JSONArray.fromObject(list).toString();
		out.write(json);
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Action(value = "findNewBooksAjax")//新书异步
	public void findNewBooksAjax() {
		try {
		pageSize=10;
		pb = bookService.findConditionByKeywords(currentPage, pageSize, condition, keywords);
		list=pb.getList();
		response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
		PrintWriter out = null;
		out = response.getWriter();
		String json = JSONArray.fromObject(list).toString();
		out.write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Action(value = "findIndexCondition", results = {//跳转首页
			@Result(name = "success", location = "/book_index.jsp") })
	public String findIndexCondition() {
		
		pb = bookService.findConditionByKeywords(currentPage, pageSize, condition, keywords);
		this.setPb(pb);
		pb.getList().get(0).toString();
		return "success";
	}
	@Action(value = "findSellWellByOrder",results = {
			@Result(name = "success", location = "/book_wellsell.jsp") }) // 图书畅销（推荐）榜
	public String findSellWellByOrder() {
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();// 获取一个Date对象
		String currentdate = sdf.format(date);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -10);// 今天往前10天
		Date agodate = c.getTime();
		String tenagodate = (sdf.format(agodate));
		List<Book> booklist= bookService.findBookHotByOrder(tenagodate, currentdate);
		if(booklist.size()>15){
			for(int i=0;i<15;i++){
			Book book=booklist.get(i);
			System.out.println(book.toString());
			list.add(book);
			}	
			}else{
				list=booklist;
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return "success";
	}
//图书推荐
	@Action(value = "findHotBookByOrder",results = { @Result(name = "success", location = "/book_hot.jsp") })
	public String findHotBookByOrder() {
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();// 获取一个Date对象
		String currentdate = sdf.format(date);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -10);// 今天往前10天
		Date agodate = c.getTime();
		String tenagodate = (sdf.format(agodate));
		List<Book> booklist= bookService.findBookHotByOrder(tenagodate, currentdate);
		if(booklist.size()>15){
			for(int i=0;i<15;i++){
			Book book=booklist.get(i);
			System.out.println(book.toString());
			list.add(book);
			}	
			}else{
				list=booklist;
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "findHotBookByOrderAjax") // 热门书籍推荐异步显示
	public void findHotBookByOrderAjax() {
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();// 获取一个Date对象
		String currentdate = sdf.format(date);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -10);// 今天往前10天
		Date agodate = c.getTime();
		String tenagodate = (sdf.format(agodate));
		List<Book> booklist= bookService.findBookHotByOrder(tenagodate, currentdate);
		response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
		PrintWriter out;
		out = response.getWriter();
		String json = JSONArray.fromObject(booklist).toString();
		out.write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	// 添加信息
	@Action(value = "/admin/addBook", results = {
			@Result(name = "success", location = "/admin/findConditionByKeywords", type = "redirect") })
	public String addBook() {
		Date d = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		book.setAddTime(sdf.format(d));
		try {
			bookService.addBook(book);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	// 删除信息
	@Action(value = "/admin/delBook", results = {
			@Result(name = "success", location = "/admin/findConditionByKeywords", type = "redirect") })
	public String delBook() {
		try {
			List<Order> orderlist=(List<Order>) orderService.findOrderByBookISBN(Integer.parseInt(request.getParameter("bookISBN")));
			if(orderlist==null){
				
				}else{
					for(int i=0;i<orderlist.size();i++){
						Order order=orderlist.get(i);
						orderService.delOrder(order);
			}}
		bookService.delBook(book);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "success";
	}
	// 更新信息
	@Action(value = "/admin/updateBook", results = {
			@Result(name = "success", location = "/admin/findConditionByKeywords", type = "redirect") })
	public String updateBook() {
		try {
			bookService.updateBook(book);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	@Action(value = "showBookByOneType")//图书详细信息下的推荐图书
	public void showBookByOneType(){
		try {
			System.out.println(request.getParameter("formdata"));
			int bookOneTypeId =Integer.parseInt(request.getParameter("formdata"));
			pb = bookService.showBookByOneType(currentPage, pageSize,bookOneTypeId);
			list=pb.getList();
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			System.out.println(json);
			out.write(json);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	@Action(value = "findBookByTwoType", results = {//查询分类下图书
			@Result(name = "success", location = "/book_cort.jsp") })
	public String findBookByTwoType() {
		try {
			keywords=request.getParameter("bookTwoTypeId");
			pb = bookService.findConditionByKeywords(currentPage, pageSize, condition, keywords);
			this.setPb(pb);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response=response;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}

}
