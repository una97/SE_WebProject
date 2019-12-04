<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<jsp:useBean id="pdDAO" class="dao.ProductDAO" />
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

<style>
table.type04 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.type04 th {
	/* width: 300px; */
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type04 td {
	/* width: 100px; */
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>

<%
	ArrayList<Sharing> shDtos = pdDAO.getSharing();
%>
</head>
<body>

	<jsp:include page="jsp/header.jsp" flush="false" />
	<!-- Header section end -->

	<!-- Page info -->

	<div class="page-top-info">
		<div class="container">
			<h4>Sharing Event</h4>
			<h5>쉐어링 이벤트</h5>
		</div>
	</div>


	<section class="category-section spad">
		<div class="container">




			<!-- 	<div class="col-lg-9  order-1 order-lg-2 mb-5 mb-lg-0"> -->
			<table class="type04">
				<thead>
					<tr>
						<th scope="cols"></th>
						<th scope="cols">상품명</th>

						<th scope="cols">가격</th>
						<th scope="cols">할인율</th>

						<th scope="cols">신청시작일</th>
						<th scope="cols">신청종료일</th>
						<th scope="cols">신 청</th>
					</tr>
				</thead>
				<%
					for (int i = 0; i < shDtos.size(); i++) {
						Sharing shDto = shDtos.get(i);
				%>
				<tr>

					<form action="/SE_2/checkSharing" method="post">
						<td><img src=<%=shDto.getS_p_img()%> width="200px" alt=""></td>
						<td><%=shDto.getS_p_name()%></td>
						<td><%=shDto.getS_p_price()%></td>
						<td><%=shDto.getDiscount()%>%</td>

						<td><input type="date" name="start"></td>

						<td><input type="date" name="end"></td>

						<td>
							<button type="submit">신청</button>
						</td> <input type="hidden" name="s_p_id" value=<%=shDto.getS_p_id()%> />

					</form>
				</tr>

				<%
					}
				%>

			</table>




		</div>
		<!-- </div> -->

		</div>
	</section>


</body>
</html>