<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>★★★★ 상품명 ★★★★ - 청년떡집</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

    
    <!-- Font Awesome 5 Icons --> <!-- 아이콘을 사용하려면 헤드에서 미리 링크를 걸어줘야한당 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath %>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath %>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css">

	div.container {	width: 90%;	}
	
	div#top {margin: 0 auto;}
	
	div#main {margin: 0 auto;}
	
	div#prod_img {
		display: inline-block;
		/* border: solid 1px red;	 */
	}
	
	div#prod_info {
		display: inline-block;
		/* border: solid 1px blue; */
	}
	
	div#btn {
		
	}
	
	div#tbl_prod_info {
		
	}
	
	table#tbl_info td {
		vertical-align: top;
		padding-right: 10px;
	}
	
	li.actives {
		background-color: #ffffff;	
		font-weight: bold;	
	}
	
	div#btn li:hover {cursor: pointer;}
 	
 	button.btn_select {background-color: fff; border: solid 1px #a6a6a6;}
 	
 	button.btn_select:hover {background-color: #a6a6a6; border: none; color: #fff;}
 	
 	button#buy {background-color: #4d4d4d; color: #fff;}
 	
 	button#buy:hover {background-color: #a6a6a6;}

	nav.navbar {width: 30%; margin: 0 auto; opacity: 0.5; height: 50px;}
	
	nav.navbar:hover {opacity: 1; cursor: pointer;}
	
	a.navbar-brand {text-align: center; margin: 0 auto; font-size: 13pt; width:50%;}
		
	a.navbar-brand:hover {font-weight: bold; text-decoration: underline;}
	
</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		/* >>> === 클릭한 탭(버튼)만 보이도록 하는 첫번째 방법 === <<< */
		$("li.tablinks").click(function(event) {
			
			var $target = $(event.target);
		
			var i = $("li.tablinks").index($target);
		
			$("div.content").css("display","none"); 
			
			$("div.content:eq(" + i + ")").css('display','block'); 
			
			$("li.tablinks").removeClass("actives");
			
			$("li.tablinks:eq(" + i + ")").addClass('actives');
		
			if(i != 0) {$("nav.navbar").hide();}
			else {$("nav.navbar").show();}
			
		});// end of $("button.tablinks").click(function(event) {}-------------------
		
		$("li.tablinks:eq(0)").trigger('click');
		
	})// end of $(document).ready(function() {})-------------------------------------------
	
