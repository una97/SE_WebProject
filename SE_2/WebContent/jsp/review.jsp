<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="dto.Reply"%>
<%@ page import="dto.Review"%>
<%@ page import="dao.ReviewDAO"%>
<jsp:useBean id="rvDAO" class="dao.ReviewDAO"/>

<html>
  <head>
    
    <title>상품 리뷰</title>
    <!--[if lt IE 9]>
      <script src="//assets5.cre.ma/m/widgets/javascripts/html5shiv-printshiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" media="all" href="https://assets5.cre.ma/latte/assets/pc/application-f6a094aeedc899f1776813413ff45e9da63669afa48ebe40ed5d8c9bc155eecb.css" />
    <style type="text/css">
      span.star, span.camera, .sprite_comment {
        background-image: url(https://assets5.cre.ma/p/uniqueon-co-kr/brand_settings/00/00/00/00/01/sprite/d3800c6208a54c9e.png);
      }

      .mall-link-color {
        color: #6eb67e;
      }

      .review_comment_color {
        color: #6db67e;
      }
      .panel-link2{
      	text-align: left;
		position: relative;
		width: 100%;
		font-size: 14px;
		font-weight: 700;
		color: #414141;
		padding: 0;
		text-transform: uppercase;
		line-height: 1;
		cursor: pointer;
		border: none;
		min-height: 69px;
		background-color: transparent;
		border-radius: 0;
      }
      
      .products_liviews_body{
      	padding: 20 20 20 20;
      	border-bottom-color:#e1e1e1;
      }
    </style>

    <script>
      function fimg(id, w, h) {
        var img = document.getElementById(id);
        if(img && !img.complete) {
          var width = img.width || img.offsetWidth;
          img.style.height = Math.round(img.width / w * h) + "px";
          img.onload = function() {
            this.style.height = "";
          }
        }
      }
    </script>
  </head>
  <body class="unknown unknown-78 windows_os products reviews ko-KR" lang="ko-KR" data-action="reviews" data-brand-code="uniqueon.co.kr" data-controller="products" data-enable-nonmember-evaluation="true" data-facebook-app-id="339825122890117" data-facebook-sdk-version="v2.9" data-gaq-account="UA-45818307-10" data-iframe-id="crema-product-reviews-1" data-is-logged-in="false" data-loader-url="//assets5.cre.ma/m/widgets/loader.gif" data-login-alert="로그인이 필요한 서비스입니다. 로그인 하시겠습니까?" data-mall-login-url="http://www.uniqueon.co.kr/member/login.html" data-no-popstate="false" data-parent-url="https://www.uniqueon.co.kr/product/%EC%9B%8C%ED%82%A4-%EB%B0%98%ED%95%98%EC%9D%B4-%EB%84%89%EB%84%89-%EC%9D%BC%EC%9E%90%ED%95%8F-%EB%B0%91%EB%8B%A8-%EC%98%86%ED%8A%B8%EC%9E%84-%EC%B2%AD%EB%B0%94%EC%A7%80/8101/category/1/display/7/" data-rails-env="production" data-review-message-all-exposed="false" data-shop-builder="cafe24" data-widget-id="2" data-fixed-top-menu-height="0" data-device="pc">
    <div class="watermark">
  

</div>

    <div id="i18n" style="display: none" data-image-size-too-large="첨부한 이미지 파일이 너무 큽니다. 더 작은 이미지를 첨부해주세요." data-close="닫기" data-error-403="접근 권한이 없습니다." data-error-404="요청하신 페이지를 찾을 수 없습니다." data-error-422="요청이 거부되었습니다." data-error-etc="요청을 처리하던 중 오류가 발생했습니다. 조속히 해결하겠습니다." data-image-field-cant-add-photo-without-file-input="파일 선택창이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file-reader="파일 미리 보기가 지원되는 브라우저가 아니어서 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-without-file="선택된 파일이 없어 사진을 추가할 수 없습니다." data-image-field-cant-add-photo-with-file-type="선택된 파일이 이미지 형식이 아닙니다. (선택된 형식:%{file_type})" data-image-field-cant-add-photo-with-file-name="이미지 형식의 파일만 첨부할 수 있습니다. (선택된 파일명:%{file_name})" data-app-restrict-image-upload="파일 업로드를 하려면 모바일 기본브라우저에서 쇼핑몰 모바일웹(%{url})으로 접속해주세요." data-review-already-posted="이미 리뷰를 작성한 상품입니다." data-review-already-largest-image="현재 이미지가 원본 크기입니다." data-require-update-app="원활한 사진첨부를 위해서 앱 업데이트가 필요합니다. 업데이트 하시겠습니까?" data-input-prompt="값을 입력해주세요."></div>

    <div id="content">
      
    
<%
int idx = Integer.parseInt(request.getParameter("idx"));
ArrayList<Review> rvDtos = rvDAO.reviewSelect("select * from review INNER JOIN orders ON review.o_id = orders.o_id where p_id="+idx);
%>
<div class="products_reviews_list">
  <div class="products_reviews_form ">
  <div class="products_reviews_form__head">
    <div class="products_reviews_form__title">
    <button class="panel-link2">상품 리뷰</button>
    </div>
  </div>
</div>
  <div class="products_liviews_body">
  <div
    class="products_reviews_summary
           products_reviews_summary--small_with_score
           products_reviews_summary--without_write_form"
    data-url="/uniqueon.co.kr/products/reviews?app=0&amp;atarget=reviews&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.uniqueon.co.kr%2Fproduct%2F%EC%9B%8C%ED%82%A4-%EB%B0%98%ED%95%98%EC%9D%B4-%EB%84%89%EB%84%89-%EC%9D%BC%EC%9E%90%ED%95%8F-%EB%B0%91%EB%8B%A8-%EC%98%86%ED%8A%B8%EC%9E%84-%EC%B2%AD%EB%B0%94%EC%A7%80%2F8101%2Fcategory%2F1%2Fdisplay%2F7%2F&amp;product_code=8101&amp;widget_env=100"
  >
    <div class="products_reviews_summary__inner">
        <div class="score_summary score_summary--list">
  		  <div class="score_summary__body">
    		<div class="score_summary__avg_score">
      			<div class="score_summary__average">4.8</div>
      			<div class="score_summary__reviews_count"><%= rvDtos.size()%>개 리뷰 평점</div>
    		</div>
    		
    		<ul class="score_summary__score_filters">
	          <li class="score_summary__score_filter " data-score="5">
	            <a class="js-link-score">
	              <div class="score_summary__score_filter__title">5 Stars</div>
	              <div class="score_summary__score_filter__status">
	                <div class="score_summary__score_filter__count">(175)</div>
	                <div class="score_summary__score_filter__check sprites-check"></div>
	              </div>
                  <div class="score_summary__score_filter__gauge">
                    <div style="width: 83%" class="percentile"></div>
                  </div>
                </a>
              </li>
      
	          <li class="score_summary__score_filter " data-score="4">
	            <a class="js-link-score">
	              <div class="score_summary__score_filter__title">4 Stars</div>
	              <div class="score_summary__score_filter__status">
	                <div class="score_summary__score_filter__count">(24)</div>
	                <div class="score_summary__score_filter__check sprites-check"></div>
	              </div>
	              <div class="score_summary__score_filter__gauge">
	                <div style="width: 11%" class="percentile"></div>
	              </div>
	            </a>
	          </li>
      
	          <li class="score_summary__score_filter " data-score="3">
	            <a class="js-link-score">
	              <div class="score_summary__score_filter__title">3 Stars</div>
	              <div class="score_summary__score_filter__status">
	                <div class="score_summary__score_filter__count">(12)</div>
	                <div class="score_summary__score_filter__check sprites-check"></div>
	              </div>
	              <div class="score_summary__score_filter__gauge">
	                <div style="width: 6%" class="percentile"></div>
	              </div>
	            </a>
	          </li>
      	      
      	      <li class="score_summary__score_filter " data-score="2">
	            <a class="js-link-score">
	              <div class="score_summary__score_filter__title">2 Stars</div>
	              <div class="score_summary__score_filter__status">
	                <div class="score_summary__score_filter__count">(0)</div>
	                <div class="score_summary__score_filter__check sprites-check"></div>
	              </div>
	              <div class="score_summary__score_filter__gauge">
	                <div style="width: 0%" class="percentile"></div>
	              </div>
	            </a>
	          </li>
	          <li class="score_summary__score_filter " data-score="1">
	            <a class="js-link-score">
	              <div class="score_summary__score_filter__title">1 Stars</div>
	              <div class="score_summary__score_filter__status">
	                <div class="score_summary__score_filter__count">(1)</div>
	                <div class="score_summary__score_filter__check sprites-check"></div>
	              </div>
	              <div class="score_summary__score_filter__gauge">
	                <div style="width: 0%" class="percentile"></div>
	              </div>
	            </a>
	          </li>
     
    		</ul>
 		 </div>
		</div>
      </div>
  </div>


  <div class="widget_reviews js-pagination-list  ">
    <div class="products_reviews_header">
  	  <div class="products_reviews_header__upper">
    	<span class="products_reviews_header__sort_type products_reviews_header__sort_type--selected">
      	  <strong>추천순</strong> 리뷰 (<span class="reviews-count"><%= rvDtos.size()%></span>)
   	 	</span>
    	<span class="products_reviews_header__sort_type_divider"> | </span>
   		<a href="#" data-remote="true">
    	  <span class="products_reviews_header__sort_type">최신순</span>
    	</a>
  	</div>
  	  <div class="products_reviews_header__separator"></div>
  	</div>
  </div>
  
  <div class="widget_reviews__body products_reviews_list__body">
    <div class="page">
  	  <ul class="reviews reviews-product">
  	  <%
  	  for(int i=0;i<rvDtos.size();i++){
  		Review rvDto = rvDtos.get(i);
  	  %>
			<li
			  id="review_41739"
			  class="review products_reviews_list_review product_review__container "
			>
			  <div class="products_reviews_list_review__inner">
			    <div class="products_reviews_list_review__info_container">
			      <ul>
			        <li>
			          <div class="products_reviews_list_review__info_title">작성자</div>
			          <div class="products_reviews_list_review__info_value"><%= rvDto.getU_id()%></div>
			        </li>

		          <li>
		            <div class="products_reviews_list_review__info_title">별점</div>
		            <div class="products_reviews_list_review__info_value">
		              
		               <%= rvDto.getR_star() %>개
		              
		            </div>
		          </li>
        
		      </ul>
		    </div>
		    
		    <div class="products_reviews_list_review__lcontents">
		      <div class="score products_reviews_list_review__head">
		        
		        <div class="products_reviews_list_review__score">
		          
		            <div class="products_reviews_list_review__score_like_result js-like-result">
		              <span class="js-likes-html "><strong class='js-like-score-total'><%=rvDto.getR_like()+rvDto.getR_hate() %></strong>명 중 <strong class='js-like-score-plus'><%= rvDto.getR_like()%></strong>명이 이 리뷰를 좋아합니다.</span>
		            </div>
		          
		        </div>
	      	  </div>
      <div class="products_reviews_list_review__content review_content ">
          <div class="products_reviews_list_review__message">
                
                  
                  <%=rvDto.getR_content() %>
                
          </div>
          <div class="products_reviews_list_review__foot">
            <div class="products_reviews_list_review__actions">
              <a class="products_reviews_list_review__comments_link mall-link-color js-link-expand">
                <span class="js-comments-link-no-comment hidden">
                  
                    댓글을 작성해주세요
                  
                </span>
                <span class="js-comments-link-count-text ">
                  <% ArrayList<Reply> rpList = rvDto.getReples();   %>
                  <span class="comments-count"><%= rpList.size()%></span>개의 댓글이 있습니다
                </span>
              </a>
              <div class="products_reviews_list_review__divider">|</div>
              <div
				  class="review_like_action js-like-action "
				  data-like-action-class="review_like_action"
				  data-url="/uniqueon.co.kr/reviews/41739/like?widget_env=100"
				>
			  <div class="review_like_action__label">이 리뷰가 도움이 되었나요?</div>
			  <div class="review_like_action__buttons">
			    <a class="review_like_action__button review_like_action__button--like js-link-like">네</a>
			    <a class="review_like_action__button review_like_action__button--unlike js-link-unlike">아니요</a>
			  </div>
			  <div class="review_like_action__score">
			    <div class="review_like_action__score_arrow"></div>
			    <span class="review_like_action__score_text js-like-score-text">+<%= rvDto.getR_like()%></span>
			  </div>
			</div>
            </div>
          </div>
          <div class="products_reviews_list_review__foot">
            
  <div class="comments js-comments-container js-ie-opacity-fix">
    <div class="comments__arrow_top"></div>
          <%
        
      	 for(int j=0;j<rpList.size();j++){
      		 Reply rp = rpList.get(j);
      		 String comment_id = rvDto.getO_id()+"_"+Integer.toString(j);
      	 
      %>
    <ul class="comments__list">

	<li class="comment" id=<%=comment_id %> >
	  <div class="comment__inner">
	    <div class="comment__lpane"><%= rp.getU_id()%> </div>
	    <div class="comment__rpane">
	      <div class="comment__error_message"></div>
	      <div class="comment__message">
	        <span class="comment__message_text"><%=rp.getR_reply() %></span>
	        
	      </div>
	    </div>
	    
	  </div>
	</li>


      
    </ul>
       	<%
      	 }
	%>
      <div class="comments__new_comment js-ie-opacity-fix">
        <form
          novalidate="novalidate"
          class="new_comment"
          data-login-required="true"
          data-remote="true"
          action="/SE_2/WriteReply.do"
          accept-charset="UTF-8"
          method="post"
        >
         
          <input
            placeholder="댓글을 작성해 주세요 :)"
            class="comments__new_comment_input js-input-block"
            data-login-required="true"
            type="text"
            name="comment"
          >
          
          <button class="comments__new_comment_submit_button js-ie-opacity-fix" type="submit">등록</button>
          <input type="hidden" name="u_id" value=<%=(String) session.getAttribute("u_id") %> >
          <input type="hidden" name="o_id" value=<%=rvDto.getO_id() %>>
          <input type="hidden" name="p_id" value=<%=request.getParameter("idx") %>>
          
        </form>
      </div>

          </div>
      </div>
    </div>
  </div>
</li>
<%
}
%>


  </ul>
</div>

</div>    
<div class="products_reviews__footer">
	<div class="widget_reviews__footer">
    	<div class="pagination">
    	  <a class="pagination__button pagination__button--prev pagination__button--disabled">&lt;</a>

          <a class="pagination__button pagination__button--active" href="#">1</a>

          <a class="pagination__button" data-remote="true" href="/uniqueon.co.kr/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;page=2&amp;parent_url=https%3A%2F%2Fwww.uniqueon.co.kr%2Fproduct%2F%EC%9B%8C%ED%82%A4-%EB%B0%98%ED%95%98%EC%9D%B4-%EB%84%89%EB%84%89-%EC%9D%BC%EC%9E%90%ED%95%8F-%EB%B0%91%EB%8B%A8-%EC%98%86%ED%8A%B8%EC%9E%84-%EC%B2%AD%EB%B0%94%EC%A7%80%2F8101%2Fcategory%2F1%2Fdisplay%2F7%2F&amp;product_code=8101&amp;widget_env=100">2</a>

    	  <a class="pagination__button pagination__button--next" href="/uniqueon.co.kr/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;page=2&amp;parent_url=https%3A%2F%2Fwww.uniqueon.co.kr%2Fproduct%2F%EC%9B%8C%ED%82%A4-%EB%B0%98%ED%95%98%EC%9D%B4-%EB%84%89%EB%84%89-%EC%9D%BC%EC%9E%90%ED%95%8F-%EB%B0%91%EB%8B%A8-%EC%98%86%ED%8A%B8%EC%9E%84-%EC%B2%AD%EB%B0%94%EC%A7%80%2F8101%2Fcategory%2F1%2Fdisplay%2F7%2F&amp;product_code=8101&amp;widget_env=100" data-remote="true">&gt;</a>

  		</div>
	</div>
</div>
</div>
</div>
</div>
<script>
var value=null;
var r_content=null;
var o_id=null;
function clickRadio(val){
	value=val.getAttribute("data-value");
	
	console.log(value);
}
</script>
    <script src="https://assets5.cre.ma/latte/assets/pc/application-b63842ea6cce178c2a3abd02cd39570fb0794f8a7b90b23163ef30099d3f398c.js"></script>
    <!--[if IE 7]>
      <script src="//assets5.cre.ma/m/widgets/javascripts/ie7.js"></script>
    <![endif]-->
    <script>
//<![CDATA[

      var ajax_setup_args = {cache: true, dataType: "script", accepts: {
        script: "text/javascript, application/javascript"
      }};
      $.ajaxSetup(ajax_setup_args);
      

//]]>
</script>    
    <script>
//<![CDATA[

//]]>
</script>
    <form id="form-upload-image" class="hidden" data-type="json" enctype="multipart/form-data" action="/uniqueon.co.kr/preview_images/upload?widget_env=100" accept-charset="UTF-8" data-remote="true" method="post"><input name="utf8" type="hidden" value="&#x2713;" />
  <div id="upload-fields-container"></div>
</form>
</body></html>

