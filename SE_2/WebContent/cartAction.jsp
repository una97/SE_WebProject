<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.CartDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>

<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String u_id = (String) session.getAttribute("u_id");
	int p_id = Integer.parseInt(request.getParameter("p_id"));
	CartDAO cartDAO = new CartDAO();
	
	int result=cartDAO.addCart(u_id, p_id);
	
	if(result==-1){ //장바구니 담기 실패
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('이미 장바구니에 담은 상품입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{ //장바구니 담기 성공
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("if(confirm(\"장바구니로 이동하시겠습니까?\")){");
		script.println("document.write(\"네\")");
		script.println("location.href='cart.jsp'");
		script.println("}else{");
		script.println("document.write(\"아니요\")");
		script.println("history.back()}");
		script.println("</script>");
	}

%>
</body>
</html>