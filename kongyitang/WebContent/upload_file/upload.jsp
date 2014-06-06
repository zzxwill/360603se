 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="java.sql.Timestamp"%>

<%
	//新建一个SmartUpload对象
	SmartUpload su = new SmartUpload();

	//上传初始化
	su.initialize(pageContext);

	// 设定上传限制
	long MAXFILE = 5*1024*1024;
	//1.限制每个上传文件的最大长度。
	su.setMaxFileSize(MAXFILE);

	//2.限制总上传数据的长度。
	su.setTotalMaxFileSize(2*MAXFILE);

	//3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
	su.setAllowedFilesList("JPG,jpg,JPEG,jpeg,GIF,gif,BMP,bmp,PNG,png");
	
	boolean sign = true;
	
	//4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	try {
		su.setDeniedFilesList("exe,bat,jsp,htm,html");
			
		//上传文件
		su.upload();
		
		com.jspsmart.upload.File myFile = su.getFiles().getFile(0);  
		
		String fileFullName  = myFile.getFileName();
		String ext = myFile.getFileExt();
		int file_size = myFile.getSize();
		if(file_size>MAXFILE){
		%>
			<script>
				window.location="index.html";
			</script>
		<%
		}else{
			//System.out.println("fileFullName:" + fileFullName +"\n");
			//System.out.println("ext:" + ext +"\n");
			//System.out.println("file_size:" + file_size +"\n");

			Timestamp ts = new Timestamp(System.currentTimeMillis());
			String filename = String.valueOf(ts.getTime());
			
			String url = "E:\\code\\web-java\\file\\" ;
			//String url = "/usr/local/software/apache-tomcat-8.0.8/webapps/KYTPic/IllnessDes/" ;
			url += filename + "." + ext; //保存路径  

			//将上传文件保存到指定目录
			myFile.saveAs(url);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		sign = false;
	}
	if(sign==true)
	{
		out.println("<script>parent.callback('上传成功')</script>");
	}else
	{
		out.println("<script>parent.callback('上传失败')</script>");
	}
%>
