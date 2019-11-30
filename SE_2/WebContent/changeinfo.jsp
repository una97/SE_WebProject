<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="description" content=" Divisima | eCommerce Template">
	<meta name="keywords" content="divisima, eCommerce, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">


	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/flaticon.css"/>
	<link rel="stylesheet" href="css/slicknav.min.css"/>
	<link rel="stylesheet" href="css/jquery-ui.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/mycss.css"/>


	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<title>마이페이지</title>
</head>
<body>
<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<jsp:include page="jsp/header.jsp" flush="false"/>
	<!-- Header section end -->
	
	<div style="background-color:#f8f7f7;margin: 0 auto;height:200px;">
		<br>
		<div class="userinfo" style="margin: 0 auto; padding: 20px 14px 0; background: white; border-radius: 12px; width: 230px; height: 150px;">
			<b><%=session.getAttribute("u_name")%>님</b>
			<p>일반 회원</p>
		</div>
	</div>
	<table class="mypages" style="valign:top;">
	<tr>
		<td style="valign:top; padding-bottom:330px">
			<br>
			<h5>&nbsp;마이 페이지</h5>
			<br>
			<table class="sidebar" style="padding: 20px 14px 0; border-radius: 5px; height: 200px;width: 200px; border-top: 1px solid black; border-collapse: collapse;">
				<tr>
					<td style="border-bottom: 1px solid black;"><a href="mypage.jsp">&nbsp;주문 내역</a></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid black;"><a href="#">&nbsp;상품 후기</a></td>
				</tr>
				<tr>
					<td style="border-bottom: 1px solid black;"><a href="changeinfo.jsp">&nbsp;개인 정보 수정</a></td>
				</tr>
			</table>
		</td>
		<td style="padding-left:180px; valign:top;">
			<br>
			<h4>
				개인 정보 수정
			</h4>
			<br>
			<%
				String u_id = (String)session.getAttribute("u_id");
				String sql ="select * from user where u_id='"+u_id+"'";
				UserDAO userDAO = new UserDAO();
				ResultSet rs = userDAO.getResult(sql);
				rs.next();
			%>
			<div class="change" align="center" style="background-color:#f0f0f0;margin: 0 auto; width:750px;">
				<form method="post" action="changeSave.jsp">
				<fieldset>
				<br><br>
				<table height="350px">
				<tr>
					<td>아이디</td>
					<td><input type= "text" name="u_id" value=<%=u_id%> readonly></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="u_pw" value=<%=rs.getString("u_pw") %> maxlength="20"></td>
					
				</tr>
				<tr>
					<td></td>
					<td>*4자 이상을 입력해주세요</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="u_name" value=<%=rs.getString("u_name") %> maxlength="20" readonly></td>
				</tr>
			    <tr>
					<td>주소</td>
					<td><input type="text" name="u_address" value="<%=rs.getString("u_address") %>" maxlength="100"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="u_email" value=<%=rs.getString("u_email") %> maxlength="100"></td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td><input type="text" name="u_tel" value=<%=rs.getString("u_tel") %> maxlength="100"></td>
				</tr>
			    </table>
			    <br>
			    <input type="hidden" name="u_auth" value="0">
			    <button type="submit" class="site-btn sb-dark">수정 완료</button>
			    <br><br>
				</fieldset>
				</form>
			</div>
		</td>
	</tr>
	</table>
	<br><br><br>
	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false"/>
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false"/>
	
</body>
</html>