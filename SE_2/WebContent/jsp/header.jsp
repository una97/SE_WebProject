<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-2 text-center text-lg-left">
						<!-- logo -->
						<a href="./index.jsp" class="site-logo"> <img
							src="img/logo.png" alt="" width="130px">
						</a>
					</div>
					<div class="col-xl-6 col-lg-5">
						<br>
						<form class="header-search-form">
							<input type="text" placeholder="Search ....">
							<button>
								<i class="flaticon-search"></i>
							</button>
						</form>
					</div>
					<div class="col-xl-4 col-lg-5">
						<div class="user-panel">
							<%
								if (session.getAttribute("u_id") == null) { //로그인 안 된 경우
							%>
							<div class="up-item">
								<br> <i class="flaticon-profile"></i> <a href="login.jsp">로그인</a>
								/ <a href="register.jsp">회원 가입</a>
							</div>
							<%
								} else {
							%>
							<div class="up-item">
								<br> <i class="flaticon-profile"></i> <a href="mypage.jsp"><%=session.getAttribute("u_name")%>님</a>
								/ <a href="logoutAction.jsp">로그아웃</a>
							</div>
							<div class="up-item">
								<div class="shopping-card">
									<i class="flaticon-bag"></i> <span>0</span>
								</div>
								<a href="cart.jsp">쇼핑 카트</a>
							</div>
							<%
								}
							%>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav class="main-navbar">
			<div class="container">
				<!-- menu -->
				<ul class="main-menu">
					<li><a href="./index.jsp">Home</a></li>
					<li><a href="./category.jsp">Camping shop</a>
						<ul class="sub-menu">
							<li><a href="#">텐트/타프</a></li>
							<li><a href="#">의자/테이블</a></li>
							<li><a href="#">침낭/매트</a></li>
							<li><a href="#">코펠/식기</a></li>
							<li><a href="#">버너/난로</a></li>
							<li><a href="#">랜턴/후레쉬</a></li>
							<li><a href="#">화로대/가스/연료/장작</a></li>
							<li><a href="#">가방/케이스</a></li>
						</ul></li>
					<li><a href="eventList.jsp">Event <span class="new">New</span>
					</a></li>
					<li><a href="#">Pages</a>
						<ul class="sub-menu">
							<li><a href="./product.jsp">Product Page</a></li>
							<li><a href="./category.jsp">Category Page</a></li>
							<li><a href="./cart.jsp">Cart Page</a></li>
							<li><a href="./checkout.jsp">Checkout Page</a></li>
							<li><a href="./contact.jsp">Contact Page</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>