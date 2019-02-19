package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import book.entity.Address;
import book.entity.Book;
import book.entity.Order;
import book.entity.PageBean;
import book.service.AddressService;
import book.service.OrderService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("orderAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class OrderAction extends ActionSupport
		implements ModelDriven<Order>, ServletRequestAware, ServletResponseAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	Order order = new Order();
	private List<Order> list = null;
	private int deliverStatus;

	public int getDeliverStatus() {
		return deliverStatus;
	}

	public void setDeliverStatus(int deliverStatus) {
		this.deliverStatus = deliverStatus;
	}

	private String formdate;
	

	public String getFormdate() {
		return formdate;
	}

	public void setFormdate(String formdate) {
		this.formdate = formdate;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Autowired
	private OrderService orderService;
	@Autowired
	private AddressService addressService;
	Address address=null;
	List<Address> addressList=null;
	public List<Address> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}

	public List<Order> getList() {
		return list;
	}

	public void setList(List<Order> list) {
		this.list = list;
	}

	private int currentPage = 1; // 当前页
	private int pageSize = 4;// 默认每页显示条数
	private PageBean<Order> pb; // ${pb}

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

	public PageBean<Order> getPb() {
		return pb;
	}

	public void setPb(PageBean<Order> pb) {
		this.pb = pb;
	}

	@Action(value = "addOrder") // 添加订单到购物车
	public void addOrder() {
		try {
			orderService.addOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action(value = "/admin/deliver", results = {
			@Result(name = "success", location = "/admin/findOrder", type = "redirect") })
	public String deliver() {
		deliverStatus=2;
		pb = orderService.findOrder(currentPage, pageSize,deliverStatus);
		int count=pb.getList().size();
		for(int i = 0 ; i < count ; i++) {
		try {
		    order=pb.getList().get(i);
			order.setDeliverStatus(1);
		    Date date=new Date();
			orderService.updateOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		return "success";
	}
	
	//查找订单
		@Action(value="/admin/findOrder", results = {
				@Result(name = "findOrder", location = "/bookshop_admin/book_order.jsp") })
		public String findAllOrder() {
			deliverStatus=order.getDeliverStatus();
			pageSize=6;
			pb = orderService.findOrder(currentPage, pageSize,deliverStatus);
			this.setPb(pb);
			return "findOrder";
		}
	@Action(value = "delSelectOrder") // 删除购物车内订单
	public void delSelectOrder() {
		try {
			formdate = request.getParameter("formdate");
			JSONArray json=JSONArray.fromObject(formdate);
			JSONObject jsonOne;
			for(int i=0;i<json.size();i++){
			          jsonOne = json.getJSONObject(i);
			          String orderId=(String) jsonOne.get("orderNumber");
			          int orderNumber = Integer.parseInt(orderId);
			          System.out.println(orderNumber);
			          order.setOrderNumber(orderNumber);
			          orderService.delOrder(order);
			 }
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Action(value = "/admin/findOrderByPublishHouseAjax") // 根据出版社查询销售情况 分页 时间自选
	public void findOrderByPublishHouseAjax() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formdate = request.getParameter("formdate");
			JSONArray json=JSONArray.fromObject(formdate);
			int publishHouseId = Integer.parseInt((String) json.getJSONObject(0).get("publishHouseId"));
			String tenagodate = (String) json.getJSONObject(0).get("dayago1");
			String currentdate = (String) json.getJSONObject(0).get("dayago2");
			System.out.println(publishHouseId);
			System.out.println(tenagodate);
			System.out.println(currentdate);
		List<Order> orderlist= orderService.findOrderByPublishHouse(publishHouseId,tenagodate, currentdate);
		response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
		PrintWriter out;
		out = response.getWriter();
		String json1 = JSONArray.fromObject(orderlist).toString();
		out.write(json1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
	@Action(value = "updateSelectOrder") // 结算购物车内订单更换状态正在支付
	public void updateSelectOrder() {
		try {
			formdate = request.getParameter("formdate");
			JSONArray json=JSONArray.fromObject(formdate);
			JSONObject jsonOne;
			for(int i=0;i<json.size();i++){
			          jsonOne = json.getJSONObject(i);
			          String orderId=(String) jsonOne.get("orderNumber");
			          int orderNumber = Integer.parseInt(orderId);
			          String count=(String) jsonOne.get("bookCount");
			          int bookCount = Integer.parseInt(count);
			          order=orderService.findOrder(orderNumber);
			          order.setPayStatus(2);
			          order.setBookCount(bookCount);
			          orderService.updateOrder(order);
			 }
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Action(value = "paySelectOrder") // 结算正在支付的订单
	public void paySelectOrder() {
		try {
			formdate = request.getParameter("formdate");
			JSONArray json=JSONArray.fromObject(formdate);
			JSONObject jsonOne;
			for(int i=0;i<json.size();i++){
			          jsonOne = json.getJSONObject(i);
			          String orderId=(String) jsonOne.get("orderNumber");
			          int orderNumber = Integer.parseInt(orderId);
			          order=orderService.findOrder(orderNumber);
			          System.out.println(order.toString());
			          Date date=new Date();
			          SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			          /*String userName=order.getUser().getUserName();
			          address=addressService.findAddress(userName);
			          order.setProvice(address.getProvince());
			          order.setCity(address.getCity());
			          order.setDetailAddress(address.getDetailAddress());*/
			          order.setPayStatus(1);
			          order.setPayTime(sdf.format(date));
			          orderService.updateOrder(order);
			 }
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Action(value = "delOrder", results = {
			@Result(name = "success", location = "findOrderByUserName", type = "redirect") }) // 删除购物车内订单
	public String delOrder() {
		try {
			orderService.delOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "findPayOrderByUserName", results = { @Result(name = "success", location = "/book_shopcart.jsp")}) // 通过用户名找到用户已支付订单信息
	public String findPayOrderByUserName() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			list = orderService.findPayOrderByUserName(userName);
			System.out.println(list.get(0).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Action(value = "findOrderByUserName", results = { @Result(name = "success", location = "/book_shopcart.jsp") }) // 通过用户名找到用户购物车信息
	public String findOrderByUserName() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			List<Order> uselist=orderService.findPayingOrderByUserName(userName);
            for(int i=0;i<uselist.size();i++){
            	uselist.get(i).setPayStatus(0);
            	orderService.updateOrder(uselist.get(i));
            }
			list = orderService.findOrderByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "directPay", results = { @Result(name = "success", location = "findPayingOrderByUserName",type="redirect") }) // 直接购买
	public String directPay() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			List<Order> uselist=orderService.findPayingOrderByUserName(userName);
            for(int i=0;i<uselist.size();i++){
            	uselist.get(i).setPayStatus(0);
            	orderService.updateOrder(uselist.get(i));
            }
			order.setPayStatus(2);
			orderService.addOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Action(value = "findPayingOrderByUserName", results = { @Result(name = "success", location = "/book_fillorder.jsp") }) // 通过用户名找到正在支付信息
	public String findPayingOrderByUserName() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			address=addressService.findDefaultAddressByUserName(userName);
			this.setAddress(address);
			list = orderService.findPayingOrderByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "updateOrder") // 付款更换状态
	public void updateOrders() {
		try {
			orderService.updateOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action(value = "findBalanceOrderByUserName",results = { @Result(name = "success", location = "/book_myorder.jsp") }) //用户查询已支付自己的订单
	public String findBalanceOrderByUserName() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			list = orderService.findBalanceOrderByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "UserDelectOrder",results = { @Result(name = "success", location = "/findBalanceOrderByUserName",type="redirect") }) //用户查询已支付自己的订单
	public String UserDelectOrder() {
		try {
			int orderNumber=Integer.parseInt(request.getParameter("orderNumber"));
			order=orderService.findOrder(orderNumber);
			order.setPayStatus(3);
			orderService.updateOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "findYesOrderByUserName",results = { @Result(name = "success", location = "/book_myorder.jsp") }) //用户查询已支付自己的订单
	public String findYesOrderByUserName() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			list = orderService.findYesOrderByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "findNoOrderByUserName",results = { @Result(name = "success", location = "/book_myorder.jsp") }) //用户查询已支付自己的订单
	public String findNoOrderByUserName() {
		try {
			String userName = (String) request.getSession().getAttribute("userName");
			list = orderService.findNoOrderByUserName(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "findOrderByOrderNumber",results = { @Result(name = "success", location = "/book_orderdetails.jsp") }) //用户查询已支付自己的订单的详细信息
	public String findOrderByOrderNumber() {
		try {
			int orderNumber=Integer.parseInt(request.getParameter("orderNumber"));
			order=orderService.findOrderByOrderNumber(orderNumber);
			String userName=order.getUser().getUserName();
			address=(Address) addressService.findDefaultAddressByUserName(userName);
			this.setAddress(address);
			this.setOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Override
	public Order getModel() {
		// TODO Auto-generated method stub
		return order;
	}
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
