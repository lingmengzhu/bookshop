function add(){
	var num=$("#num").val();
	c=parseInt(num)+1;
	$("#num").val(c);
}
function reduce(){
	var num=$("#num").val();
	if(parseInt(num)>1){
	num=num-1;
	}
	$("#num").val(num);
}
function transformAction(){
	$("#bookPay").attr("action","directPay.action");
	$("#bookPay").removeAttr("target");
	$("#bookPay").submit();
}
$(function(){ 
	var bookOneTypeId=$("#bookOneTypeId").val();
       $.ajax({url:"showBookByOneType.action",
	   async:false,
	   method:"get",
	   dataType:"json",
	   data:{formdata:bookOneTypeId},
	   success:function(data){
	   $(data).each(function(i, n) {
		   var inputstr = "";
		   inputstr += '<a href="findBookByBookISBN?bookISBN='+n.bookISBN+'"><img src='+n.bookImage+'></a>';
		   inputstr += '<a>'+n.bookName+'</a><br>';
		   inputstr += '<span><i class="fa fa-jpy"></i>'+n.bookUnitPrice+'</span>';
		   $("#showbook li:eq("+i+")").append(inputstr);
	   });
	},
        error:function(){
	    toastr.warning("图片加载失败");
     }
   })
})