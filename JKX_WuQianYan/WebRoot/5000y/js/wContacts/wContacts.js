$(function(){
	
		//子项div的显隐
	$(".subnav").delegate('li','click',function(){

		 $(this).siblings().removeClass("hover");
		 $(this).addClass("hover");
		 if($(this).text()=="联系我们"){
			// alert($(this).text());
			 $(".contactUs").show(1000);
			 $(".getMessage").hide();
			 }
		  if($(this).text()=="在线预约"){
			  // alert($(this).text());
			    $(".getMessage").show(1000);
				  $(".contactUs").hide();
				 
				 }
	});
	
	$("#order img").click(function(){
		
		doSubmit();
		
		})

});

	function doSubmit() {
		
		var mTitle = document.getElementById("mTitle").value;
		var houseArea = document.getElementById("houseArea").value;
		var contactName = document.getElementById("contactName").value;
		var contactPhone = document.getElementById("contactPhone").value;
		var houseType = document.getElementById("houseType").value;
		var messages = document.getElementById("messages").value;
		// alert("d"); 
		var URL = 'http://10.110.10.83:8080/wuqianyan/wMessage_Insert?mTitle=' + mTitle + '&houseArea=' + houseArea
		+ '&contactName=' + contactName+ '&contactPhone=' + contactPhone
		+ '&houseType=' + houseType+ '&messages=' + messages;
		//alert(""+URL);
				$.ajax({//获取数据库地理位置
						
						
						 url:URL,//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名		        
						 dataType:"json",//设置需要返回的数据类型
						 
						 success:function(json){
							if (json != null || json !="") {
									alert(json['json']);
									$("#order img").hide();
								  } else {
									alert("网络等原因导致提交失败！");
								}
						}
			});

	}