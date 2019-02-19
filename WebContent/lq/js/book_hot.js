$(function(){ 
    $.ajax({url:"findNewBooksAjax.action",
	   async:false,
	   method:"get",
	   dataType:"json",
	   success:function(data){
	   $(data).each(function(i, n) {
		   var inputstr = "";
		   var m=i+1;
		   inputstr += '<div class="book_right_icon0'+m+'"></div>';
		   inputstr += '<a href="findBookByBookISBN?bookISBN='+n.bookISBN+'"><div class="book_right_name1">'+n.bookName+'</div></a>';
		   $("#hotbook li:eq("+i+")").append(inputstr);
		   /*var inputstr2 ="";
		   inputstr2 += '<a href="findBookByBookISBN?bookISBN='+n.bookISBN+'" style="color:black"><div class="book_hot_name01">'+n.bookName+'</div></a>';
		   $("#wellsell li:eq("+i+")").append(inputstr2);*/
	   });
	},
     error:function(){
	    toastr.warning("图片加载失败");
  }
})
})