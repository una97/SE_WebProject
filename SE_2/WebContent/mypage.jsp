<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<jsp:useBean id="odDAO" class="dao.OrderDAO"></jsp:useBean>
<%@ page import="dto.Product"%>
<jsp:useBean id="pdDAO" class="dao.ProductDAO"/>

<!DOCTYPE html>
<html>
<head>

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
<link rel="stylesheet" href="css/mycss.css" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<title>마이페이지</title>
<%
	ResultSet odDtos = odDAO.getResult((String)session.getAttribute("u_id"));
	String search = request.getParameter("search");
	String swhat = request.getParameter("swhat");
	ArrayList<Product> pdDtos = pdDAO.productSelect("select * from product");
	if(search!=null){
		if(swhat.equals("pid")){
			pdDtos = pdDAO.productSelect("select * from product where p_id = "+search);
		}
		else if(swhat.equals("pname")){
			pdDtos = pdDAO.productSelect("select * from product where p_name like '%"+search+"%'");
		}
	}
%>
<style>
th {
padding-left: 20px;
}
</style>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->
	<jsp:include page="jsp/header.jsp" flush="false" />
	<!-- Header section end -->

	<div style="background-color: #f8f7f7; margin: 0 auto; height: 200px;">
		<br>
		<div class="userinfo"
			style="margin: 0 auto; padding: 20px 14px 0; background: white; border-radius: 12px; width: 230px; height: 150px;">
			<b><%=session.getAttribute("u_name")%>님</b>
			<%
				int auth = (int) session.getAttribute("u_auth");
				if (auth == 0) {
			%>
			<p>일반 회원</p>
			<%
				} else {
			%>
			<p>관리자</p>
			<%
				}
			%>
		</div>
	</div>
	<section class="category-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 order-2 order-lg-1">
					<div class="filter-widget">
						<%
							if (auth == 0) {
						%><h2 class="fw-title">마이 페이지</h2>
						<ul class="category-menu">
							<li><a href="mypage.jsp">주문 내역</a></li>
							<li><a href="changeinfo.jsp">개인 정보 수정</a></li>
						</ul>
						<%
							} else {
						%>
						<h2 class="fw-title">관리 페이지</h2>
						<ul class="category-menu">
							<li><a href="mypage.jsp">주문자 조회</a>
							</li>
							<li><a href="seeMembers.jsp">회원 조회</a>
							</li>
							<li><a href="eventUpload.jsp">이벤트 등록</a>
							</li>
							<li><a href="newProduct.jsp">상품 등록 및 정보 변경</a></li>
							<li><a href="changeinfo.jsp">개인 정보 수정</a></li>
						</ul>
						<%
							}
						%>
					</div>
				</div>
				<div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0">
				<%if (auth==0) {%>
				<h4>
				주문 내역
				</h4>
				<hr>
				<br>
				<div class="change" align="center" style="background-color: #f0f0f0; margin: 0 auto; width: 750px;">
				<table>
					<thead>
					<% while(odDtos.next()) {%>
					<tr>
						<th class="product-th"><%= odDtos.getString("o_id")%> </th>
						<th class="quy-th"><%=odDtos.getString("o_date")%></th>
						<th class="pic-th"><img src=<%=odDtos.getString("p_pic") %> width="50" height="50"/></th>
						<th class="pdname-th"><a href="product.jsp?idx=<%= odDtos.getString("o.p_id")%>"> <%=odDtos.getString("p_name")%> </a></th>
						<th class="price-th"><%=odDtos.getInt("total_price")%></th>
						<th class="total-th"><button class="site-btn submit-order-btn" onclick="window.open('jsp/writeReview.jsp?o_id=<%=odDtos.getString("o_id") %>', '_blank', 'width=450px,height=350px,toolbars=no,scrollbars=no'); return false;">리뷰 쓰기</button></th>
					</tr>
					<%}%>
					</thead>
					<tbody>

				<%-- 	<%
										for (int i = 0; i < odDtos.size(); i++) {
											Order odDto = odDtos.get(i);
											/* ArrayList<Product> pdDtos = ptDAO.productSelect(
													"select * from product INNER JOIN cart ON cart.c_p_id where c_p_id=" + ctDto.getP_id());
											Product pdDto = pdDtos.get(i);
											sum += pdDto.getP_price(); */
									%> --%>

					<!-- <tr>
						<td>주문 번호</td>
						<td>상품명</td>
						<td><button>리뷰쓰기</button></td>
					</tr>
 -->
					<%-- <tr>
										<td class="product-col"><img src=<%=pdDto.getP_pic()%>
											alt="">
											<div class="pc-title">
												<h4><%=pdDto.getP_name()%></h4>
												<p><%=pdDto.getP_price()%></p>
											</div></td>
										<td class="quy-col">
											<div class="quantity">
												<div class="pro-qty">
													<input type="text" id="quantity" value="1">
												</div>
											</div>
										</td>

										<td class="total-col"><h4><%=pdDto.getP_price()%></h4></td>
									</tr> --%>
					</tbody>
				</table>
			</div>
			<%} else{ %>
				<h4>
				주문자 조회
				</h4>
				<hr>
				<div>
				
				<form class="search-form" method="get" action="mypage.jsp">
						<table width="100%">
						<th width="20%">
						<select name="swhat">
							   <option value="pname" selected>상품명</option>
							   <option value="pid">상품아이디</option>
						</select>
						</th>
						<th width="80%">
						<input width="300px" id="search" type="text" name="search" value="" placeholder="Search ....">
						<button hidden>
							<i class="flaticon-search"></i>
						</button>
						</th>
						</table>
				</form>
				</div>
				<br>
				<div class="row">
                    <%
                        int size = pdDtos.size();
                        for(int i=0;i<size;i++){
                            Product pdDto = pdDtos.get(i);
                    %>
						<div class="col-lg-4 col-sm-6">
							<div class="product-item" style="margin:10px;">
								<div>
									<div style="width:50%; float:left;">
                                    <img width="200px" src=<%="http://localhost:8080/SE_2/"+pdDto.getP_pic() %> alt="">
									</div>
									<div style="width:50%; float:right; padding-left:5px;">
									<%String name = pdDto.getP_name();
									if(name.length()>10)
										name = name.substring(0,10)+"...";
									%>
									<p><%=name%><br><%=pdDto.getP_price() %></p>
									<button onclick="location.href='seeOrderers.jsp?idx=<%=pdDto.getP_id() %>'" class="fix">
									 	조회하기
									</button>
									</div>						
								</div>
							</div>
						</div>
						
						<%
                        }
                        %>
					</div>
			<%} %>
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