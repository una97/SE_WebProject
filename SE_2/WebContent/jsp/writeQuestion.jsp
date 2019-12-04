<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=UTF-8"); %>
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
  			margin: 0 0px;
    		padding: 0 60px;
   			text-align: center; }
	    .review_header .GgyUmV6pji ._2SfzGkqkVW {
	      	font-size: 16px;
	      	line-height: 50px;
	      	color: #000000; }
	    .review_header .GgyUmV6pji ._1GpYkcB8y_ {
		    margin-left: 0px;
		    font-size: 18px;
		    line-height: 50px;
		    color: rgba(255, 255, 255, 0.5); }
	    .review_header .GgyUmV6pji ._1GpYkcB8y_ ._29Ef9teHRk {
	        font-weight: bold;
	        color: #000000; }
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
	  		margin-top: 20px;
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
	  ._24w0ToMXo- ._1FcR2l9t3Q {
		    display: inline-block;
		    position: relative;
		    vertical-align: top; }
	  ._24w0ToMXo- ._1FcR2l9t3Q ._3Q4AGAjnPM {
	      position: relative;
	      margin-top: 6px;
	      color: #959595;
	      font-size: 13px; }
	  ._24w0ToMXo- ._1FcR2l9t3Q ._3Q4AGAjnPM.hlntCJv3fo {
	      color: #fd0303; }
	  ._24w0ToMXo- .OO02FTHqZp {
	      position: relative;
	      white-space: nowrap; }
	  ._24w0ToMXo- .OO02FTHqZp:after {
	      display: block;
	      clear: both;
	      content: ''; }
	  ._24w0ToMXo- ._92gtIHEDor {
	      float: right;
	      cursor: pointer;
	      -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }
      ._24w0ToMXo- ._92gtIHEDor:before {
	      background-image: url(https://ssl.pstatic.net/imgshopping/display/p/static/20191128194724/img/sprite/svg/spSw_review_write_svg.svg);
	      background-size: 293px 282px;
	      background-position: -128px -112px;
	      width: 44px;
	      height: 44px;
	      display: block;
	      margin: 0 5px;
	      will-change: animation;
	      content: ''; }
      ._24w0ToMXo- ._92gtIHEDor.VsNxhfpqhM:before {
	      -webkit-animation: _3Oa5950gaE 0.3s;
	              animation: _3Oa5950gaE 0.3s; }
      ._24w0ToMXo- ._92gtIHEDor:hover:before, ._24w0ToMXo- ._92gtIHEDor[aria-checked=true]:before,
	  ._24w0ToMXo- ._92gtIHEDor:hover ~ ._92gtIHEDor:before, ._24w0ToMXo- ._92gtIHEDor[aria-checked=true] ~ ._92gtIHEDor:before {
	      background-image: url(https://ssl.pstatic.net/imgshopping/display/p/static/20191128194724/img/sprite/svg/spSw_review_write_svg.svg);
	      background-size: 293px 282px;
	      background-position: -76px -112px;
	      width: 44px;
	      height: 44px; }
	  ._24w0ToMXo- ._92gtIHEDor:active {
	      background-color: rgba(0, 0, 0, 0); }
	  ._24w0ToMXo- ._92gtIHEDor.VsNxhfpqhM:before {
	      -webkit-animation: _3Oa5950gaE 0.3s;
	              animation: _3Oa5950gaE 0.3s; }
	  .ystMZ36gvH {
	  	position: relative; }
	  .ystMZ36gvH .BZyU-p_AWZ {
	    position: relative;
	    padding-bottom: 31px; }
	  .ystMZ36gvH ._30-j0z23yB {
	    position: relative;
	    margin: 11px 20px 0;
	    padding: 10px 10px 11px;
	    border: 1px solid #cbcbcb;
	    background-color: #f4f4f4; }
	  .ystMZ36gvH ._30-j0z23yB._2CEGIJbJ0M ._3q5Xc5vA7u {
	      display: none; }
	  .ystMZ36gvH ._30-j0z23yB._2CEGIJbJ0M ._2WdOh6YXC8 ._3LoikG0PPT {
	      color: #555; }
	  .ystMZ36gvH ._30-j0z23yB .pDVeNEj8SU {
	      position: absolute;
	      top: 10px;
	      left: 10px;
	      right: 10px;
	      font-size: 13px;
	      line-height: 19px;
	      color: #999;
	      text-align: left; }
	  .ystMZ36gvH ._30-j0z23yB ._2mqbEheJIc {
	      width: 100%;
	      min-height: 100px;
	      border: none;
	      background-color: transparent;
	      -webkit-box-sizing: border-box;
	              box-sizing: border-box;
	      font-size: 13px;
	      line-height: 19px;
	      color: #555;
	      vertical-align: top;
	      resize: none; }
	  .ystMZ36gvH ._30-j0z23yB ._2WdOh6YXC8 {
	      position: relative;
	      margin: 10px 5px 0 0;
	      font-family: Helvetica, Sans-serif;
	      font-size: 15px;
	      line-height: 17px;
	      color: #959595;
	      text-align: right; }
	  .ystMZ36gvH ._30-j0z23yB ._2WdOh6YXC8 ._2dV9e5HlSd {
	        background-image: url(https://ssl.pstatic.net/imgshopping/display/p/static/20191128194724/img/sprite/svg/spSw_review_write_svg.svg);
	        background-size: 293px 282px;
	        background-position: -244px -184px;
	        width: 7px;
	        height: 12px;
	        display: inline-block;
	        margin: 2px 1px 0;
	        vertical-align: top; }
	  ._1LztV9Gn1N ._2V5Ia-aBFt + ._2FL-GHAhIL {
      		padding-top: 33px; }
._1LztV9Gn1N ._2FL-GHAhIL {
    display: table;
    margin: 0 auto;
    padding: 20px 2px 0;
    background-color: #fff;
    -webkit-box-sizing: border-box;
            box-sizing: border-box;
    table-layout: fixed; }
    ._1LztV9Gn1N ._2FL-GHAhIL ._3SQqSVM0EV {
      display: table-cell;
      width: 180px;
      padding: 0 2px; }
    ._1LztV9Gn1N ._2FL-GHAhIL .R0u9hFXbSr,
    ._1LztV9Gn1N ._2FL-GHAhIL ._78HygPZEhQ {
      width: 100%;
      height: 40px;
      border: none;
      background-color: transparent;
      cursor: pointer;
      -webkit-appearance: none;
      border: 1px solid;
      line-height: 38px;
      font-size: 13px;
      font-weight: 500;
      text-align: center; }
    ._1LztV9Gn1N ._2FL-GHAhIL .R0u9hFXbSr {
      border-color: #c5cbd0;
      color: #555; }
    ._1LztV9Gn1N ._2FL-GHAhIL ._78HygPZEhQ {
      border-color: rgba(0, 0, 0, 0.1);
      background-color: #00c73c;
      color: #fff; }
      ._1LztV9Gn1N ._2FL-GHAhIL ._78HygPZEhQ:disabled {
        background-color: #dadde3;
        border-color: #d3d6da; }
    ._1LztV9Gn1N ._2FL-GHAhIL + ._1XIo2lQ0t7 {
      margin-top: 40px; }
      
     ._3SQqSVM0EV{
        margin: 0;
	    border: 0;
	    left:15%;
	    font-size: 18px;
	    position: relative;
	    margin-top: 35px;
	    margin-left: 0px;
	    width: 200px;
	    height: 50px;
	    text-align: center;
	    box-sizing: border-box;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    -webkit-user-select: none;
	    cursor: default;
     }
     ._3SQqSVM0EV{
        color: #000000;
	    border: #000000 solid 1px;
	    padding: 10px;
	    background-color: #ffffff;
     }
     ._3SQqSVM0EV:hover{
        color: #ffffff;
    	background-color: #000000;
     }
     </style>
     <!--====== Javascripts & Jquery ======-->
	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.slicknav.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.nicescroll.min.js"></script>
	<script src="../js/jquery.zoom.min.js"></script>
	<script src="../js/jquery-ui.min.js"></script>
	<script src="../js/main.js"></script>
	
</head>
<body style="overflow-y:scroll">
<div id="MainContent">
<header class="review_header">
	<h1 class="GgyUmV6pji">
	<span class="_2SfzGkqkVW" style="color:white">리뷰하기</span>
	</h1>
	<a href="#" role="button" class="_2GFmOgYde3 N=a:wrtrv.hdcls" onclick="window.close()">
	</a>
</header>
<%
String u_id=(String)session.getAttribute("u_id");
if(u_id==null){
	PrintWriter script = response.getWriter();
	
	script.println("<script>");
	script.println("alert('로그인이 필요합니다.')");
	script.println("history.back()");
	script.println("</script>");
}
%>
<form action="/SE_2/WriteQuestion.do" method="post">
<input type="hidden" name="p_id" value=<%=request.getParameter("p_id") %> />
<input type="hidden" name="u_id" value=<%=(String)session.getAttribute("u_id") %> />

<div class ="-OcYLr6Qe6">
	<div class="oViOeBoH3d">
		<input type="text" name="q_title" placeholder="문의합니다." value="문의합니다." style="width:90%;font-size:14px;padding:10px;"/>
	</div>
	<div class="oViOeBoH3d">
		<div class="ystMZ36gvH">
			<div class="_30-j0z23yB _2CEGIJbJ0M">
				<textarea name="q_content" class="_2mqbEheJIc" id="questionInput" cols="30" style="height: 100px;"></textarea>
			</div>
		</div>
	</div>
</div>

<div class ="-OcYLr6Qe6">
	<div class="_2FL-GHAhIL" style='display:inline'>
		<div class="_3SQqSVM0EV" onclick="window.close()" style='display:inline;float:left;top:0%;'>
			취소
		</div>
		<div class="_3SQqSVM0EV" onclick="submit()" style='display:inline;float:left;top:0%;'>
			등록
		</div>
	</div>
</div>
</form>
</div>
<script>
var question=null;
var o_id=null;

function submit(){
	question = $("#questionInput").val();
	
	if(question==null)
		alert("문의를 작성해주세요.");
	else{
		var f = document.getElementsByTagName("form")[0]; // form 엘리멘트 생성 
	
		f.submit(); // form 태그 서브밋 실행
		
	}
}

</script>

</body>
</html>