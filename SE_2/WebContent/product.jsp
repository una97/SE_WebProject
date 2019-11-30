<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="dto.Product"%>
<%@ include file="jsp/product_li.jsp"%>

<html>
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

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
String idx_s = request.getParameter("idx");
out.print(idx_s);
int idx = Integer.parseInt(idx_s);
Product pdDto = pdDtos.get(idx);
ArrayList<Review> rvDtos = rvDAO.reviewSelect("select * from review INNER JOIN `order` ON review.o_id = `order`.o_id where p_id="+idx);

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

	<!-- product section -->
	<section class="product-section">
		<div class="container">
			<div class="back-link">
				<a href="./category.jsp"> &lt;&lt; Back to Category</a>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="product-pic-zoom">
						<img class="product-big-img" src=<%=pdDto.getP_pic()%> alt="">
					</div>
					<!--
					<div class="product-thumbs" tabindex="1" style="overflow: hidden; outline: none;">
						<div class="product-thumbs-track">
							<div class="pt active" data-imgbigurl="img/single-product/1.jpg"><img src="img/single-product/thumb-1.jpg" alt=""></div>
							<div class="pt" data-imgbigurl="img/single-product/2.jpg"><img src="img/single-product/thumb-2.jpg" alt=""></div>
							<div class="pt" data-imgbigurl="img/single-product/3.jpg"><img src="img/single-product/thumb-3.jpg" alt=""></div>
							<div class="pt" data-imgbigurl="img/single-product/4.jpg"><img src="img/single-product/thumb-4.jpg" alt=""></div>
						</div>
					</div>
					-->
				</div>
				<div class="col-lg-6 product-details">
					<h2 class="p-title"><%=pdDto.getP_name()%></h2>
					<h3 class="p-price"><%=pdDto.getP_price()%></h3>
					<h4 class="p-stock">
						Available: <span>In Stock</span>
					</h4>
					<div class="p-rating">
						<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
							class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
							class="fa fa-star-o fa-fade"></i>
					</div>
					<div class="p-review">
						<a href="#reviewSec"><%= rvDtos.size() %> 리뷰</a>|<a href="">리뷰하기</a>
					</div>
					<div class="quantity">
						<p>수량</p>
						<div class="pro-qty">
							<input type="text" value="1">
						</div>
					</div>
					<table>
						<tr>
							<td>
								<form method="post" action="cart.jsp">
									<button type="submit" class="site-btn">장바구니 담기</button>
								</form>
							</td>
							<td>
								<form method="post" action="checkout.jsp">
									<button type="submit" class="site-btn">구매하기</button>
								</form>
							</td>
						</tr>

					</table>



					<!-- <a href="checkout.jsp" class="site-btn">구매하기</a> -->
				</div>
				<div id="accordion" class="accordion-area">
					<div class="panel">
						<div class="panel-header" id="headingOne">
							<button class="panel-link active" data-toggle="collapse"
								data-target="#collapse1" aria-expanded="true"
								aria-controls="collapse1">상품 정보</button>
						</div>
						<div id="collapse1" class="collapse show"
							aria-labelledby="headingOne" data-parent="#accordion">
							<div class="panel-body">
								<img class="product-info-img" src=<%=pdDto.getP_info()%> alt="">
							</div>
						</div>
					</div>

					<!-- review section -->
					<div id="reviewSec">
					<jsp:include page="jsp/review.jsp" flush="false">
						<jsp:param name="idx" value="<%=idx%>" />
					</jsp:include>
					</div>
				</div>
				<!-- review section end -->
			</div>
		</div>
		</div>
	</section>
	<!-- product section end -->


	<!-- RELATED PRODUCTS section -->
	<jsp:include page="jsp/relatedProducts.jsp">
		<jsp:param name="category" value="<%=pdDto.getP_category()%>" />
	</jsp:include>
	<!-- RELATED PRODUCTS section end -->

	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false" />
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false" />

</body>
</html>