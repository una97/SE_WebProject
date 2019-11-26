<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*" %> %>
<%@ page import="dao.UserDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="dto.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
if(user.getU_email()==null || user.getU_pw()==null||user.getU_id()==null
||user.getU_address()==null||user.getU_name()==null||user.getU_tel()==null){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('입력하지 않은 값이 있습니다!')");
	script.println("history.back()");
	script.println("</script>");
}else{
	response.setCharacterEncoding("utf-8");
	UserDAO userDAO = new UserDAO();
	int result=userDAO.join(user);
	if(result==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{ //회원가입이 된 경우
		session.setAttribute("u_id", user.getU_id());
		String u_id=(String)session.getAttribute("u_id");
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다!')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}
}
	
%>
</body>
</html>