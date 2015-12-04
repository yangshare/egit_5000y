package com.jkx.web.ImplAction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class Web_UpLoad_Action extends ActionSupport{

	private static final long serialVersionUID = 1L;
	String uploadPath;
	
	// myFile属性用来封装上传的文件   
    private File myFile;   
      
    // myFileContentType属性用来封装上传文件的类型   
    private String myFileContentType;   
  
    // myFileFileName属性用来封装上传文件的文件名   
    private String myFileFileName;   

    //获得myFile值   
    public File getMyFile() {   
        return myFile;   
   }   
  
    //设置myFile值   
    public void setMyFile(File myFile) {   
        this.myFile = myFile;   
    }   
  
    //获得myFileContentType值   
    public String getMyFileContentType() {   
       return myFileContentType;   
    }   
  
    //设置myFileContentType值   
    public void setMyFileContentType(String myFileContentType) {   
       this.myFileContentType = myFileContentType;   
   }   
  
    //获得myFileFileName值   
    public String getMyFileFileName() {   
       return myFileFileName;   
    }   
 
    //设置myFileFileName值   
    public void setMyFileFileName(String myFileFileName) {   
        this.myFileFileName = myFileFileName;   
   }   
 
    
    String json;
	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public String execut() throws Exception {   
   
		   HttpServletRequest r=ServletActionContext.getRequest();
		   HttpServletResponse re=ServletActionContext.getResponse();
		   re.setContentType("text/html;charset=utf-8");
		   re.setHeader("Content-Type", "text/html;charset=utf-8");
		  // PrintWriter out = re.getWriter();
		   r.setCharacterEncoding("utf-8");
		   
		try {
		if(myFile!=null){
			//基于myFile创建一个文件输入流   
		    InputStream is = new FileInputStream(myFile);   
		     
		   // 设置上传文件目录   
		     uploadPath = ServletActionContext.getServletContext().getRealPath("/upload");   
		  //  uploadPath = "C:/Users/Administrator/Desktop/music/WebRoot/upload";
		    // 设置目标文件   
		    File toFile = new File(uploadPath, this.getMyFileFileName());   
		     // System.out.println(this.getMyFileFileName());
		   // 创建一个输出流   
		    OutputStream os = new FileOutputStream(toFile);   

		   //设置缓存   
		    byte[] buffer = new byte[1024];   
		    int length = 0;   
  
		   //读取myFile文件输出到toFile文件中   
		   while ((length = is.read(buffer)) > 0) {   
		       os.write(buffer, 0, length);   
		       os.flush();
		       
		    }   
		   // System.out.println("上传路径"+uploadPath);   
		
		   r.getSession().setAttribute("path","upload/"+this.getMyFileFileName());
		   System.out.println("上传路径"+ uploadPath+"/"+this.getMyFileFileName());
		   json="图片上传成功！";

		   //关闭输入流   
		 //  is.close();   
		   //关闭输出流   
		 //  os.close();   
		 //  out.print("<script>alert('图片上传成功！');window.history.back();</script>");
		 //  out.close();
		   }
	} catch (Exception e) {
		// TODO Auto-generated catch block
		json="图片上传失败！";
	}
	return SUCCESS;    
    } 
}
