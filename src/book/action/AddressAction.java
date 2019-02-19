package book.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import book.entity.Address;
import book.service.AddressService;
import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("addressAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class AddressAction extends ActionSupport implements ModelDriven<Address>,ServletRequestAware,ServletResponseAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	Address address = new Address();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	String userName = (String) session.getAttribute("userName");	
	private HttpServletResponse response;
	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	@Autowired
	private AddressService addressService;
	private List<Address> list = null;

	public List<Address> getList() {
		return list;
	}

	public void setList(List<Address> list) {
		this.list = list;
	}

	

	// 根据用户名查询收货地址
	@Action(value = "findAdderssByUsername", results = { @Result(name = "success", location = "/book_myaddress.jsp") })
	public String findAdderssByUsername() {
		String userName = (String) request.getSession().getAttribute("userName");
		list=(List<Address>) addressService.findAddress(userName);
		return "success";
	}
	// 添加信息
	@Action(value = "addAddress", results = {
			@Result(name = "success", location = "findAdderssByUsername", type = "redirect")
	})
	public String addAdderss() {
		try {
			String userName=(String) request.getSession().getAttribute("userName");
			address.getUser().setUserName(userName);
			address.setDefaultAddress(0);
			addressService.addAddress(address);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	
	}
	// 删除信息
	@Action(value = "delAddress", results = {
			@Result(name = "success", location = "findAdderssByUsername", type = "redirect") })
	public String delAddress() {
		try {
			int addressId=Integer.parseInt(request.getParameter("id"));
			address=addressService.find(addressId);
			addressService.delAddress(address);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
    @Action(value = "findByAddressId")
    public void findByAddressId() {
		try {
			int addressId=Integer.parseInt(request.getParameter("formdata"));
			address=addressService.find(addressId);
			response.setContentType("text/html;charset=UTF-8"); //告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(address).toString();
			out.write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 更新信息
	@Action(value = "updateAddress",results = {
			@Result(name = "success", location = "findAdderssByUsername", type = "redirect") })
	public String updateAddress() {
		addressService.updateAddress(address);
		return "success";
	}
	//设置默认收货地址
	@Action(value="setTheDefaultAddress")
	public void setTheDefaultAddress(){
		String userName = (String) request.getSession().getAttribute("userName");
		list=(List<Address>) addressService.findAddress(userName);
		 for(int i=0;i<list.size();i++){
			 list.get(i).setDefaultAddress(0);
         	addressService.updateAddress(list.get(i));
         }
		String formdata=request.getParameter("formdata");
		id=Integer.parseInt(formdata);
		Address address=addressService.find(id);
		address.setDefaultAddress(1);
		addressService.setTheDefaultAddress(address);
		try {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Address getModel() {
		return address;
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

}
