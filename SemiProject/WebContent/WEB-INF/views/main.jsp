<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/include/header.jsp"/>
<title>[소녀떡집]</title>

<!-- Font Awesome 5 Icons --> <!-- 아이콘을 사용하려면 헤드에서 미리 링크를 걸어줘야한당 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />

<style type="text/css">
	
	.card:hover {
		background-color: #f2f2f2;
		cursor: pointer;
	}
		
</style>
 
<script>

function addAddresForm(){
	var url = "/member/addAddress.go";
	// 너비 800, 높이 650인 팝업창을 화면 가운데에 띄우기 
	var pop_width = 800;
	var pop_height = 600;
	var pop_left = Math.ceil((window.screen.width - pop_width)/2 );
	var pop_top = Math.ceil((window.screen.height - pop_height)/2 );
	
	window.open(url, "배송지 추가",
    "left="+pop_width+", top="+pop_top+", width="+pop_width+", height="+pop_height);
}

$(document).ready(function(){
	
	$(".card").click(function() {
		
		var prod_code = $(this).find(".prod_code").text();
		
		location.href = "/product/prodDetail.go?prod_code=" + prod_code;
		
	});
	
 });

</script>
 
	<!-- Header-->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<ol class="carousel-indicators">
		
			<c:if test="${not empty bannerList}">
				<c:forEach items="${bannerList}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 0}">
							<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						</c:when>
						<c:otherwise>
							<li data-target="#carouselExampleIndicators" data-slide-to="${status.index}"></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty bannerList}">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</c:if>
			
		</ol>
		<div class="carousel-inner">
		
			<c:if test="${not empty bannerList}">
				<c:forEach var="bannerMap" items="${bannerList}" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 0}">
							<div class="carousel-item active">
								<img src="../img_prod/${bannerMap.img}" class="d-block w-100" alt="..." style="max-height: 450px;" onclick="location.href='/product/prodList.go?sort_code=${bannerMap.sort_code}'">
							</div>
						</c:when>
						<c:otherwise>
							<div class="carousel-item">
								<img src="../img_prod/${bannerMap.img}" class="d-block w-100" alt="..." style="max-height: 450px;" onclick="location.href='/product/prodList.go?sort_code=${bannerMap.sort_code}'">
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>			
			</c:if>
			
			<c:if test="${empty bannerList}">
				<div class="carousel-item active">
					<img src="/images/carousel-bg/carousel-bg1.jpg" class="d-block w-100" alt="..." style="max-height: 450px;">
				</div>
				<div class="carousel-item">
					<img src="/images/carousel-bg/carousel-bg2.jpg" class="d-block w-100" alt="..." style="max-height: 450px;">
				</div>
				<div class="carousel-item">
					<img src="/images/carousel-bg/carousel-bg3.jpg" class="d-block w-100" alt="..." style="max-height: 450px;">
				</div>
			</c:if>
			
		</div>
		<a class="carousel-control-prev w-90" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only"></span>
		</a>
		<a class="carousel-control-next w-90" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only"></span>
		</a>
	</div>
	
	<!-- Section-->
        <a href="/member/login.go">로그인화면</a>
		<a href="/member/signUp.go">회원가입 화면</a>
		<a href="/member/updateMember.go">회원정보 수정 화면</a>
		<a href="javascript:addAddresForm()">배송지 등록하기</a>
		<a href="/admin/sendMessage.go">메세지 전송하기</a>
		
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
            	
            	<h4 class="text-center">NEW ARRIVAL</h4>
            	<hr>
            	
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-lg-4 justify-content-center">                	
                	
                	<c:forEach var="newpvo" items="${newList}">
                		
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                        	<span style="display: none;" class="prod_code">${newpvo.prod_code}</span>
	                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">NEW</div>
	                            <%-- Product image--%>
	                            <img class="card-img-top" src="../img_prod/${newpvo.imgvo.prod_img_url}" alt="..." />
	                            <%-- Product details--%>
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <%-- Product name--%>
	                                    <h6 class="fw-bolder">${newpvo.prod_name}</h6>
	                                    <%-- Product price--%>
	                                    <fmt:parseNumber var="prod_price" value="${newpvo.prod_price}" integerOnly="true" />
									
										<c:if test="${newpvo.discount_price eq '-9999'}">									
											<span><fmt:formatNumber value="${prod_price}" pattern="###,###" />원</span>
										</c:if>									
										<c:if test="${newpvo.discount_price ne '-9999'}">									
											<span style="text-decoration: line-through;"><fmt:formatNumber value="${prod_price}" pattern="###,###" />원</span>
											<br>
											<fmt:parseNumber var="sale_p" value="${newpvo.discount_price}" integerOnly="true" />
											<span><fmt:formatNumber value="${sale_p}" pattern="###,###" />원</span>
											<br>
											<small style="color:red;">(<fmt:formatNumber value="${100 - (sale_p * 100) / prod_price}" pattern="#"/>% 할인)</small>
										</c:if>										
	                                </div>
	                            </div>	                               
	                        </div>
	                    </div>
                    </c:forEach>
                    
             	</div>
             	
            	<h4 class="text-center">WEEKLY HIT</h4>
            	<hr>
            	
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-lg-4 justify-content-center">                	
                	
                	<c:forEach var="hitpvo" items="${hitList}">
                		
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                        	<span style="display: none;" class="prod_code">${hitpvo.prod_code}</span>
	                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">HIT</div>
	                            <%-- Product image--%>
	                            <img class="card-img-top" src="../img_prod/${hitpvo.imgvo.prod_img_url}" alt="..." />
	                            <%-- Product details--%>
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <%-- Product name--%>
	                                    <h6 class="fw-bolder">${hitpvo.prod_name}</h6>
	                                    <%-- Product price--%>
	                                    <fmt:parseNumber var="prod_price" value="${hitpvo.prod_price}" integerOnly="true" />
									
										<c:if test="${hitpvo.discount_price eq '-9999'}">									
											<span><fmt:formatNumber value="${prod_price}" pattern="###,###" />원</span>
										</c:if>									
										<c:if test="${hitpvo.discount_price ne '-9999'}">									
											<span style="text-decoration: line-through;"><fmt:formatNumber value="${prod_price}" pattern="###,###" />원</span>
											<br>
											<fmt:parseNumber var="sale_p" value="${hitpvo.discount_price}" integerOnly="true" />
											<span><fmt:formatNumber value="${sale_p}" pattern="###,###" />원</span>
											<br>
											<small style="color:red;">(<fmt:formatNumber value="${100 - (sale_p * 100) / prod_price}" pattern="#"/>% 할인)</small>
										</c:if>										
	                                </div>
	                            </div>	                               
	                        </div>
	                    </div>
                    </c:forEach>
                    
             	</div>
             	 
            	<h4 class="text-center">BEST</h4>
            	<hr>
            	
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-lg-4 justify-content-center">                	
                	
                	<c:forEach var="bestpvo" items="${bestList}">
                		
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                        	<span style="display: none;" class="prod_code">${bestpvo.prod_code}</span>
	                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">BEST</div>
	                            <%-- Product image--%>
	                            <img class="card-img-top" src="../img_prod/${bestpvo.imgvo.prod_img_url}" alt="..." />
	                            <%-- Product details--%>
	                            <div class="card-body p-4">
	                                <div class="text-center">
	                                    <%-- Product name--%>
	                                    <h6 class="fw-bolder">${bestpvo.prod_name}</h6>
	                                    <%-- Product price--%>
	                                    <fmt:parseNumber var="prod_price" value="${bestpvo.prod_price}" integerOnly="true" />
									
										<c:if test="${bestpvo.discount_price eq '-9999'}">									
											<span><fmt:formatNumber value="${prod_price}" pattern="###,###" />원</span>
										</c:if>									
										<c:if test="${bestpvo.discount_price ne '-9999'}">									
											<span style="text-decoration: line-through;"><fmt:formatNumber value="${prod_price}" pattern="###,###" />원</span>
											<br>
											<fmt:parseNumber var="sale_p" value="${bestpvo.discount_price}" integerOnly="true" />
											<span><fmt:formatNumber value="${sale_p}" pattern="###,###" />원</span>
											<br>
											<small style="color:red;">(<fmt:formatNumber value="${100 - (sale_p * 100) / prod_price}" pattern="#"/>% 할인)</small>
										</c:if>										
	                                </div>
	                            </div>	                               
	                        </div>
	                    </div>
                    </c:forEach>
                    
             	</div>       
                    
        <%--            
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Sale Item</h5>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Fancy Product</h5>
                                    <!-- Product price-->
                                    $120.00 - $280.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Special Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Popular Item</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                           
                        </div>
                    </div>
                 --%> 
                
            </div>
        </section>
        

<jsp:include page="/WEB-INF/include/footer.jsp"/>