<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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


	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<jsp:include page="jsp/header.jsp" flush="false"/>
	<!-- Header section end -->
	<br><br><br>
	<div register="rform" align="center" style="background-color:#f0f0f0;margin: 0 auto; width:500px;">
	<form method="post" action="registerSave.jsp">
	<fieldset>
	<br><br>
	<legend><center>SIGN IN</center></legend>
	<table height="350px">
	<tr>
		<td>아이디</td>
		<td><input type= "text" name="u_id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="u_pw" maxlength="20"></td>
		
	</tr>
	<tr>
		<td></td>
		<td>*4자 이상을 입력해주세요</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="u_name" maxlength="20"></td>
	</tr>
    <tr>
		<td>주소</td>
		<td><input type="text" name="u_address" maxlength="100"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="email" name="u_email" maxlength="100"></td>
	</tr>
	<tr>
		<td>핸드폰</td>
		<td><input type="text" name="u_tel" maxlength="100"></td>
	</tr>
    </table>
    <br>
    <input type="hidden" name="u_auth" value="0">
    <button type="submit" class="site-btn sb-dark">회원가입</button>
    <br><br>
	</fieldset>
	</form>
	</div>
	<br><br><br>
	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false"/>
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false"/>
</body>
</html>