<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page import="dto.Reply"%>
<%@ page import="dto.Question"%>
<%@ page import="dao.QuestionDAO"%>
<jsp:useBean id="qDAO" class="dao.QuestionDAO"/>

<html>
  <head>
 
    <title>상품 리뷰</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/><link rel="stylesheet" type="text/css" href="/SE_2/css/newstyle.css" />
<!-- Stylesheets -->
<link rel="stylesheet" href="/SE_2/css/bootstrap.min.css" />
<link rel="stylesheet" href="/SE_2/css/font-awesome.min.css" />
<link rel="stylesheet" href="/SE_2/css/flaticon.css" />
<link rel="stylesheet" href="/SE_2/css/slicknav.min.css" />
<link rel="stylesheet" href="/SE_2/css/jquery-ui.min.css" />
<link rel="stylesheet" href="/SE_2/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/SE_2/css/animate.css" />
<link rel="stylesheet" href="/SE_2/css/style.css" />

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
      
      .products_question_list{
      	padding: 20 20 20 20;
      }
      .my-btn{
        color: #000000;
	    border: #000000 solid 1px;
	    padding: 10px;
	    background-color: #ffffff;
     }
     .my-btn:hover{
        color: #ffffff;
    	background-color: #000000;
     }
     .btnArea{
     	margin-top:20px;
     	float:right;
     }
     .products_question_form__head{
     	margin-top:20px;
     }

    </style>
<%
String p_id=request.getParameter("idx");
%>
  </head>
  <body>
  <div class="products_question_list">
  <div class="products_question_form ">
  <div class="products_question_form__head">
    <div class="products_question_form__title">
    <button class="panel-link2">PRODUCT Q &amp; A</button>
    </div>
  </div>
</div>

  <div id="prdQnA" class="ec-base-tab grid5 ">
<div class="board SMP_board_wrap">
                    <div class="prd-subtitle">
                        <p class="txt_c margin_t10">상품에 대한 궁금한점이 있으신가요? 글을 남겨주시면 친절하고 빠르게 답변드릴게요 :D</p>
                    </div>
                    <div class="xans-element- xans-product xans-product-qna"><a href="" name="use_qna"></a>
<p class="noAccess displaynone">글읽기 권한이 없습니다.</p>
<div class="minor displaynone">
                        </div>
<table border="1" summary="" class="board ">
<caption>상품 Q&amp;A</caption>
                            <colgroup>
<col style="width:70px;"/>
<col style="width:134px;"/>
<col style="width:auto"/>
<col style="width:152px;"/>
</colgroup>
<thead><tr>
<th scope="col"  style='text-align:center;'>번호</th>
                                   <th scope="col"  style='text-align:center;'>카테고리</th>
                                   <th scope="col"  style='text-align:center;'>제목</th>
                                   <th scope="col"  style='text-align:center;'>작성자</th>
                               </tr></thead>
<tbody>
<%
ArrayList<Question> qDtos = qDAO.questionSelect("select * from question where p_id="+p_id);

for(int i=0;i<qDtos.size();i++){
	Question qDto = qDtos.get(i);
%>
<tr class="xans-record-"  style='text-align:center;'>
<td  style='text-align:center;'><%= i+1%></td>
                                    <td></td>
                                    <td class="subject">
                                    
	                                    <div class="q_title_click" id="q_title_click_<%=i %>" style="display:block">
	                                    <a href="javascript:clickTitle(<%=i%>);"><%= qDto.getTitle()%></a>
	                                    </div>
	                                    <div class="q_content_click" id="q_content_click_<%=i %>" style="display:none">
	                                    <%=qDto.getContent() %>
	                                    <div class="products_reviews_list_review__foot" id="q_reples_<%=i %>" style="display:none">
            
										  <div class="comments js-comments-container js-ie-opacity-fix">
										    <div class="comments__arrow_top"></div>
										          <%
										          ArrayList<Reply> rpList = qDto.getReples();
										          if(rpList!=null){
										      	 for(int j=0;j<rpList.size();j++){
										      		 Reply rp = rpList.get(j);
										      		 String comment_id = qDto.getP_id()+"_"+Integer.toString(j);
										      	 
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
										          <input type="hidden" name="u_id" value=<%=(String) session.getAttribute("u_id") %>>
										          <input type="hidden" name="q_id" value=<%=qDto.getQ_id() %>>
										          <input type="hidden" name="p_id" value=<%=request.getParameter("idx") %>>
										          
										        </form>
										      </div>
										
										          </div>
										      </div>
	                                    </div>
 
                                    </td>
                                    <td style='text-align:center;'> <%= qDto.getU_id()%></td>
                                </tr>
<%
}
%>
</tbody>
</table>
</div>
                    
                    <div class="btnArea">
                        
                        <button class="my-btn" onclick="window.open('jsp/writeQuestion.jsp?p_id=<%=p_id %>', '_blank', 'width=450px,height=350px,toolbars=no,scrollbars=no'); return false;"><span class="write_btn">상품문의하기</span></button></th>
                        
                        <button class="my-btn"><span class="list_btn">모두보기</span></button>
                    </div>
                    <!--
                    <div module="product_qnapaging" class="SMPC_paging">
                        <p class="first"><a href=""><span>&#60;&#60;</span></a></p>
                        <p><a href=""><span>&#60;</span></a></p>
                        <ol>
                            <li><a href="" class=""></a></li>
                            <li><a href="" class=""></a></li>
                            <li><a href="" class=""></a></li>
                            <li><a href="" class=""></a></li>
                            <li><a href="" class=""></a></li>
                        </ol>
                        <p><a href=""><span>&#62;</span></a></p>
                        <p class="last"><a href=""><span>&#62;&#62;</span></a></p>
                    </div>
                    -->
                </div>
            </div>
<div id="Detail_Page_Relation_Wrap" class="detail_info">
                            </div>
</div>
</body>
<script>

var q_t=null;
var q_c=null;
function clickTitle(val){
	q_t = document.getElementById("q_title_click_"+val);
	q_c = document.getElementById("q_content_click_"+val);
	q_r = document.getElementById("q_reples_"+val);
	
	if(q_c.style.display=='none'){
		q_c.style.display='block';
		q_r.style.display='block';
	}
	else{
		q_c.style.display='none';
		q_r.style.display='none';
	}
}
</script>
</html>

