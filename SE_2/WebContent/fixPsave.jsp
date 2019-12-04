<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="dao.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	   request.setCharacterEncoding("UTF-8");
	   
	   String directory=application.getRealPath("/img/product");
	   int maxSize=1024*1024*100;
	   String encoding="UTF-8";
	   MultipartRequest multi=new MultipartRequest(request,directory,maxSize,encoding,new DefaultFileRenamePolicy());
	   int p_id=Integer.parseInt(multi.getParameter("p_id"));
	   int p_price=Integer.parseInt(multi.getParameter("p_price"));
	   int p_stock=Integer.parseInt(multi.getParameter("p_stock"));
	   String p_name=multi.getParameter("p_name");
	   String p_category=multi.getParameter("p_category");
	   String p_sm_category=multi.getParameter("p_sm_category");
	   String p_pic=multi.getFilesystemName("p_pic");
	   String p_info=multi.getFilesystemName("p_info");
	   
	   if(p_pic == null){
		   p_pic = multi.getParameter("p_pic1");
	   }else{
	   p_pic = "img/product/"+p_pic;
	   }
	   if(p_info!=null){
		   p_info="img/product/"+p_info;
	   }
	   ProductDAO pd = new ProductDAO();

	   if (p_pic == null || p_category == null || p_name == null || p_sm_category == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 값이 있습니다!')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			response.setCharacterEncoding("utf-8");
			pd.upload(p_id,p_name,p_price,p_pic,p_stock,p_info,p_category,p_sm_category);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('상품 정보가 수정되었습니다')");
			response.sendRedirect("newProduct.jsp");
			script.println("</script>");	
		}
	   
	  
	%>
</body>
</html>