<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductDAO"%>
<jsp:useBean id="pdDAO" class="dao.ProductDAO"/>

	<section class="related-product-section">
		<div class="container">
			<div class="section-title">
				<h2>RELATED PRODUCTS</h2>
			</div>
			<div class="product-slider owl-carousel">
			<%
			String category = request.getParameter("category");
			out.print(category);
			ArrayList<Product> pdDtos = pdDAO.productSelect("select * from product where p_category=\""+category+"\"");
			for(int i=0;i<pdDtos.size();i++){
                Product pdDto = pdDtos.get(i);
			%>
				<div class="product-item">
					<div class="pi-pic">
						<img src="<%=pdDto.getP_pic() %>" alt="">
						<div class="pi-links">
							<a href="#" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>
							<a href="#" class="wishlist-btn"><i class="flaticon-heart"></i></a>
						</div>
					</div>
					<div class="pi-text">
						<h6><%=pdDto.getP_price() %></h6>
						<p><%=pdDto.getP_name() %></p>
					</div>
				</div>
			<%
			}
			%>
			</div>
		</div>
	</section>