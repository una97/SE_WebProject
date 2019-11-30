<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="dto.Review"%>
<%@ page import="dao.ReviewDAO"%>
<jsp:useBean id="rvDAO" class="dao.ReviewDAO"/>

<html>
<head>
<title>리뷰하기</title>
    <style id=DOCUMENT_HEAD_STYLE_ID type="text/css">
    	.review_header {
  			background-color: #000000; }
  		.review_header .GgyUmV6pji {
    		padding: 0 60px;
   			text-align: center; }
	    .review_header .GgyUmV6pji ._2SfzGkqkVW {
	      	font-size: 16px;
	      	line-height: 50px;
	      	color: #fff; }
	    .review_header .GgyUmV6pji ._1GpYkcB8y_ {
		    margin-left: 4px;
		    font-size: 18px;
		    line-height: 50px;
		    color: rgba(255, 255, 255, 0.5); }
	    .review_header .GgyUmV6pji ._1GpYkcB8y_ ._29Ef9teHRk {
	        font-weight: bold;
	        color: #fff; }
	  	.review_header ._1LN12vC0m- {
		    position: absolute;
		    left: 0;
		    top: 0;
		    padding: 16px 20px; }
	    .review_header ._1LN12vC0m-:before {
		    background-image: url(https://ssl.pstatic.net/imgshopping/display/p/static/20191128194724/img/sprite/svg/spSw_review_write_svg.svg);
		    background-size: 293px 282px;
		    background-position: -4px -259px;
		    width: 19px;
		    height: 19px;
		    display: block;
		    content: ''; }
	  .review_header ._2GFmOgYde3 {
		    position: absolute;
		    right: 0;
		    top: 0;
		    padding: 16px 20px; }
      .review_header ._2GFmOgYde3:before {
	        background-image: url(https://ssl.pstatic.net/imgshopping/display/p/static/20191128194724/img/sprite/svg/spSw_review_write_svg.svg);
	        background-size: 293px 282px;
	        background-position: -220px -230px;
	        width: 17px;
	        height: 17px;
	        display: block;
	        content: ''; }
	  .oViOeBoH3d {
		    border-top: 1px solid #eee;
		    background-color: #fff;
		    text-align: center; }
	  .oViOeBoH3d:first-child {
	    	border-top: 0; }
	  .oViOeBoH3d ._3y9Ly2IiVh {
	    	display: block;
	    	padding-top: 28px;
	    	font-size: 18px; }
	  ._1LztV9Gn1N .-OcYLr6Qe6 {
		    margin-top: 9px;
		    background-color: #fff;
		    text-align: center; }
     </style>
</head>
<body style="overflow-y:scroll">
<div id="MainContent">
<header class="review_header">
	<h1 class="GgyUmV6pji">
	<span class="_25fzGkqkVW">리뷰하기</span>
	</h1>
	<a href="#" role="button" class="_2GFmOgYde3 N=a:wrtrv.hdcls">
	<span class="blind">닫기</span>
	</a>
</header>
<div class ="-OcYLr6Qe6">
	<h3 class="blind">상품 리뷰 작성</h3>
	<div class="oViOeBoH3d">
		<strong class="_3y9L2IiVh">상품은 만족하셨나요?</strong>
		<div class="_1FcR219T3Q">
			<div class="OO02FHqZp" role="radiogroup">
				<a href="#" class="_92gtIHEDor VsNxhfpqhM N=a:wrtrv.rate5" role="radio" aria-checked="false" data-value="5">
				<span class="blind">5</span>
				</a>
				<a href="#" class="_92gtIHEDor VsNxhfpqhM N=a:wrtrv.rate4" role="radio" aria-checked="false" data-value="4">
				<span class="blind">4</span>
				</a>
				<a href="#" class="_92gtIHEDor VsNxhfpqhM N=a:wrtrv.rate3" role="radio" aria-checked="false" data-value="3">
				<span class="blind">3</span>
				</a>
				<a href="#" class="_92gtIHEDor VsNxhfpqhM N=a:wrtrv.rate2" role="radio" aria-checked="false" data-value="2">
				<span class="blind">2</span>
				</a>
				<a href="#" class="_92gtIHEDor VsNxhfpqhM N=a:wrtrv.rate1" role="radio" aria-checked="false" data-value="1">
				<span class="blind">1</span>
				</a>
			</div>
		</div>
	</div>
	<div class="oViOeBoH3d">
		<div class="ystMZ236gvH">
			<div class="_30-j0z23yB _2CEGIJbJ0M">
				<textarea class="_2mqbEheJIc" id="reviewInput" cols="30" style="height: 100px;"></textarea>
			</div>
		</div>
	</div>
</div>
<div class ="-OcYLr6Qe6">
	<div class="_2FL-GHAhIL">
		<div class="_35QqSVM0EV">
			<button class="R0u9hFXbSr N=a:wrtrv.cls">취소</button>
		</div>
		<div class="_35QqSVM0EV">
			<button class="_78HygPZEhQ N=a:wrtrv.ok">등록</button>
		</div>
	</div>
</div>
</div>
</body>
</html>