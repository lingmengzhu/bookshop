package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import book.entity.Author;
import book.entity.PageBean;
import book.entity.PublishHouse;
import book.service.PublishHouseService;
import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("publishHouseAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class PublishHouseAction extends ActionSupport implements ModelDriven<PublishHouse> {
	 PublishHouse publishHouse = new PublishHouse();
	 private String keywords;
	 private int publishHouseId;
	 

	public int getPublishHouseId() {
		return publishHouseId;
	}

	public void setPublishHouseId(int publishHouseId) {
		this.publishHouseId = publishHouseId;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public PublishHouse getPublishHouse() {
		return publishHouse;
	}

	public void setPublishHouse(PublishHouse publishHouse) {
		this.publishHouse = publishHouse;
	}

	@Autowired
	private PublishHouseService publishHouseService;
	private List<PublishHouse> list = null;

	public List<PublishHouse> getList() {
		return list;
	}

	public void setList(List<PublishHouse> list) {
		this.list = list;
	}

	private int currentPage = 1; // 当前页
	private int pageSize = 2;// 默认每页显示条数
	private PageBean<PublishHouse> pb; // ${pb}

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

	public PageBean<PublishHouse> getPb() {
		return pb;
	}

	public void setPb(PageBean<PublishHouse> pb) {
		this.pb = pb;
	}

	
	// 查询出版社
		@Action(value = "/admin/findPublishHouseBy", results = { @Result(name = "success", location = "/bookshop_admin/book_publishmg.jsp") })
		public String findPublishHouseBy() {
			if (keywords != null) {
				keywords = keywords.trim();
			}
			pageSize=6;
			pb = publishHouseService.findPublishHouseBy(currentPage, pageSize, keywords);
			this.setPb(pb);
			return "success";
		}
	// 根据Id查询出版社
	@Action(value = "/admin/findPublishHouseById")
	public void findAllPublishHouseById() {
		try {
			publishHouseId=publishHouse.getPublishHouseId();
			List<PublishHouse> list= publishHouseService.findPublishHouseById(publishHouseId);
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			out.write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 查询出版社
		@Action(value = "/admin/findAllPublishHouse")
		public void findAllPublishHouse() {
			try {
				List<PublishHouse> list= publishHouseService.findAll();
				HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
				response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
				PrintWriter out = response.getWriter();
				String json = JSONArray.fromObject(list).toString();
				out.write(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	// 添加信息
	@Action(value = "/admin/addPublishHouse", results = {
			@Result(name = "success", location = "/admin/findPublishHouseBy", type = "redirect") })
	public String addPublishHouse() {
		try {
			publishHouseService.addPublishHouse(publishHouse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	// 删除信息
	@Action(value = "/admin/delPublishHouse", results = {
			@Result(name = "success", location = "/admin/findPublishHouseBy", type = "redirect") })
	public String delPublishHouse() {
		try {
			publishHouseService.delPublishHouse(publishHouse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	// 更新信息
	@Action(value = "/admin/updatePublishHouse", results = {
			@Result(name = "updatePublishHouse", location = "/admin/findPublishHouseBy", type = "redirect") })
	public String updatePublishHouse() {
		try {
			publishHouseService.updatePublishHouse(publishHouse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updatePublishHouse";
	}

	@Override
	public PublishHouse getModel() {
		// TODO Auto-generated method stub
		return publishHouse;
	}

}
