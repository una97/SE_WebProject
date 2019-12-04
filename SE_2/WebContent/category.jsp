<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dto.Product"%>
<%@ page import="dto.Review"%>
<%@ page import="dao.ReviewDAO"%>
<jsp:useBean id="rvDAO" class="dao.ReviewDAO"/>
<jsp:useBean id="pdDAO" class="dao.ProductDAO"/>

<%request.setCharacterEncoding("utf-8");%>
<% 
	int cnt;
	try{
	cnt = Integer.parseInt(request.getParameter("cnt"));
	}catch(Exception e){
		cnt = 0;
	}
	String search = request.getParameter("search");
	ArrayList<Product> pdDtos;
	if(search!=null){
		if(search.length()<=1){
			PrintWriter script = response.getWriter();

			script.println("<script>");
			script.println("alert('한 글자 이상 검색해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		pdDtos = pdDAO.productSelect("select * from product where p_name like '%"+search+"%' or p_category like '%"+search+"%' or p_sm_category like '%"+search+"%'");
	}else{

		String p_cate = request.getParameter("p_cate");
		String p_sm_cate = request.getParameter("p_sm_cate");
		
		if(p_cate==null) {
			pdDtos = pdDAO.productSelect("select * from product");
		}
		else if(p_sm_cate==null){
			pdDtos = pdDAO.productSelect("select * from product where p_category='"+p_cate+"'");
		}
		else{
			pdDtos = pdDAO.productSelect("select * from product where p_category='"+p_cate+"' and "+"p_sm_category='"+p_sm_cate+"'");
		}
	}

%>

<html>
<head>
	<title>Docamp</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="img/logo.png" rel="shortcut icon"/>

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
			<h4>CAtegory PAge</h4>
			<div class="site-pagination">
				<a href="">Home</a> /
				<a href="">Shop</a> /
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
						<h2 class="fw-title">카테고리 목록</h2>
						<ul class="category-menu">
							<li><a href="/category.jsp?p_cate=tent">텐트/타프</a>
								<ul class="sub-menu">
									<li><a href="category.jsp?p_cate=tent&p_sm_cate=tent">텐트<span>(2)</span></a></li>
									<li><a href="category.jsp?p_cate=tent&p_sm_cate=tarp">타프<span>(36)</span></a></li>
								</ul>
							</li>
							<li><a href="">의자/테이블/가구</a>
								<ul class="sub-menu">
									<li><a href="category.jsp?p_cate=chair&p_sm_cate=chair">의자<span>(2)</span></a></li>
									<li><a href="category.jsp?p_cate=chair&p_sm_cate=table">테이블<span>(56)</span></a></li>
								</ul></li>
							<li><a href="">침낭/매트</a>
                            	<ul class="sub-menu">
									<li><a href="#">침낭<span>(2)</span></a></li>
									<li><a href="#">매트<span>(56)</span></a></li>
                                </ul></li>
							<li><a href="#">코펠/식기</a>
                            	<ul class="sub-menu">
									<li><a href="#">코펠<span>(2)</span></a></li>
									<li><a href="#">식기<span>(56)</span></a></li>
                                </ul></li>
							<li><a href="#">버너/난로</a></li>
							<li><a href="#">랜턴/후레쉬</a></li>
                            <li><a href="#">화로대/가스/연료/장작</a></li>
                            <li><a href="#">가방/케이스</a></li>
						</ul>
					</div>
					<div class="filter-widget mb-0">
						<h2 class="fw-title">필터</h2>
						<div class="price-range-wrap">
							<h4>Price</h4>
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content" data-min="10" data-max="270">
								<div class="ui-slider-range ui-corner-all ui-widget-header" style="left: 0%; width: 100%;"></div>
								<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 0%;">
								</span>
								<span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default" style="left: 100%;">
								</span>
							</div>
							<div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
					</div>
					<div class="filter-widget mb-0">
						<h2 class="fw-title">색상</h2>
						<div class="fw-color-choose">
							<div class="cs-item">
								<input type="radio" name="cs" id="gray-color">
								<label class="cs-gray" for="gray-color">
									<span>(3)</span>
								</label>
							</div>
							<div class="cs-item">
								<input type="radio" name="cs" id="orange-color">
								<label class="cs-orange" for="orange-color">
									<span>(25)</span>
								</label>
							</div>
							<div class="cs-item">
								<input type="radio" name="cs" id="yollow-color">
								<label class="cs-yollow" for="yollow-color">
									<span>(112)</span>
								</label>
							</div>
							<div class="cs-item">
								<input type="radio" name="cs" id="green-color">
								<label class="cs-green" for="green-color">
									<span>(75)</span>
								</label>
							</div>
							<div class="cs-item">
								<input type="radio" name="cs" id="purple-color">
								<label class="cs-purple" for="purple-color">
									<span>(9)</span>
								</label>
							</div>
							<div class="cs-item">
								<input type="radio" name="cs" id="blue-color" checked="">
								<label class="cs-blue" for="blue-color">
									<span>(29)</span>
								</label>
							</div>
						</div>
					</div>
		<!-- 			<div class="filter-widget mb-0">
						<h2 class="fw-title">크기</h2>
						<div class="fw-size-choose">
							<div class="sc-item">
								<input type="radio" name="sc" id="xs-size">
								<label for="xs-size">XS</label>
							</div>
							<div class="sc-item">
								<input type="radio" name="sc" id="s-size">
								<label for="s-size">S</label>
							</div>
							<div class="sc-item">
								<input type="radio" name="sc" id="m-size"  checked="">
								<label for="m-size">M</label>
							</div>
							<div class="sc-item">
								<input type="radio" name="sc" id="l-size">
								<label for="l-size">L</label>
							</div>
							<div class="sc-item">
								<input type="radio" name="sc" id="xl-size">
								<label for="xl-size">XL</label>
							</div>
							<div class="sc-item">
								<input type="radio" name="sc" id="xxl-size">
								<label for="xxl-size">XXL</label>
							</div>
						</div>
					</div>
					<div class="filter-widget">
						<h2 class="fw-title">브랜드</h2>
						<ul class="category-menu">
							<li><a href="#">Abercrombie & Fitch <span>(2)</span></a></li>
							<li><a href="#">Asos<span>(56)</span></a></li>
							<li><a href="#">Bershka<span>(36)</span></a></li>
							<li><a href="#">Missguided<span>(27)</span></a></li>
							<li><a href="#">Zara<span>(19)</span></a></li>
						</ul>
					</div> -->
				</div>
                <!-- 상품 판매란 -->
				<div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0">
				<input type="hidden" name="viewCount" id="viewCount" value="0">
				<input type="hidden" name="startCount" i="startCount" value="0">
					<div class="row">
                    <%
                        int size = pdDtos.size();
                        for(int i=0;i<size;i++){
                            Product pdDto = pdDtos.get(i);
                    %>
						<div class="col-lg-4 col-sm-6">
							<div class="product-item">
								<div class="pi-pic">
									<!--<div class="tag-sale">ON SALE</div>-->
                                    <a href=product.jsp?idx=<%=pdDto.getP_id() %>><img src=<%="http://localhost:8080/SE_2/"+pdDto.getP_pic() %> alt=""></a>
									<div class="pi-links">
										<a href="#" class="add-card"><i class="flaticon-bag"></i><span>장바구니</span></a>
										<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
									</div>
								</div>
								<div class="pi-text">
									<h6><%=pdDto.getP_price() %></h6>
									<p><%=pdDto.getP_name() %></p>
                                    </a>
								</div>
							</div>
						</div>
						<%
                        }
                        %>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Category section end -->
	
	<!-- Footer section -->
	<jsp:include page="jsp/footer.jsp" flush="false"/>
	<!-- Footer section end -->
	
	<!--====== Javascripts & Jquery ======-->
	<jsp:include page="jsp/requirejs.jsp" flush="false"/>
	
</body>
</html>