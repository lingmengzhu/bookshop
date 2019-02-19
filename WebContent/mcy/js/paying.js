   function pay(){
    	  var orderItemArray = new Array(); 
          $("#orderItemForm tr.on").each(function(){  
              //this代表当前dom对象tr 
              var that = this;  
              var orderItemObj = new Object();  
              $(that).find("input").each(function(){  
                  var name = $(this).attr("name");  
                  orderItemObj[name] = $(this).val();  
              });  
              orderItemArray.push(orderItemObj);
           });
           $.ajax({  
              url:"paySelectOrder.action",  
              method:"get",  
              dataType:"text",  
              contentType:"application/json;charset=utf-8",  
              async: false,  
              data:{
            	  formdate:JSON.stringify(orderItemArray)
            	  },  
              success: function(date){
            	 if(true){
            		window.location.href="book_ordercompl.jsp";
            	  }
              },
              error: function () { 
              	alert("结算失败")
              }
          });
    }
   $(function () { 
	   var table =document.getElementById('payTable');//行
	   var tr = table.children[1].rows;
	   var price=0;
	   for(var i = 0, len = tr.length; i < len; i++){
			   price += parseFloat(tr[i].cells[4].innerHTML);
	   }		
	   $("#priceTotal").text(price.toFixed(2));
	   $("#priceTotalx").text(price.toFixed(2));
   });