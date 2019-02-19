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
function orderselect(){
	var publishHouseId=$("#publishHouseId").val();
	var dayago1=$("#dayago1").val();
	var dayago2=$("#dayago2").val();
	var publishItemArray = new Array();
	var publishItemObj = new Object(); 
	if(publishHouseId!=null && dayago1!=null && dayago2!=null && publishHouseId!="" && dayago1!="" && dayago2!=""){
		dayago1 +=' 00:00:00';
		dayago2 +=' 00:00:00';
		var publishHouseIdAjax="publishHouseId";
		var dayago1Ajax="dayago1";
		var dayago2Ajax="dayago2";
		publishItemObj[publishHouseIdAjax] = publishHouseId; 
		publishItemObj[dayago1Ajax] = dayago1;
		publishItemObj[dayago2Ajax] = dayago2;
		publishItemArray.push(publishItemObj);
		  $("#publishOrder tr.move").empty();
	    $.ajax({url:"../admin/findOrderByPublishHouseAjax.action",
		   async:false,
		   method:"get",
		   dataType:"json",
		   contentType:"application/json;charset=utf-8",
		   data:{
         	  formdate:JSON.stringify(publishItemArray)
         	  },  
		   success:function(data){
		   $(data).each(function(i, n) {
			   var inputstr = "";
			   inputstr += '<tr class="move"><td>'+n.book.bookName+'</td>';
			   inputstr += '<td>'+n.bookCount+'</td>';
			   inputstr += '<td>'+n.book.bookUnitPrice+'</td>';
			   inputstr += '<td>'+n.book.bookUnitPrice*n.bookCount+'</td><tr>';
			   $("#publishOrder").prepend(inputstr);
		   });
		},
	        error:function(){
	     }
	   })
	}else{
		alert("请选择时间范围和选择出版社");
	}
}