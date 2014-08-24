<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.review.ReviewVO"%>
<%
	ArrayList<ReviewVO> list = (ArrayList) request
			.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
%>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript">

function Confirmation(id) {
	if (confirm("삭제 하시겠습니까?")) {

		location.href = "./reviewDelete.lo?review_id=" + id
	} else {
	}
}

	function listMove() {
	
		moveform.submit();
	}
	function retrievalList() {
		
		retrievalform.submit();
	}
	
	 $(document).ready(function() {   
	        $('.aa tr').hide();
	        $('.aa').find('.studygroup').parent().show();
	        
	      $('.aa tr').toggle(
	          function(){   
	              var tr=$('.aa tr');
	                var rindex=$(this).parent().children().index(this);
	                  for(var i=rindex;i<=rindex+1;i++)
	                  {
	                    $(tr[i]).show();
	                  }
	            }, 
	            function(){
	                var tr=$('.aa tr');
	                var rindex=$(this).parent().children().index(this);
	                  for(var i=rindex+1;i<=rindex+1;i++)
	                  {
	                	  if (i==1 || i==3 || i==5 || i==7 || i==9 || i==11 || i==13 || i==15 || i==17 || i==19 ) {
	                		  $(tr[i]).hide();
	                      }
	                  }	                
	              });	       
	    });		 
</script>

<!-- container -->

