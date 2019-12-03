<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<%
				int auth = (int)session.getAttribute("u_auth");
				if(auth==0){%>
				<p>일반 회원</p>
			<%}else{ %>
				<p>관리자</p>
			<%} %>
		</div>
	</div>
	<section class="category-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 order-2 order-lg-1">
					<div class="filter-widget">
						<%if(auth==0) {%><h2 class="fw-title">마이 페이지</h2>
						<ul class="category-menu">
							<li><a href="mypage.jsp">주문 내역</a>
							</li>
							<li><a href="#">상품 후기</a>
							</li>
							<li><a href="changeinfo.jsp">개인 정보 수정</a>
                            </li>
						</ul>
						<%} else{ %>
						<h2 class="fw-title">관리 페이지</h2>
						<ul class="category-menu">
							<li><a href="mypage.jsp">주문 내역</a>
							</li>
							<li><a href="#">상품 후기</a>
							</li>
							<li><a href="newProduct.jsp">상품 등록 및 정보 변경</a>
							</li>
							<li><a href="changeinfo.jsp">개인 정보 수정</a>
                            </li>
						</ul>
						<%} %>
					</div>
				</div>
			<div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0">
				<h4>
				회원 탈퇴 하기
				</h4>
				<hr>
				*본인 확인을 위해 아이디와 비밀번호를 입력해주세요.
				<br><br>
			<div class="change" align="center" style="background-color:#f0f0f0;margin: 0 auto; width:750px; height:270px;">
				<form method="post" action="cancelSave.jsp">
				<fieldset>
				<br><br>
				<table height="130px">
				<tr>
					<td>아이디</td>
					<td><input type= "text" name="u_id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="u_pw"></td>				
				</tr>
				</table>
				<button type="submit" class="site-btn sb-dark">탈퇴</button>
				<br><br>
				</fieldset>
				</form>
			</div>
			<br>
			</div>
		</div>
	</div>
	</section>
	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false"/>
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false"/>
	
</body>
</html>