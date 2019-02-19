/**
 * 
 */
function repass(){
	var password=$("#password").val();
	var password1=$("#password1").val();
	var newpassword=$("#newpassword").val();
	var REnewpassword=$("#REnewpassword").val();
	var rxpasw = /^[a-zA-Z0-9]{6,12}$/;
	if(password==null||password==""){
		toastr.warning("原密码不能为空");
		return false;
	}
	else if(!rxpasw.test(password)){
		toastr.warning("原密码格式不正确");
		return false;
	}
	else  if(password!=password1){
		toastr.warning("原密码不正确");
		return false;
	}
	else if(newpassword==null||newpassword==""){
		toastr.warning("新密码不能为空");
		return false;
	}
	else if(!rxpasw.test(newpassword)){
		toastr.warning("新密码格式不正确");
		return false;
	}
	else if(newpassword!=REnewpassword){
		toastr.warning("两次密码不一致");
		return false;
	}
	else {
		  toastr.success("修改成功");
		  setTimeout('submit()',1300);

	}
		
}				
function submit(){
	$(".form").submit();
} 