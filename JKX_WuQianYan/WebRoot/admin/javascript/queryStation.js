/*jquery编辑区*/
$(function(){
	//按动编辑按钮1、编辑按钮变提交；2、div的内容放入input中（可编辑）；
	$("#Ytalent_submit").click(function(){
		//alert("进入编辑点击事件"+$("#Yuser_submit").val());
		
			
			if($("#Ytalent_author input").val()!=""){
				if($("#Ytalent_title input").val()!=""){
					if($("#Ytalent_content textarea").val()!=""){
					alert("textarea="+$("#Ytalent_content textarea").val());
					$.ajax({//提交修改信息
							
				         type:"post",
				         url:"Talents_update.action",
				         data:{//设置数据源
						 	 id:1,
						 	 author:$("#Ytalent_author input").val().trim(),
						 	 title:$("#Ytalent_title input").val().trim(),//标题
						 	 contents:$("#Ytalent_content textarea").val()//获取内容，val才能获取新值
				         },
				        
				         dataType:"json",//设置需要返回的数据类型
				         success:function(data){
				        	
				        	
				         try{
				        	
				        	 alert("保存成功！");
				 															
				 			}
				 			catch(e){
				 				alert("遍历responseText异常："+e.message);
				 				alert("编辑失败！请稍后重试");
				 			}
				              
				         },
				         error:function(){
				             alert("系统异常，请稍后重试！");
				         }//这里不要加","
				     });
					 
					
					}else{
						alert("请填写内容");
						$("#Ytalent_content textarea").focus();
					}
				}else{
					alert("请填写标题");
					$("#Ytalent_title input").focus();
				}
			}else{
				alert("请填写发布者");
				$("#Ytalent_author input").focus();
			}
		
	});
	
	
});