<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>후기</strong>
	</h2>
	<div class="combine">
		<p class="ac mb30">
			<img src="${_ContextPath}/images/sub/img_review.png" alt="통째로 빌렸다 여행후기를 남겨주세요." />
		</p>
		<table summary="검색 영역" class="basic" style="width: 50%; margin: auto;" />
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
		<form action="./listMove.do"  method="post" name="moveform">
			<tr>
				<th>분류명</th>
				<td><select class="max" name="status" >
						<option value="a">호텔을 통째로 빌렸다</option>
						<option value="b">기차를 통째로 빌렸다</option>
						<option value="c">마을을 통째로 빌렸다</option>
						
				</select></td><td><a href="javascript:listMove()" class="ml10"><img src="${_ContextPath}/images/sub/btn_search.png" alt="검색" /></a></td>
			</tr>
		</form>
		<form action="./retrievalList.do" method="post" name="retrievalform">
			<tr>
				<th>행사명</th>
				<td><input type="text" class="med gray" name="retrieval"/><a href="javascript:retrievalList()" class="ml10"><img src="${_ContextPath}/images/sub/btn_search.png" alt="검색" /></a></td>
			</tr>
		</form>
		</tbody>
		</table>		
	
		<br><br><br><br>

		<table summary="후기 리스트 영역" class="basic_list">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="65%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th>NO</th>
					<th>IMAGE</th>
					<th>행사명/PREVIEW</th>
					<th>NAME/POINT</th>
				</tr>
			</thead>
			
				<tr>
					<td><img src="${_ContextPath}/images/sub/icon_notice.png" alt="공지사항" /></td>
					<td>공지</td>
					<td class="al">관련없는 글, 욕설, 비방 등은 통보없이 삭제될 수 있습니다.</td>
					<td>관리자</td>
				</tr>
			<tbody class="aa">	
				<%for (int i = 0; i < list.size(); i++) {ReviewVO reviewVO = (ReviewVO) list.get(i);%>
				<tr>
					<td><%=reviewVO.getReview_id() %></td>
					
					<%if(reviewVO.getThumb_nail_path()==null){ %>
					<td><img src="${_ContextPath}/images/sub/review.png" alt="샘플 상품 이미지"
						style="width: 73px; height: 100px;" /></td>
					<%}else{ %>
					<td><img src="<spring:eval expression="@config['product.htmlPath']"/>
					<%=reviewVO.getThumb_nail_path() %>" style="width: 73px; height: 100px;" alt="샘플 이벤트 이미지" /></td>
					<%} %>
					<td class="studygroup">
						<ul>
							<li>여행명:<%=reviewVO.getReview_title() %></li>
							<li>내용: <%=reviewVO.getContent()%><%if(reviewVO.getContent().length()>=100){ %>..<%} %></li>
						</ul>
					</td>
					<td><%=reviewVO.getMember_id()%>
						<p class="starpoint">
						
						<%if(reviewVO.getReview_rating()==1){ %>
							<img src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" />
						<%} %>
						<%if(reviewVO.getReview_rating()==2){ %>
							<img src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" />
						<%} %>
						<%if(reviewVO.getReview_rating()==3){ %>
							<img src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" />
						<%} %>
						<%if(reviewVO.getReview_rating()==4){ %>
							<img src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" />
						<%} %>
						<%if(reviewVO.getReview_rating()==5){ %>
							<img src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" /><img
								src="${_ContextPath}/images/sub/img_starpoint.png" alt="별점" />
						<%} %>
						</p>
					</td>
				</tr>
				<tr>
						<td></td><td></td>
					<td>
					<div>
						<ul>
							<li>
								<%if(reviewVO.getImage_pass().equals("noImage")){ %>
								<%}else{ %>
								<div style="float: left; margin-bottom: 20px;">
								<img src="<spring:eval expression="@config['product.htmlPath']"/>
								<%=reviewVO.getImage_pass().split(",")[0] %>" style="width: 300px; height: 400px;" alt="샘플 이벤트 이미지" />
								</div>
									<%if(reviewVO.getImage_pass().split(",")[1].equals("noImage")){ %>
									<%}else{ %>
									<div style="float: none; margin-bottom: 20px;">
									<img src="<spring:eval expression="@config['product.htmlPath']"/>
									<%=reviewVO.getImage_pass().split(",")[1] %>" style="width: 300px; height: 400px;" alt="샘플 이벤트 이미지" />
									</div>
							</li>
							<li>
										<%if(reviewVO.getImage_pass().split(",")[2].equals("noImage")){ %>
										<%}else{ %>
										<div style="float: left; margin-bottom: 20px;">
										<img src="<spring:eval expression="@config['product.htmlPath']"/>
										<%=reviewVO.getImage_pass().split(",")[2] %>" style="width: 300px; height: 400px;" alt="샘플 이벤트 이미지" />
										</div>
											<%if(reviewVO.getImage_pass().split(",")[3].equals("noImage")){ %>
											<%}else{ %>
											<div style="float: none; margin-bottom: 20px;">
											<img src="<spring:eval expression="@config['product.htmlPath']"/>
											<%=reviewVO.getImage_pass().split(",")[3] %>" style="width: 300px; height: 400px;" alt="샘플 이벤트 이미지" />
											</div>
							</li>
											<%} %>
										<%} %>
									<%} %>
								<%} %>
							<li style="margin-top: 20px;"><%=reviewVO.getReview_content()%>
							</li>
						</ul>
					</div>	
					</td>
					<td >
					<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
						<a href="#" onclick="javascript:Confirmation('<%=reviewVO.getReview_id()%>')"><font color=#FF8224>삭제</font> </a>
					</c:if>
					</td>
				</tr>
				<%}%>
			</tbody>
		</table>

		<div class="paging">
			<%if (nowpage <= 1) {%><a><span class="prev"></span></a>
				
				<%} else {%><a href="./retrievalList.do?page=<%=nowpage - 1%>"><span class="prev"></span></a><%}%>
				
				<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%><a class="current"><%=a%></a>
				
				<%} else {%><a href="./retrievalList.do?page=<%=a%>"><%=a%> </a><%}%><%}%>
				
				<%if (nowpage >= maxpage) {%><a><span class="next"></span></a>
				
				<%} else {%><a href="./retrievalList.do?page=<%=nowpage + 1%>"><span class="next"></span></a></li><%}%>
		</div>
	</div>
</div>
<!-- //container -->