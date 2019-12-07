<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
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
	   ArrayList<Product> pdDtos;
	   ProductDAO pd = new ProductDAO();
	   pdDtos = pd.productSelect("select * from product");
	   String directory="/usr/local/tomcat/img/product";
	   int maxSize=1024*1024*100;
	   String encoding="UTF-8";
	   MultipartRequest multi=new MultipartRequest(request,directory,maxSize,encoding,new DefaultFileRenamePolicy());
	   int p_id=pdDtos.size();
	   int p_price=Integer.parseInt(multi.getParameter("p_price"));
	   int p_stock=Integer.parseInt(multi.getParameter("p_stock"));
	   int isShared = Integer.parseInt(multi.getParameter("isShared"));
	   String p_name=multi.getParameter("p_name");
	   String p_category=multi.getParameter("p_category");
	   String p_sm_category=multi.getParameter("p_sm_category");
	   String p_pic=multi.getFilesystemName("p_pic");
	   String p_info=multi.getFilesystemName("p_info");
	   p_pic = "img/product/"+p_pic;
	   if(p_info!=null){
		   p_info="img/product/"+p_info;
	   }
	   ProductDAO pd2 = new ProductDAO();
	   if (p_pic == null || p_category == null || p_name == null || p_sm_category == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 값이 있습니다!')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			response.setCharacterEncoding("utf-8");
			pd2.add(p_id,p_name,p_price,p_pic,p_stock,p_info,p_category,p_sm_category,isShared);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새로운 상품이 등록되었습니다')");
			response.sendRedirect("newProduct.jsp");
			script.println("</script>");	
		}
	%>
</body>
</html>