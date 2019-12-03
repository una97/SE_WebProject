<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.io.*" %>
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
		UserDAO userDAO = new UserDAO();

		if (user.getU_pw() == null || user.getU_id() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 값이 있습니다!')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			response.setCharacterEncoding("utf-8");
			userDAO.out(user.getU_id(), user.getU_pw());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 탈퇴가 완료되었습니다.')");
			script.println("location.href='logoutAction.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>