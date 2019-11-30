<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Divisima | eCommerce Template</title>
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
	
	<!-- Page info -->
	<div class="page-top-info">
		<div class="container">
			<h4>주문/결제</h4>
			<div class="site-pagination">
			  <img src="img/cart/order.png" alt="">
			</div>
		</div>
	</div>
	<!-- Page info end -->
	
	<!-- checkout section  -->
	<section class="checkout-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 order-2 order-lg-1">
					<form class="checkout-form">
                        <div class="cf-title">주문자 정보</div>
						<div class="row address-inputs">
							<div class="col-md-6">
								<input type="text" placeholder="이름">
							</div>
							<div class="col-md-6">
								<input type="text" placeholder="휴대전화">
							</div>
							<div class="col-md-6">
								<input type="text" placeholder="이메일">
							</div>
						</div>
						<div class="cf-title">
                            배송지 정보 &nbsp;
                        <input type="radio" name="pm" id="one"> <!--이 부분 -->
						<label for="one">주문자 정보와 동일</label>
                        </div>
						
						<div class="row address-inputs">
							<div class="col-md-12">
								<input type="text" placeholder="도로명 주소">
								<input type="text" placeholder="상세 주소">
							</div>
							<div class="col-md-6">
								<input type="text" placeholder="휴대 전화">
							</div>
                            <div class="col-md-12">
								<input type="text" placeholder="배송 시 요구사항">
							</div>
							
						</div>
						<div class="cf-title">쿠폰 사용</div>
						<div class="row shipping-btns">
                            
                            <!-- <h4>사용 가능한 쿠폰 조회</h4> -->
                            	<div class="col-md-3">
                                    <!-- <button href="#">사용가능한 쿠폰 조회 </button> -->
								<input type="text" placeholder="사용 가능한 쿠폰 조회">
							</div>
							<!-- <div class="col-6">
								<h4>Standard</h4>
							</div>
							<div class="col-6">
								<div class="cf-radio-btns">
									<div class="cfr-item">
										<input type="radio" name="shipping" id="ship-1">
										<label for="ship-1">Free</label>
									</div>
								</div>
							</div>
							<div class="col-6">
								<h4>Next day delievery  </h4>
							</div>
							<div class="col-6">
								<div class="cf-radio-btns">
									<div class="cfr-item">
										<input type="radio" name="shipping" id="ship-2">
										<label for="ship-2">$3.45</label>
									</div>
								</div>
							</div> -->
						</div>
						<div class="cf-title">결제</div>
						<ul class="payment-list">
							<!-- <li>신용카드(일반)<a href="#"><img src="img/cart/kb.png" alt=""><img src="img/cart/hd.png" alt=""><img src="img/cart/samsung.png" alt=""><img src="img/cart/lotte.png" alt=""><img src="img/cart/nh.png" alt=""></a></li>
							<li>간편결제<a href="#"><img src="img/mastercart.png" alt=""></a></li> -->
                             <input type="radio" name="pay" id="normal"> <!--이 부분 -->
						        <label for="one">신용카드(일반)&nbsp;&nbsp;<img src="img/cart/kb.png" width="100px"height="100px"alt=""><img src="img/cart/hd.png"  width="100px"height="100px"alt=""><img src="img/cart/samsung.png" width="100px"height="100px" alt=""><img src="img/cart/lotte.png" width="100px"height="100px" alt=""></label>
                            <br>
                            <input type="radio" name="pay" id="easy"> <!--이 부분 -->
						        <label for="one">간편결제</label>
							<li>
                                할부방식 
                            <select>
                              <option value="3">3개월</option>
                              <option value="6">6개월</option>
                              <option value="12">12개월</option>
                              <option value="free">무이자</option>
                            </select>
                            </li>
						</ul>
						<button class="site-btn submit-order-btn">결제하기</button>
					</form>
                    
                    
                    
                    
				</div>
				<div class="col-lg-4 order-1 order-lg-2">
					<div class="checkout-cart">
						<h3>장바구니</h3>
						<ul class="product-list">
							<li>
								<div class="pl-thumb"><img src="img/cart/1.jpg" alt=""></div>
								<h6>Animal Print Dress</h6>
								<p>$45.90</p>
							</li>
							<li>
								<div class="pl-thumb"><img src="img/cart/2.jpg" alt=""></div>
								<h6>Animal Print Dress</h6>
								<p>$45.90</p>
							</li>
						</ul>
						<ul class="price-list">
							<li>합계<span>$99.90</span></li>
							<li>배송비<span>free</span></li>
							<li class="total">합계<span>$99.90</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- checkout section end -->
	
	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false"/>
	<!-- Footer section end -->
	
	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false"/>
	
</body>
</html>