</script>
</head>
<body>
		
	<div class="container mt-5">	
		
		<nav class="navbar bg-secondary navbar-dark fixed-bottom px-0 py-0">
	  		<a class="navbar-brand my-0" data-toggle="modal" data-target="#buyModal" href="#"><span class="case">구매하기</span></a>	  		
		</nav>
				
		<div class="modal fade" id="buyModal">
		  <div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
		  
		    <div class="modal-content">
		      
		      <!-- Modal header -->
		      <div class="modal-header">
		        	<h5 class="modal-title">구매하기</h5>
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      
		      <!-- Modal body -->
		      <div class="modal-body">
		        	<h5>타이니탄 인기크림떡 4종</h5>
          			<div class="row w-100">
          				<div class="col-6">타이니탄 4종 골라담기</div>
          				<div class="col-6"><select> <option>- [필수]옵션을 선택해 주세요 -</option></select></div>
          			</div>
		      </div>
		      
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-secondary">장바구니</button>
		        <button type="button" class="btn btn-secondary">바로구매</button>
		      </div>
		    </div>
		  </div>
		</div>
			
			
			<%-- 상품페이지 탑부분 시작 --%>	
			<div id="top" class="row w-100">
				
				<%-- 좌측 제품이미지: 반드시 하나가 아니라 여럿일 수 있음. DB에서 이미지 등 경로 가져와서 넣어야 함 --%>
				<div id="prod_img" class="col-lg-6 px-0 text-center">
					<img src="../../images_product/practiceimg.jpg" class="img-fluid" alt="Responsive image">
				</div>
				
				<%-- c:if 이용해서 품절일 경우 상품 가격에 취소선 등의 품절 시 효과 나타내야 함  --%>
				<%-- 우측 제품정보: DB에서 내용 끌어와야 함. 상품VO이용 --%>
				<div id="prod_info" class="col-lg-6">
				
					<table id="tbl_prod_info" class="ml-3 table table-borderless">
						
						<tr>
							<td colspan="2"><h3>타이니탄 인기크림떡 4종</h3></td>
						</tr>
						
						<tr>
							<td colspan="2"><h2>6,900원&nbsp;<span style="font-size: 12pt;">(적립금60원)</span></h2></td>
						</tr>
						
						<tr>
							<td class="">리뷰평점</td>
							<td class=""><img src="../../images_product/starYellow45.png" class="img-fluid" alt="Responsive image">&nbsp;&nbsp;<span class="small">4.69&nbsp;&nbsp;리뷰 개수 : 259</span></td>
						</tr>
						
						<tr>
							<td class="">배송비</td>
							<td class="">3,500원&nbsp;(39,800원 이상 구매 시 무료)</td>
						</tr>
						
						<tr style="border-top: solid 1px #d9d9d9; border-bottom: solid 1px #d9d9d9;">
							<td>타이니탄 4종 골라담기</td>
							<td>&nbsp;<select> <option>- [필수]옵션을 선택해 주세요 -</option></select></td>
						</tr>
						
						<tr>
							<td>총 상품금액(수량)</td>
							<td style="text-align: right;"><h2>0<small>(0개)</small></h2></td>
						</tr>
						
						<tr>
							<td colspan="2" class="text-center">
								<button type="button" class="btn col-3 mx-auto btn_select" id="like">관심상품</button>
								<button type="button" class="btn col-3 mx-auto btn_select" id="cart">장바구니</button>
								<button type="button" class="btn col-5 mx-auto" id="buy">구매하기</button>
							</td>
						</tr>
												
					</table>
					
				</div>
			</div>
			<%-- 상품페이지 탑부분 끝 --%>	
			
			<br>
			<hr>
			<br>
			
			<%-- 상품페이지 메인부분 시작 --%>
			
			<div id="main" class="row w-100">
				
				<div id="btn" class="col-12">
					<ul class="list-group list-group-horizontal row text-center">
						<li class="list-group-item list-group-item-secondary col tablinks">상세정보</li>
						<li class="list-group-item list-group-item-secondary col tablinks">상품정보</li>
						<li class="list-group-item list-group-item-secondary col tablinks">고객리뷰(★몇개?★)</li>
						<li class="list-group-item list-group-item-secondary col tablinks">Q&amp;A</li>
					</ul>
				</div>	   
								   
				<div id="detail_info" class="content mt-4 text-center mx-auto">
					<img src="../../images_product/practiceimg2.jpg" class="img-fluid" alt="Responsive image">					
				</div>
				   
				<div id="prod_info" class="content mt-4 mx-auto">			
					<table id="tbl_info">
						<tr>
							<td>
								<h6>상품결제정보<br><br>
									<span class="small">
										고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 
										확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.   
										<br>			
										무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
										주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다. 
									</span>
								</h6>
							</td>
							<td rowspan="2">
								<h6>교환 및 반품정보<br><br>
									<span class="small">
										<span style="font-weight: bold; text-decoration: underline;">교환 및 반품 주소</span><br> 
										-경기도 화성시 동탄물류로 48 CJ대한통운
										<br><br>
										<span style="font-weight: bold; text-decoration: underline;">교환 및 반품이 가능한 경우</span><br>
										- 제품의 하자가 있을 시, 상품을 공급 받으신 날로부터 7일이내
										  단,식품의 경우, 상품 출고 이후 상품의 변질 및 유통기한 단축 등으로 인해 재판매가 어려운 경우는 교환/반품이 불가할 수 있습니다.
										  가전제품의 경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
										- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과
										 다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내
										<br><br>
										<span style="font-weight: bold; text-decoration: underline;">교환 및 반품이 불가능한 경우</span><br> 
										- 냉동 식품 특성상 배송이 시작되면 취소/반품이 불가합니다. (단, 상품 불량인 경우 제외)<br>
										- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여
										 포장 등을 훼손한 경우는 제외<br>
										- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
										 (예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에
										 따른 반품/교환은 제조사 기준에 따릅니다.)<br>
										- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을
										 제공한 경우에 한 합니다.<br>
										- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
										- 복제가 가능한 상품등의 포장을 훼손한 경우
										 (자세한 내용은 고객만족센터 1:1 게시판 상담을 이용해 주시기 바랍니다.)<br>
										<br>
										※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.<br>
										 (색상 교환, 사이즈 교환 등 포함)<br>
										  단, 냉동 식품 특성상 배송이 시작되면 단순변심으로 인한 취소/반품이 불가합니다.
									</span>
								</h6>
							</td>
						</tr>
						<tr>
							<td>
								<h6>배송정보<br><br>
									<span class="small">
										배송 방법 : 택배<br>
								                  배송 지역 : 전국지역(도서산간 및 제주도 제외)<br>
									         배송 비용 : 3,500원<br>
									         배송 기간 : 1일 ~ 3일<br>
									         배송 안내 : - 산간벽지나 도서지방은 냉동상품 특성상 배송이 불가합니다. <br>
								      	- 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
						    		</span>
								</h6>
							</td>
						</tr>
					</table>
				</div>
				   
				<div id="review"  class="content mt-4 w-100 mx-0">
					<div id="stars" class="row w-100 py-0 text-center px-0 mx-0" style="border: solid 1px #e6e6e6;">
						<div class="col-md-3 pl-5 mt-2">
							<p style="font-weight: bold; font-size: 30pt;">4.7<span style="font-weight: normal; font-size: 20pt;">&nbsp;/5</span></p>
									
							<p>리뷰<span style="font-weight: bold;">&nbsp;256</span></p>
						</div>
						
						<div class="col-md-9 mt-2 pr-5" style="font-size: 10pt;">
							<div class="row mb-1">    
								<div class="col-2 px-2" style="text-align: right;">5 Stars</div>                		
								<div class="progress col-10 mx-0 px-0">
					            	<div class="progress-bar" style="width: 70%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="70" role="progressbar"></div>
					            </div>
				            </div>
				            <div class="row mb-1">    
								<div class="col-2 px-2" style="text-align: right;">4 Stars</div>                		
								<div class="progress col-10 mx-0 px-0">
					            	<div class="progress-bar" style="width: 20%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" role="progressbar"></div>
					            </div>
				            </div>
				            <div class="row mb-1">    
								<div class="col-2 px-2" style="text-align: right;">3 Stars</div>                		
								<div class="progress col-10 mx-0 px-0">
					            	<div class="progress-bar" style="width: 5%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="5" role="progressbar"></div>
					            </div>
				            </div>
				            <div class="row mb-1">    
								<div class="col-2 px-2" style="text-align: right;">2 Stars</div>                		
								<div class="progress col-10 mx-0 px-0">
					            	<div class="progress-bar" style="width: 4%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="4" role="progressbar"></div>
					            </div>
				            </div>
				            <div class="row mb-1">    
								<div class="col-2 px-2" style="text-align: right;">1 Stars</div>                		
								<div class="progress col-10 mx-0 px-0">
					            	<div class="progress-bar" style="width: 1%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="1" role="progressbar"></div>
					            </div>
				            </div>				            
						</div>
						
					</div>
					
					<div class="row w-100 my-0 py-0 px-0 mx-0" id="btn_review" style="border: solid 1px #e6e6e6; border-top: none;">
						<table class="w-100 mx-0 px-0">
							<tr>
								<td colspan="3"><span style="font-weight: bold; font-size: 15pt;">&nbsp;&nbsp;&nbsp;몇%</span>의 구매자들이 이 상품에 만족하고 있어요!</td>
								<td><button type="button" class="btn btn-secondary w-100 px-0 mx-0" style="border-radius: 0% 0%;">리뷰 등록하기</button></td>
							</tr>
						</table>						
					</div>
					
					<p class="mt-3 mb-1 px-0 mx-0"style="font-weight: bold;"><br>&nbsp;추천순(리뷰갯수)</p>
					<hr>
					
					<div id="review_card" class="px-0 mx-0">
						
						<div id="img_row" class="row w-100 px-0 mx-0">			
					    	<div class="card col-md-3 col-6 my-2">
					             <div class="card-body px-1">
					                 <img src="../../images_product/practiceimg.jpg" class="img-fluid" alt="Responsive image">
					                 <hr>
					                 <span id="font1">타이니탄 인기크림떡 4종 선물세트</span>					                 
					             </div>
					    	</div>
					    	
					        <div class="card col-md-3 col-6 my-2">
						          <div class="card-body px-1">
						              <img src="../../images_product/practiceimg.jpg" class="img-fluid" alt="Responsive image">
						              <hr>
						              <span id="font1">타이니탄 인기크림떡 4종<br><b>6,900원</b></span>
						          </div>
					        </div>
					        
					        <div class="card col-md-3 col-6 my-2">
						          <div class="card-body px-1">
						              <img src="../../images_product/practiceimg.jpg" class="img-fluid" alt="Responsive image">
						              <hr>
						              <span id="font1">윈터페스타크림떡 <br>티케이스 세트 <br><b>16,800원</b></span>
						          </div>
					        </div>
					        
					        <div class="card col-md-3 col-6 my-2">
						          <div class="card-body px-1">
						              <img src="../../images_product/practiceimg.jpg" class="img-fluid" alt="Responsive image">
						              <hr>
						              <span id="font1">넥스트레벨 <br>에스파는나야 <br><b>99,800원</b></span>
						          </div>
					        </div>				     
						</div>
					</div>
					
					<nav>
					  <ul class="pagination justify-content-center" style="margin:20px 0">
					    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item active"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">다음</a>
					  </ul>
					</nav>
					
										
				</div>
				
				<div id="qna"  class="content mt-4 col-12">
					
					<h5>Q&amp;A</h5>
					<hr>
					
					<div class="table-responsive">
						<table class="table table-hover text-center">
							
							<thead class="thead-light">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>113</td>
									<td>상품문의</td>
									<td>엄****</td>
									<td>2021-08-26</td>
									<td>0</td>
								</tr>
								<tr>
									<td>113</td>
									<td>상품문의</td>
									<td>엄****</td>
									<td>2021-08-26</td>
									<td>0</td>
								</tr>
								<tr>
									<td>113</td>
									<td>상품문의</td>
									<td>엄****</td>
									<td>2021-08-26</td>
									<td>0</td>
								</tr>
								<tr>
									<td>113</td>
									<td>상품문의</td>
									<td>엄****</td>
									<td>2021-08-26</td>
									<td>0</td>
								</tr>
							</tbody>
							
						</table>
					</div>
					
					<div class="mx-0 px-0 my-2 row justify-content-end">
						<button type="button" class="btn btn-dark mr-1">문의하기</button>						
						<button type="button" class="btn btn-light" style="border: solid 1px #d9d9d9">모두보기</button>
					</div>
					
					<nav>
					  <ul class="pagination justify-content-center" style="margin:20px 0">
					    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item active"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item"><a class="page-link" href="#">다음</a>
					  </ul>
					</nav>
					
				</div>
			   
			</div>			
			<%-- 상품페이지 메인부분 끝 --%>
			
			<%-- 최상단, 최하단 이동 버튼 시작 --%>
			<div style="position: fixed; bottom: 30px; right: 15px;">
				<p>
				<a href="#" style="display: scroll;" onfocus="this.blur()" rel="nofollow">
					<i class="fas fa-caret-square-up" style="font-size: 25pt; color: black;"></i>
				</a>
				</p>
				<p>
				<a href="#pagebottom" style="display: scroll;" onfocus="this.blur()" rel="nofollow">
					<i class="fas fa-caret-square-down" style="font-size: 25pt; color: black;"></i>
				</a>
				</p>
			</div>
			
			<div id="pagebottom"></div>
			<%-- 최상단, 최하단 이동 버튼 끝 --%>
			
	</div>
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>