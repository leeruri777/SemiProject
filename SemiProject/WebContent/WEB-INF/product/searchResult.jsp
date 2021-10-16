<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
   String ctxPath = request.getContextPath();
%>  

<jsp:include page="../include/header.jsp"></jsp:include>

<title>[소녀떡집]검색결과</title>


<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />


<style type="text/css">
   div.container{
      width:80%;
      font-family: Sans KR;
      font-style: normal;
        font-weight: 100;
   }
   div.top{
      margin : 5pt 0pt 0pt 0pt;
      padding: 0;
      text-align: left;
   }
   div.products{
      margin:0;
      display: inline-block;
      
   }
   span#font1 {
      font-size: 10pt;
      
   }
   div.card {
      border: none;
      
   }
   
   div.card:hover { border: solid 1px gray;}
   
   #sm-title {
      font-size: 14px;
      font-weight: bold;
      padding-top: 5pt;
   }
   
   
   
   div.card-body {
      heigth:50px;
      text-align: center;
   }
   
   hr#line1{
      padding-left: 0;
      margin: 0;
   }
   
   img.img_prod {
      -webkit-transform: scale(1);
      transform: scale(1);
      -webkit-transition: .3s ease-in-out;
      transition: .3s ease-in-out;
   }
   
   img.img_prod_hover {
      -webkit-transform: scale(1.1);
      transform: scale(1.1);
      margin-bottom: 15px;
   }
   
   
</style>

<script type="text/javascript">

   $(document).ready(function() {
      
      $("div.card-body").hover(function() {             
            $(this).find(".img_prod").addClass("img_prod_hover");
         }, function() {
            $(this).find(".img_prod").removeClass("img_prod_hover");
         }
      );
      
         
      $("div.card").click(function(event){
         
         //   var prod_name = $(this).(".card-body").html();
            // console.log($(this).find("#prod_code").val());
            
            
         var prod_code = $(this).find("#prod_code").val();
         
         location.href="/product/prodDetail.go?prod_code="+prod_code;
         
      }); // end of $("div.card").click(function(event){
               
      
   })//------------------------------------------------------------
   

</script>


<div class="container my-5 ">

	
      <div class="top mx-0 px-0">
		<p id="sm-title">[&nbsp;${searchWord}&nbsp;]&nbsp;검색결과</p>				
      </div>
      
      <hr class="my-1">

		<div id="img_list" class="product row w-100 mx-0 px-0"> 
		   <c:if test="${not empty productList}">		      
		         
		        <c:forEach var="pvo" items="${productList}">
		           <div class="card col-sm-3 col-4">
		             <div class="card-body px-1">
		                <img src="../img_prod/${pvo.imgvo.prod_img_url}" style="width:100%" class="img_prod img-fluid">
		                 <span id="font1" style="text-align: center">${pvo.prod_name}
		                    
		                    <c:if test="${pvo.discount_price eq '-9999'}">
		                       <b><br><span><fmt:formatNumber value="${pvo.prod_price}" pattern="###,###"/>원 </span></b>
		                    </c:if>   
		                    <c:if test="${pvo.discount_price ne '-9999'}">
		                          <b><br><span style="text-decoration: line-through;"><fmt:formatNumber value="${pvo.prod_price}" pattern="###,###"/>원</span></b>
		                          <br><span><fmt:formatNumber value="${pvo.discount_price}" pattern="###,###"/>원</span>   
		                    </c:if>
		                </span>
		                <input id="prod_code" type="hidden" value="${pvo.prod_code}" /> <!-- value에 DB연결하고 prod_code 넣을것 -->
		             </div>
		           </div>
		        </c:forEach>   
		     		  	 
		   </c:if>
		   
		   <c:if test="${empty productList}">
	   		  
	   		  <p class="my-5 h6 text-center w-100">검색결과가 없습니다</p>
	   		
	   	   </c:if>
		   
	   </div>
	   
</div>

<jsp:include page="../include/footer.jsp"></jsp:include>