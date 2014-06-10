 <%@ page language="java" import="java.util.*,java.net.URL,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="java.sql.Timestamp"%>

<%
	
	SmartUpload su = new SmartUpload();
	su.initialize(pageContext);//上传初始化

	// 设定上传限制
	long MAXFILE = 5*1024*1024;
	su.setMaxFileSize(MAXFILE);
	//限制总上传数据的长度。
	su.setTotalMaxFileSize(2*MAXFILE);
	//设定允许上传的文件（通过扩展名限制）
	su.setAllowedFilesList("JPG,jpg,JPEG,jpeg,GIF,gif,BMP,bmp,PNG,png");
	
	boolean sign = true;
	String filename = null;
	String filename02 = null;
	
	//设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
	try {
		su.setDeniedFilesList("exe,bat,jsp,htm,html");
			
		//上传文件
		su.upload();

		//String Name = su.getRequest().getParameter("Name");
		com.jspsmart.upload.File myFile = su.getFiles().getFile(0);  
		com.jspsmart.upload.File myFile02 = su.getFiles().getFile(1); 

		String fileFullName  = myFile.getFileName();
		String ext = myFile.getFileExt();
		int file_size =myFile.getSize();

		String fileFullName02  = myFile02.getFileName();
		String ext02 = myFile02.getFileExt();
		int file_size02 =myFile02.getSize();
		
		if((file_size>MAXFILE)||(null==ext)||ext.equals("")||(file_size02>MAXFILE)||(null==ext02)||ext02.equals("")){
			//System.out.println("file_size:" + file_size +"\n");
		%>
			<script>
				window.location="index.jsp";
			</script>
		<%
		}else{

			Timestamp ts = new Timestamp(System.currentTimeMillis());
			Timestamp ts02 = new Timestamp(System.currentTimeMillis()+1);
			filename = String.valueOf(ts.getTime());
			filename02 = String.valueOf(ts02.getTime());
			
			//本地PC
			//String ImageUrl = "E:\\code\\web-java\\file\\" ;
			//青云服务器
			String ImageUrl = "/usr/local/software/apache-tomcat-8.0.8/webapps/KYTPic/Portrait/" ;
			String ImageUrl02 = ImageUrl;
			ImageUrl += filename + "." + ext; //保存路径  
			filename = filename + "." + ext;
			
			ImageUrl02 += filename02 + "." + ext02; //保存路径  
			filename02 = filename02 + "." + ext02;
			
			//将上传文件保存到指定目录
			myFile.saveAs(ImageUrl);
			myFile02.saveAs(ImageUrl02);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		sign = false;
	}
	
	if(sign==true)
	{
		System.out.println("上传成功\n");
		//out.println("<script>parent.callback('上传成功')</script>");
	}else
	{
		System.out.println("上传失败\n");
		//out.println("<script>parent.callback('上传失败')</script>");
	}
%>
