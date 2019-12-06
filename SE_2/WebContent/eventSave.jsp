<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Event"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="dao.EventDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	   request.setCharacterEncoding("UTF-8");
	   EventDAO ed = new EventDAO();
	   String directory="/usr/local/tomcat/img/event";
	   int maxSize=1024*1024*100;
	   String encoding="UTF-8";
	   MultipartRequest multi=new MultipartRequest(request,directory,maxSize,encoding,new DefaultFileRenamePolicy());
	   int e_id=0;
	   String e_name=multi.getParameter("e_name");
	   String e_sdate=multi.getParameter("e_sdate");
	   String e_edate=multi.getParameter("e_edate");
	   String e_pic=multi.getFilesystemName("e_pic");
	   String e_info=multi.getFilesystemName("e_info");
	   e_pic = "img/event/"+e_pic;
	   if(e_info!=null){
		   e_info="img/event/"+e_info;
	   }
	   if (e_pic == null || e_sdate == null || e_name == null || e_edate == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 값이 있습니다!')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			response.setCharacterEncoding("utf-8");
			ed.add(e_id, e_name,e_pic,e_info,e_sdate,e_edate);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새로운 이벤트가 등록되었습니다')");
			script.println("history.back()");
			script.println("</script>");	
		}
	%>
</body>
</html>