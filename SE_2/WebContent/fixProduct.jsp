<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ include file="jsp/product_li.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
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
	<link rel="stylesheet" href="css/mycss.css"/>


	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<title>상품 정보 변경</title>
</head>
<body>
<%
	String idx_s = request.getParameter("idx");
	int idx = Integer.parseInt(idx_s);
	Product pdDto = pdDtos.get(idx);
%>
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
						상품 등록 및 정보 변경
					</h4>
					<hr>
					<br>
				<div class="fixproduct" align="center" style="background-color:#f0f0f0;margin: 0 auto; width:750px;">
				<form method="post" action="fixPsave.jsp">
				<fieldset>
				<br><br>
				<table height="350px">
				<tr>
					<td colspan="2">
						<img src=<%="http://localhost:8080/SE_2/"+pdDto.getP_pic() %> width="300px">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input display="none" type="file" id="file" name="file" value="<%=pdDto.getP_pic()%>">
					</td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><input type= "text" name="p_name" value="<%=pdDto.getP_name()%>"></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><input type= "text" name="p_category" value="<%=pdDto.getP_category()%>"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="p_price" value=<%=pdDto.getP_price()%> maxlength="20"></td>
					
				</tr>
				<tr>
					<td>재고</td>
					<td><input type="text" name="p_stock" value=<%=pdDto.getP_stock()%> maxlength="20"></td>
				</tr>
			    </table>
			    <br>
			    <input type="hidden" name="u_auth" value="0">
			    <button type="submit" class="site-btn sb-dark">수정 완료</button>
			    <br><br>
				</fieldset>
				</form>
			</div>
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