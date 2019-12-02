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
	int sum = 0;
	int shipCost = 2500;
	String u_id = (String)session.getAttribute("u_id");
	String o_name = request.getParameter("order_name");
	String o_phone = request.getParameter("phone");
	String o_email = request.getParameter("email");
	String b_address = request.getParameter("basicAddress");
	String d_address = request.getParameter("detailAddress");
	String o_mention = request.getParameter("mention");
	String o_pay = request.getParameter("pay");
	String o_divide = request.getParameter("divide");
	
	
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
					<td><img src="img/cart/check.png" width="50" alt="">
						&nbsp;&nbsp;</td>
					<td>
						<h4>주문완료</h4>
					</td>
				</tr>
			</table>
			<br>
			<table>
				<tr>
					<td><img src="img/cart/1.png" width="30" alt=""></td>
					<td><h5>장바구니</h5></td>
					<td><img src="img/cart/right_arrow.png" width="30" alt=""></td>
					<td><img src="img/cart/2.png" width="30" alt=""></td>
					<td><h5>주문/결제</h5></td>
					<td><img src="img/cart/right_arrow.png" width="30" alt=""></td>
					<td><img src="img/cart/3_R.png" width="30" alt=""></td>
					<td><h5>주문완료</h5></td>

				</tr>
			</table>
		</div>
	</div>
	<!-- Page info end -->

	<!-- checkout section  -->

	<section class="cart-section spad">

		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="cart-table">
						<h3>주문 내역</h3>
						<div class="cart-table-warp">
							<table>
								<thead>
									<th class="product-th">주문자 정보</th>
									<!-- <th class="quy-th">주문자 주소</th> -->
								</thead>
								<tbody>
									<tr>
										<td>주문자 이름</td>
										<td><%=o_name%></td>
									</tr>
									<tr>
										<td>주문자 휴대전화</td>
										<td><%=o_phone%></td>
									</tr>
									<tr>
										<td>주문자 이메일</td>
										<td><%=o_email%></td>
									</tr>
								</tbody>
							</table>
							<table>
								<thead>
									<th class="product-th">배송지 정보</th>
								</thead>
								<tbody>
									<tr>
										<td>배송지 주소</td>
										<td><%=b_address%></td>
									</tr>
									<tr>
										<td></td>
										<td><%=d_address%></td>
									</tr>
									<tr>
										<td>배송시 요구사항</td>
										<td><%=o_mention%></td>
									</tr>
								</tbody>

							</table>
							<table>
								<thead>
									<th class="product-th">결제 정보</th>
								</thead>
								<tbody>
									<tr>
										<td>결제 방법</td>
										<td><%=o_pay%></td>
									</tr>
									<tr>
										<td>할부 방식</td>
										<td><%=o_divide%>개월</td>
									</tr>

								</tbody>

							</table>
							<table>
								<thead>
									<tr>
										<th class="product-th">상품</th>
										<th class="quy-th">수량</th>
										<th class="total-th">가격</th>
									</tr>
								</thead>
								<tbody>

									<%
										for (int i = 0; i < ctDtos.size(); i++) {
											Cart ctDto = ctDtos.get(i);
											ArrayList<Product> pdDtos = ptDAO.productSelect(
													"select * from product INNER JOIN cart ON cart.c_p_id where c_p_id=" + ctDto.getP_id());
											Product pdDto = pdDtos.get(i);
											sum += pdDto.getP_price();
									%>
									<tr>
										<td class="product-col"><img src=<%=pdDto.getP_pic()%>
											alt="">
											<div class="pc-title">
												<h4><%=pdDto.getP_name()%></h4>
												<p><%=pdDto.getP_price()%></p>
											</div></td>

										<td>
											<h5>1</h5>
										</td>

										<td class="total-col"><h4><%=pdDto.getP_price()%></h4></td>
									</tr>

									<%
										}
									%>
									<script type="text/javascript">
										var value = $('#quantity').val();
										document.write(value);
									</script>
								</tbody>
							</table>
						</div>
						<div class="total-cost">
							<h6>
								합계 <span><%=sum%> </span>
							</h6>
						</div>
					</div>
				</div>
				
				<%
				
				
				%>
				<div class="col-lg-4 card-right">
		
					<a href="index.jsp" class="site-btn sb-dark">주문 내역 확인하기</a>
				</div>
			</div>
		</div>

	</section>

	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false" />
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false" />

</body>
</html>