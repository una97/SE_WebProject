<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<jsp:useBean id="ctDAO" class="dao.CartDAO" />
<jsp:useBean id="ptDAO" class="dao.ProductDAO" />
<jsp:useBean id="user" class="dto.User" />

<!DOCTYPE html>
<html>
<head>
<title>DOCAMP</title>
<meta charset="UTF-8">
<meta name="description" content=" Divisima | eCommerce Template">
<meta name="keywords" content="divisima, eCommerce, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<!-- <link href="img/favicon.ico" rel="shortcut icon"/> -->

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i"
	rel="stylesheet">


<!-- Stylesheets -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/slicknav.min.css" />
<link rel="stylesheet" href="css/jquery-ui.min.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/style.css" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

<%
	ArrayList<Cart> ctDtos = ctDAO.getCart((String) session.getAttribute("u_id"));
	String u_id=(String) session.getAttribute("u_id");
	ResultSet rs = ptDAO.getResult("select * from product INNER JOIN cart ON cart.c_p_id = product.p_id where c_u_id=\""+u_id+"\"");

	int sum = 0;
	int shipCost = 2500;
/* 	int quantity = Integer.parseInt(request.getParameter("quantity")); */
	
%>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<jsp:include page="jsp/header.jsp" flush="false" />
	<!-- Header section end -->

	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<table>
				<tr>
					<td><img src="img/cart/card.png" width="50" alt="">
						&nbsp;&nbsp;</td>
					<td>
						<h4>주문/결제</h4>
					</td>
				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td><img src="img/cart/1.png" width="30" alt=""></td>
					<td><h5>장바구니</h5></td>
					<td><img src="img/cart/right_arrow.png" width="30" alt=""></td>
					<td><img src="img/cart/2_R.png" width="30" alt=""></td>
					<td><h5>주문/결제</h5></td>
					<td><img src="img/cart/right_arrow.png" width="30" alt=""></td>
					<td><img src="img/cart/3.png" width="30" alt=""></td>
					<td><h5>주문완료</h5></td>

				</tr>
			</table>
		</div>
	</div>
	<!-- Page info end -->

	<!-- checkout section  -->
	<section class="checkout-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 order-2 order-lg-1">
					<form action="orderSave.jsp" method="post" class="checkout-form">
						<div class="cf-title">주문자 정보</div>
						<div class="row address-inputs">
							<div class="col-md-6">
								<input type="text" placeholder="이름" name="order_name">
							</div>
							<div class="col-md-6">
								<input type="text" placeholder="휴대전화" name="phone">
							</div>
							<div class="col-md-6">
								<input type="text" placeholder="이메일" name="email">
							</div>
						</div>
						<div class="cf-title">
							배송지 정보 &nbsp;
							<!--  <input type="radio" name="pm" id="one">
							이 부분
							<label for="one">주문자 정보와 동일</label> -->
						</div>

						<div class="row address-inputs">
							<div class="col-md-12">
								<input type="text" placeholder="도로명 주소" name="basicAddress"> 
								<input type="text" placeholder="상세 주소" name = "detailAddress">
							</div>
				
							<div class="col-md-12">
								<input type="text" placeholder="배송 시 요구사항" name="mention">
							</div>

						</div>
			
						<div class="cf-title">결제</div>
						<ul class="payment-list">
							<!-- <li>신용카드(일반)<a href="#"><img src="img/cart/kb.png" alt=""><img src="img/cart/hd.png" alt=""><img src="img/cart/samsung.png" alt=""><img src="img/cart/lotte.png" alt=""><img src="img/cart/nh.png" alt=""></a></li>
							<li>간편결제<a href="#"><img src="img/mastercart.png" alt=""></a></li> -->
							<input type="radio" name="pay" value="신용카드(일반)"id="normal">신용카드(일반)&nbsp;&nbsp; 
							<!--이 부분 -->
							
							<img src="img/order/pay.png" alt="">
							<img src="img/order/paydetail.png" alt="">
		
							<br>
							<input type="radio" name="pay" value="간편결제" id="easy">
							<!--이 부분 -->
							간편결제
							<li>할부방식 <select name = "divide">
									<option value="3">3개월</option>
									<option value="6">6개월</option>
									<option value="12">12개월</option>
							</select>
							</li>
						</ul>
						<!-- <button class="site-btn submit-order-btn">결제하기</button>
					</form> -->
				</div>
				<div class="col-lg-4 order-1 order-lg-2">
					<div class="checkout-cart">
						<h3>장바구니</h3>
						<ul class="product-list">
							<%
							while(rs.next()){
								sum+=Integer.parseInt(rs.getString("p_price"));
							%>
							<li>
								<div class="pl-thumb">
									<img src=<%=rs.getString("p_pic")%> alt="">
								</div>
								<h6><%=rs.getString("p_name")%></h6>
								<p><%=rs.getString("p_price")%></p>
							</li>
							<%
								}
							%>
						</ul>
						<ul class="price-list">
							<input type="hidden" name="sum" value=<%=sum %> />
						
							<li>합계<span><%=sum%></span></li>
							<li>배송비<span><%=shipCost%></span></li>
							<%
								sum = sum + shipCost;
							%>
							<li class="total">합계<span><%=sum%></span></li>
						</ul>
					</div>
					<button class="site-btn submit-order-btn">결제 하기</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- checkout section end -->

	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false" />
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false" />

</body>
</html>