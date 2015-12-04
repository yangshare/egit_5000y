/*jquery编辑区*/
$(function(){
	//按动编辑按钮1、编辑按钮变提交；2、div的内容放入input中（可编辑）；
	$("#Yuser_submit").click(function(){
		//alert("进入编辑点击事件"+$("#Yuser_submit").val());
		if($(this).val()=="修改"){
			//alert("进入if");
			if($("#Yuser_name input").val()!=""){
				if($("#Yuser_pwd input").val()!=""){
					
					
					$.ajax({//提交修改信息
							
				         type:"post",
				         url:"wUser_update",
				         data:{//设置数据
						 	 id:$("#id").val(),
						 	 username:$("#Yuser_name input").val().trim(),//用户名
						 	 userpwd:$("#Yuser_pwd input").val().trim()//用户密码
				         },
				        
				         dataType:"text",//设置需要返回的数据类型
				         success:function(json){
				        	 $("#Yuser_name").html("&nbsp;&nbsp;&nbsp;&nbsp;"+$('#Yuser_name input').val().trim());
							 $("#Yuser_pwd").html("&nbsp;&nbsp;&nbsp;&nbsp;"+$('#Yuser_pwd input').val().trim());
				        	 $("#reset").css("display","none");
				        	 $("#Yuser_submit").val("编辑");
				        	 var text1=json.replace("\"json\":","");
				        	 var text2=text1.replace("{","");
				        	 var text3=text2.replace("}","");
				        	 var text4=text3.replace("\"","");
				        	 var text5=text4.replace("\"","");
				        	alert(text5);         
				         },
				         error:function(){
				             alert("系统异常，请稍后重试！");
				         }//这里不要加","
				     });
					 
				}else{
					alert("请填写用户密码");
					$("#Yuser_pwd input").focus();
				}
			}else{
				alert("请填写用户名");
				$("#Yuser_name input").focus();
			}
		}
		if($(this).val()=="新增"){
			if($("#Yuser_name").val()!=""){
				if($("#Yuser_pwd").val()!=""){
					
					$.ajax({//提交信息
							
				         type:"post",
				         url:"wUser_insert",
				         data:{
						 	 username:$("#Yuser_name").val().trim(),//用户名
						 	 userpwd:$("#Yuser_pwd").val().trim()//用户密码
				         },
				        
				         dataType:"text",//设置需要返回的数据类型
				         success:function(json){
				        	 $("#Yuser_name").val("");
				        	 $("#Yuser_pwd").val("");
				        	 var text1=json.replace("\"json\":","");
				        	 var text2=text1.replace("{","");
				        	 var text3=text2.replace("}","");
				        	 var text4=text3.replace("\"","");
				        	 var text5=text4.replace("\"","");
				        	alert(text5);         
				         },
				         error:function(){
				             alert("系统异常，请稍后重试！");
				         }//这里不要加","
				     });
					 
					
					
				}else{
					alert("请填写用户密码");
					$("#Yuser_pwd input").focus();
				}
			}else{
				alert("请填写用户名");
				$("#Yuser_name input").focus();
			}
		}
		if($(this).val()=="删除"){
			if($("#Yuser_name").val()!=""){
				if($("#Yuser_pwd").val()!=""){
					
					$.ajax({//提交信息
							
				         type:"post",
				         url:"wUser_delete",
				         data:{
						 	 username:$("#Yuser_name").val().trim(),//用户名
						 	 userpwd:$("#Yuser_pwd").val().trim()//用户密码
				         },
				        
				         dataType:"text",//设置需要返回的数据类型
				         success:function(json){
				        	 $("#Yuser_name").val("");
				        	 $("#Yuser_pwd").val("");
				        	 var text1=json.replace("\"json\":","");
				        	 var text2=text1.replace("{","");
				        	 var text3=text2.replace("}","");
				        	 var text4=text3.replace("\"","");
				        	 var text5=text4.replace("\"","");
				        	alert(text5);         
				         },
				         error:function(){
				             alert("系统异常，请稍后重试！");
				         }//这里不要加","
				     });
					 
					
					
				}else{
					alert("请填写删除账号的密码");
					$("#Yuser_pwd input").focus();
				}
			}else{
				alert("请填写删除的账号");
				$("#Yuser_name input").focus();
			}
		}
		if($(this).val()=="编辑"){
			//alert("进入else");
			//input加上
			 $("#Yuser_name").html("<input  type='text' value="+$('#Yuser_name').text().trim()+">");
			 $("#Yuser_pwd").html("<input  type='text' value="+$("#Yuser_pwd").text().trim()+">");
			 $("#Yuser_submit").val("修改");
			 $("#reset").css("display","block");
		}
	});
	
	
});
