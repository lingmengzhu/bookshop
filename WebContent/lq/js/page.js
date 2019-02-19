/* 一个简单的分页，每次点击重渲染
******by wuati*****
*/

(function ($) {
	
  //默认参数 (放在插件外面，避免每次调用插件都调用一次，节省内存)
  var defaults = {
    //id : '#paging',//id
    leng: 9,//总页数
    activeClass: 'page-active' ,//active类
    firstPage: '首页',//
    lastPage: '末页',
    prv: '«',
    next: '»',
	  clickBack:function(){
	  }
  };
  var opts,myOptions;
  //扩展
  $.fn.extend({
    //插件名称
    page: function (options) {
      //覆盖默认参数
      myOptions = options
      opts = $.extend(defaults, options);
      console.log(opts,998,this)
      //主函数
      return this.each(function () {
        //激活事件
        var obj = $(this);
        var str1 = '';
        var str = '';
        var l = opts.leng;
        if (l > 1&&l < 10) {
          str1 = '<li><a href="javascript:" class="'+ opts.activeClass +'">1</a></li>';
          for (i = 2; i < l + 1; i++) {
            str += '<li><a href="javascript:">' + i + '</a></li>';
          }
        }else if(l > 9){
          str1 = '<li><a href="javascript:" class="'+ opts.activeClass +'">1</a></li>';
          for (i = 2; i < 10; i++) {
            str += '<li><a href="javascript:">' + i + '</a></li>';
          }
        } else {
          str1 = '<li><a href="javascript:" class="'+ opts.activeClass +'">1</a></li>';
        }
        obj.html('<div class="next" style="float:right;margin-right:70px">' + opts.next + '</div><div class="last" style="float:right">' + opts.lastPage + '</div><ul class="pagingUl">' + str1 + str + '</ul><div class="first" style="float:right">' + opts.firstPage + '</div><div class="prv" style="float:right">' + opts.prv + '</div>');

        obj.on('click', '.next', function () {
          var pageshow = parseInt($('.' + opts.activeClass).html());
          if(pageshow==l){
            return false;
          }
          if(pageshow == l) {
          }else if(pageshow > l-5&&pageshow < l){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().next().find('a').addClass(opts.activeClass);
          }else if(pageshow > 0&&pageshow < 6){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().next().find('a').addClass(opts.activeClass);
          }else {
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().next().find('a').addClass(opts.activeClass);
            fpageShow();
          }
          newBooksAjax(pageshow+1);
          opts.clickBack(pageshow+1)
        });
        obj.on('click', '.prv', function () {
          var pageshow = parseInt($('.' + opts.activeClass).html());

          if (pageshow == 1) {
            return false;
          }else if(pageshow > l-5&&pageshow < l+1){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);              
          }else if(pageshow > 1&&pageshow < 6){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);           
          }else {
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass); 
            fpageShow();
          }
          newBooksAjax(pageshow-1);
          opts.clickBack(pageshow-1)
        });

        obj.on('click', '.first', function(){
          var pageshow = 1;
          var nowshow = parseInt($('.' + opts.activeClass).html());
          if(nowshow==1){
            return false;
          }
          $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
          fpagePrv(0);
          newBooksAjax(1);
          opts.clickBack(pageshow)
        })
        obj.on('click', '.last', function(){
          var pageshow = l;
          var nowshow = parseInt($('.' + opts.activeClass).html());
          if(nowshow==l){
            return false;
          }
         
          if(l>9){
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
            fpageNext(8);
          }else{
            $('.' + opts.activeClass).removeClass(opts.activeClass).parent().prev().find('a').addClass(opts.activeClass);
            fpageNext(l-1);
          }
          newBooksAjax(pageshow);
          opts.clickBack(pageshow)
        })

        obj.on('click', 'li', function(){
          var $this = $(this);
          var pageshow = parseInt($this.find('a').html());
          var nowshow = parseInt($('.' + opts.activeClass).html());
          console.log(l,256)
          if(pageshow==nowshow){
            return false;
          }
          if(l>9){
            console.log(1234567,pageshow,l)
            if(pageshow > l-5&&pageshow < l+1){
              $('.' + opts.activeClass).removeClass(opts.activeClass);
              $this.find('a').addClass(opts.activeClass);
              fpageNext(8-(l-pageshow));
            }else if(pageshow > 0&&pageshow < 5){
              $('.' + opts.activeClass).removeClass(opts.activeClass);
              $this.find('a').addClass(opts.activeClass);
              fpagePrv(pageshow-1);
            }else{
              $('.' + opts.activeClass).removeClass(opts.activeClass);
              $this.find('a').addClass(opts.activeClass);
              fpageShow();
            }
          }else{
            console.log(123456)
            $('.' + opts.activeClass).removeClass(opts.activeClass);
            $this.find('a').addClass(opts.activeClass);
          }
          newBooksAjax(pageshow);
          opts.clickBack(pageshow)
        })

        function fpageShow(){
          var pageshow = parseInt($('.' + opts.activeClass).html());
          var pageStart = pageshow - 4;
          var pageEnd = pageshow + 5;
          var str1 = '';
          for(i=0;i<9;i++){
            str1 += '<li><a href="javascript:" class="">' + (pageStart+i) + '</a></li>'
          }
          obj.find('ul').html(str1);
          obj.find('ul li').eq(4).find('a').addClass(opts.activeClass);
		      
        }

        function fpagePrv(prv){
          var str1 = '';
          if(l>8){
            for(i=0;i<9;i++){
              str1 += '<li><a href="javascript:" class="">' + (i+1) + '</a></li>'
            }
          }else{
            for(i=0;i<l;i++){
              str1 += '<li><a href="javascript:" class="">' + (i+1) + '</a></li>'
            }
          }
          obj.find('ul').html(str1);
          obj.find('ul li').eq(prv).find('a').addClass(opts.activeClass);
        }

        function fpageNext(next){
          var str1 = '';
          if(l>8){
            for(i=l-8;i<l+1;i++){
              str1 += '<li><a href="javascript:" class="">' + i + '</a></li>'
            }
           obj.find('ul').html(str1);
           obj.find('ul li').eq(next).find('a').addClass(opts.activeClass);
          }else{
            for(i=0;i<l;i++){
              str1 += '<li><a href="javascript:" class="">' + (i+1) + '</a></li>'
            }
           obj.find('ul').html(str1);
           obj.find('ul li').eq(next).find('a').addClass(opts.activeClass);
          }
        }
      });
    },
    
  })
   $(".new_page").page({
      leng: 66,//分页总数
      activeClass: 'activP' , //active 类样式定义
      clickBack:function(page){
        console.log(page)
      }
    })
})(jQuery);
$(function(){
	newBooksAjax(1);
}); 
function newBooksAjax(currentPage){
	$("#newbookajax").empty();
	$.ajax({url:"findCondition.action",
		   async:false,
		   method:"get",
		   dataType:"json",
		   data:{formdata:currentPage},
		   success:function(data){
		   if(null != data && "" != data){  
		   $(data).each(function(i, n) {
			   var inputstr = "";
			   inputstr += '<li class="book_center_new_img" name="img1"><a href="findBookByBookISBN?bookISBN='+n.bookISBN+'">';
			   inputstr += '<img src="'+n.bookImage+'" height="150" width="120">';
			   inputstr += '<b><i class="fa fa-jpy"></i>'+n.bookUnitPrice+'</b></a></li>';
			   $("#newbookajax").append(inputstr);
		   });
		   }else{
			toastr.warning("该页无内容");   
		   }
		},
	        error:function(){
		    toastr.warning("图片加载失败");
	     }
	   })
};
