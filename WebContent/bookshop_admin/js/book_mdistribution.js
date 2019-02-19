$(function(){ 
       $.ajax({url:"../admin/findAllPublishHouse.action",
	   async:false,
	   method:"get",
	   dataType:"json",
	   success:function(data){
	   $(data).each(function(i, n) {
		   var inputstr = "";
		   inputstr += '<option value="'+n.publishHouseId+'">'+n.publishHouseName+'</option>';
		   $("#publishHouseId").append(inputstr);
	   });
	},
        error:function(){
	    alert("图片加载失败");
     }
   })
})