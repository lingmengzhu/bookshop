package book.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import book.entity.Manager;
import book.service.ManagerService;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("managerAction") // 创建对象
@Scope("prototype") // 多实例方式创建对象
public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Manager manager=new Manager();
    HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	@Autowired
	private ManagerService managerService;
	@Action(value = "managerlogin", results = {
			@Result(name = "success",location = "/bookshop_admin/index.jsp"),@Result(name = "error",location = "/login.jsp") })
	public String managerlogin() {
		try {
		List<Manager> existmanager=managerService.managerlogin(manager);
		String tablemanager=existmanager.get(0).getManagerPassword();
		String jspmanager=manager.getManagerPassword();
		if(tablemanager.equals(jspmanager)){
			session.setAttribute("admin","sss");
			return "success";
        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	@Action(value = "sign_out", results = {@Result(name = "success",location = "/login.jsp")})
	public String sign_out() {
		session.removeAttribute("admin");
		return "success";
	}
	@Override
	public Manager getModel() {
		// TODO Auto-generated method stub
		return manager;
	}

}
