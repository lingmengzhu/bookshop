package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import book.entity.Author;
import book.entity.Book;
import book.entity.PageBean;
import book.service.AuthorService;
import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("authorAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class AuthorAction extends ActionSupport implements ModelDriven<Author>,ServletRequestAware,ServletResponseAware {
    Author author = new Author();
	private int authorId;
	private HttpServletRequest request ;
	private HttpServletResponse response;
	private String keywords;
	
	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public Integer getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

	@Autowired
	private AuthorService authorService;
	private List<Author> list = null;

	public List<Author> getList() {
		return list;
	}

	public void setList(List<Author> list) {
		this.list = list;
	}

	private int currentPage = 1; // 当前页
	private int pageSize = 2;// 默认每页显示条数
	private PageBean<Author> pb; // ${pb}

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

	public PageBean<Author> getPb() {
		return pb;
	}

	public void setPb(PageBean<Author> pb) {
		this.pb = pb;
	}
	// 根据Id查询作者
				@Action(value = "/admin/findAuthorById")
				public void findAuthorById() {
					try {
						authorId=author.getAuthorId();
						List<Author> list= authorService.findAuthorById(authorId);
						HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
						response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
						PrintWriter out = response.getWriter();
						String json = JSONArray.fromObject(list).toString();
						out.write(json);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				// 更新信息
				@Action(value = "/admin/updateAuthor", results = {
						@Result(name = "updateAuthor", location = "/admin/findAuByAuthorId", type = "redirect") })
				public String updateInfo() {
					try {
						authorService.updateAuthor(author);
					} catch (Exception e) {
						e.printStackTrace();
					}
					return "updateAuthor";
				}
				// 根据作者Id查询作者
				@Action(value = "/admin/findAuByAuthorId", results = { @Result(name = "success", location = "/bookshop_admin/book_author.jsp") })
				public String findAuByAuthorId() {
					if (keywords != null) {
						keywords = keywords.trim();
					}
					pageSize=6;
					System.out.println("Author++"+keywords);
					pb = authorService.findAuByAuthorId(currentPage, pageSize, keywords);
					this.setPb(pb);
					return "success";
				}
	//根据订单查找热门作者
	@Action(value = "findHotAuthorByOrder",results = { @Result(name = "success", location = "/book_author.jsp") }) // 名人堂
	public String findAuthorHotByOrder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();// 获取一个Date对象
		String currentdate = sdf.format(date);
		System.out.println(currentdate);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -10);// 今天往前10天
		Date agodate = c.getTime();
		String tenagodate = (sdf.format(agodate));
		System.out.println(agodate);
		List<Author> Arlist=new ArrayList<Author>();
		List<Author> authorlist = authorService.findAuthorHotByOrder(tenagodate, currentdate);
		if(authorlist.size()>15){
			for(int i=0;i<15;i++){
			Author author=authorlist.get(i);
			Arlist.add(author);
			}	
			}else{
				Arlist=authorlist;
		}
		list=Arlist;
		return "success";
	}
	//根据订单查找热门作者页面加载 名人堂
	@Action(value = "findHotAuthorByOrderAjax") 
	public void findHotAuthorByOrderAjax() {
		try {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();// 获取一个Date对象
		String currentdate = sdf.format(date);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, -10);// 今天往前10天
		Date agodate = c.getTime();
		String tenagodate = (sdf.format(agodate));
		List<Author> list=new ArrayList<Author>();
		List<Author> authorlist = authorService.findAuthorHotByOrder(tenagodate, currentdate);
		if(authorlist.size()>4){
			for(int i=0;i<4;i++){
			Author author=authorlist.get(i);
			list.add(author);
			}	
			}else{
				list=authorlist;
		}
		HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
		response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
		PrintWriter out;
	    out = response.getWriter();
		String json = JSONArray.fromObject(list).toString();
		out.write(json);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 添加信息
	@Action(value = "/admin/addAuthor", results = {
			@Result(name = "success", location = "/admin/findAuthorByKeywords", type = "redirect") })
	public String addAuthor() {
		try {
			authorService.addAuthor(author);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Action(value = "findAuthorByAuthorId",results = {//根据作者id显示作者详情
			@Result(name = "success", location = "/author_information.jsp") })
	public String findAuthorByAuthorId() {
		try {
		    authorId=Integer.parseInt(request.getParameter("authorId"));
			author= authorService.findAuthorByAuthorId(authorId);
			this.setAuthor(author);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Override
	public Author getModel() {
		// TODO Auto-generated method stub
		return author;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	@Action(value = "/admin/findAllAuthor")
	public void findAllAuthor() {
		try {
			List<Author> list= authorService.findAllAuthor();
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			out.write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
// 根据作者Id查询作者
@Action(value = "/admin/findAuthorByKeywords", results = { @Result(name = "success", location = "/bookshop_admin/book_author.jsp") })
public String findAuthorByKeywords() {
if (keywords != null) {
	keywords = keywords.trim();
}
pageSize=6;
pb = authorService.findAuthorByKeywords(currentPage, pageSize, keywords);
this.setPb(pb);
return "success";
}

}
