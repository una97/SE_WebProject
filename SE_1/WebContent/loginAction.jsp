<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="dto.User" scope="page"/>
<jsp:setProperty name="user" property="u_id"/>
<jsp:setProperty name="user" property="u_pw"/>

<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	String u_id=null;
	UserDAO userDAO = new UserDAO();
	
	int result=userDAO.login(user.getU_id(), user.getU_pw());
	
	if(result==1){ //로그인 성공
		session.setAttribute("u_id", user.getU_id());
		String userE=(String)session.getAttribute("u_id");
		session.setAttribute("u_name",userDAO.findName(userE));
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("location.href='/SE_1/index.jsp'");
		script.println("</script>");
	}
	else if(result==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result==-1){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result==-2){//DB오류
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>