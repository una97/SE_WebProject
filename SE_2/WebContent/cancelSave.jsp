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
		int result =0;
		String currentid = (String)session.getAttribute("u_id");
		if (user.getU_pw() == null || user.getU_id() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 값이 있습니다!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			response.setCharacterEncoding("utf-8");
			result=userDAO.out(user.getU_id(), user.getU_pw());
			if(result==1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원 탈퇴가 완료되었습니다.')");
				script.println("location.href='logoutAction.jsp'");
				script.println("</script>");
			}
			else if(result==0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호를 확인해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디를 확인해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>
</body>
</html>