<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="product.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
	<title>DoCamp-캠핑용품샵</title>
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

	<!-- Hero section -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="img/tent.png">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Arrivals</span>
							<h2>Make your life simple</h2>
							<p>캠핑은 처음이신가요?</p>
							<a href="#" class="site-btn sb-line">첫 구매 할인 이벤트</a>
							<a href="#" class="site-btn sb-white">캠핑 입문 가이드</a>
						</div>
					</div>
				</div>
			</div>
			<div class="hs-item set-bg" data-setbg="img/tent2.JPG">
				<div class="container">
					<div class="row">
						<div class="col-xl-6 col-lg-7 text-white">
							<span>New Arrivals</span>
							<h2>Camp Time</h2>
							<p>터널식 원터치 팝업 텐트! 설치가 간편한 팝업식으로 던지기만 하면 완성되는 일명 1초 텐트입니다.</p>
							<a href="#" class="site-btn sb-line">자세히 보기</a>
							<a href="#" class="site-btn sb-white">카트에 담기</a>
						</div>
					</div>
					<div class="offer-card text-white">
						<br>
						<h3>33,000원</h3>
						<h3>부터</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="slide-num-holder" id="snh-1"></div>
		</div>
	</section>
	<!-- Hero section end -->



	<!-- Features section -->
	<section class="features-section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/1.png" alt="#">
						</div>
						<h2>빠르고 안전한 결제</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/2.png" alt="#">
						</div>
						<h2>프리미엄 상품</h2>
					</div>
				</div>
				<div class="col-md-4 p-0 feature">
					<div class="feature-inner">
						<div class="feature-icon">
							<img src="img/icons/3.png" alt="#">
						</div>
						<h2>빠른 배송</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Features section end -->

	<!-- letest product section -->
	<section class="top-letest-product-section">
		<div class="container">
			<div class="section-title">
				<h2>LATEST PRODUCTS</h2>
			</div>
			<div class="product-slider owl-carousel">
			<%
				ProductDAO pd = new ProductDAO();
				String sql = "select * from product";
				ResultSet rs = pd.getResult(sql);
				if(rs == null){
					out.println("DB 연동 오류입니다");
				}
				while(rs.next()){
					String img="http://localhost:8080/SE_1/"+rs.getString("p_pic");
			%>
				<div class="product-item">
					<div class="pi-pic">
						<img src=<%=img%> alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6><%=rs.getString("p_price") %>원</h6>
						<p><%=rs.getString("p_name") %> </p>
					</div>
				</div>
			<%
				}
			%>
			</div>
		</div>
	</section>
	<!-- letest product section end -->
	<!-- Product filter section -->
	<section class="product-filter-section">
		<div class="container">
			<div class="section-title">
				<h2>TOP SELLING PRODUCTS</h2>
			</div>
			<ul class="product-filter-menu">
				<li><a href="#">텐트/타프</a></li>
				<li><a href="#">의자/테이블</a></li>
				<li><a href="#">침낭/매트</a></li>
				<li><a href="#">코펠/식기</a></li>
				<li><a href="#">버너/난로</a></li>
				<li><a href="#">랜턴/후레쉬</a></li>
				<li><a href="#">가방/케이스</a></li>
				<li><a href="#">ect</a></li>
			</ul>
			
			<div class="row">
			<%
				rs.beforeFirst();
				for(int i=0;i<6;i++){
					rs.next();
					String img="http://localhost:8080/SE_1/"+rs.getString("p_pic");
			%>
				<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src=<%=img %> alt="">
							<div class="pi-links">
								<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
								<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
							</div>
						</div>
						<div class="pi-text">
							<h6><%=rs.getString("p_price")%>원</h6>
							<p><%=rs.getString("p_name") %></p>
						</div>
					</div>
				</div>
			<%
				}	
			%>
			</div>
			<div class="text-center pt-5">
				<button class="site-btn sb-line sb-dark">LOAD MORE</button>
			</div>
		</div>
	</section>
	<!-- Product filter section end -->

	<!-- Banner section -->
	<jsp:include page="jsp/banner.jsp" flush="false"/>
	<!-- Banner section end  -->

	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false"/>
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false"/>

</body>
</html>