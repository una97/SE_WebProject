<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>


<html>
<head>
<title>Docamp</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Favicon -->
<link href="img/logo.png" rel="shortcut icon" />

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
			<h4>EVENT PAge</h4>
			<div class="site-pagination">
				<a href="">Home</a> / <a href="">Event</a>
			</div>
		</div>
	</div>
	<!-- Page info end -->

	<!-- Category section -->
	<section class="category-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 order-2 order-lg-1">
					<div class="filter-widget">
						<h2 class="fw-title">이벤트 목록</h2>
						<ul class="category-menu">

							<li><a href="#">진행중인 이벤트</a></li>
							<li><a href="#">종료 이벤트</a></li>

						</ul>
					</div>
				</div>
				<!-- 상품 판매란 -->
				<div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0">
					<input type="hidden" name="viewCount" id="viewCount" value="0">
					<input type="hidden" name="startCount" i="startCount" value="0">
					<div class="row">
						<a href="eventDetail.jsp"> <img src="img/event/event_banner1.png" width="700" alt=""></a>


						<img src="img/event/event_banner2.png" width="700" alt="">

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Category section end -->

	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false" />
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false" />







</body>









</html>