<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="dto.Product"%>
<jsp:useBean id="pdDAO" class="dao.ProductDAO"/>
<%
    String imgPath = "dbimg/";
    ArrayList<Product> pdDtos = pdDAO.productSelect();
%>