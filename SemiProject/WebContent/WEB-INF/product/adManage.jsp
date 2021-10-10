<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="../include/header_admin.jsp"></jsp:include>

<title>[관리자메뉴]상품관리</title>


<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath %>/css/style.css" />
<script type="text/javascript" src="<%= ctxPath %>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<style type="text/css">

   div.container {   width: 70%;}
   
   div#top {margin: 0 auto;}
   
   div#main {margin: 0 auto;}
   
   li.myli {
      background-color: #ffffff;   
      font-weight: bold; 
   }
   
      li.myli:hover {cursor: pointer;}
   
</style>

<script type="text/javascript">
   
   $(document).ready(function() {
      
	   
      
   })// end of $(document).ready(function() {})-------------------------------------------
   
   ////////////////////////////////////////////////////////////
   
   // Function Declaration
   
   function insertBanner() {
	   ///////////////////////////////////////////////////////////////////////여기할차례~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   }
   
</script>
      
   <div class="container mt-5 pt-5 px-0 offset-lg-3 col-lg-9">   
     	
         <h4>배너관리</h4>
         <hr>
                  
         <%-- 배너관리페이지 탑부분 시작 --%>   
         <div id="top">
            
            <form name="memberFrm" class="row w-100">
               
               <div class="col-md-9 mb-2 pl-4">
                  <select id="searchType" name="searchType">                  
                     <option value="sort_name" selected="selected">카테고리명</option>
                     <option value="sort_code">카테고리코드</option>
                  </select>
                  
                  <input type="text" id="searchWord" name="searchWord" />
                  
                  <button type="button" class="btn btn-light btn-sm border" onclick="goSearch();">검색</button>
               </div>
               
               <div class="col-md-3 text-right mb-2 px-0 mx-0">
                  <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#newModal">신규배너등록</button>
               </div>   
               
            </form>
            
         </div>
         <%-- 배너관리페이지 탑부분 끝 --%>   
         
         
         
         <%-- 배너관리페이지 메인부분 시작 --%>
         
         <div id="main" class="w-100 row">
            
            <div class="table-responsive content">
               
               <table class="table table-hover text-center">                     
                                                       
                  <tbody>
                  
                     <c:forEach var="bannerMap" items="${bannerList}">
                        <form>
                        
                        	<c:if test="${bannerMap.img ne '-9999' }">
                        		
                        		<tr class="row w-100 px-0 mx-0">
                        			<td class="col-md-2 col-6">
		                               <p class="my-md-5 pt-2">${bannerMap.sort.sort_code}</p>
		                            </td>
		                            <td class="col-md-2 col-6">
		                               <p class="my-md-5 pt-2">${bannerMap.sort.sort_name}</p>
		                            </td>                        			
                        			<td class="col-md-5 mx-0 px-0">
		                               <img src="../img_prod/${bannerMap.img}" class="img-fluid mx-0 px-0">
		                            </td>		                            
		                            <td class="col-md-3">
		                               <button type="button" class="btn btn-sm btn-primary my-1 mx-1 mx-1 my-md-5">수정</button>                  
                                 	   <button type="button" class="btn btn-sm btn-danger my-1 mx-1 mx-1 my-md-5">삭제</button>
		                            </td>                        		
                        		</tr>
                        		
                        	</c:if>
                           
                        </form>
                     </c:forEach>                           
                              
                  </tbody>
                  
               </table>
            </div>   
                    
               
            <div id="nav"  class="mt-4 col-12">
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
         <%-- 배너관리페이지 메인부분 끝 --%>
         
         <div class="modal fade" id="newModal" data-backdrop="static">
			  <div class="modal-dialog modal-dialog-scrollable modal modal-dialog-centered">
			  
			    <div class="modal-content">
			      
			      <!-- Modal header -->
			      <div class="modal-header">
			        	<h5 class="modal-title">신규배너등록</h5>
			        	<button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			      
			      <!-- Modal body -->
			      <div class="modal-body row">
			      	<form>
			      		<label class="col-3" >카테고리</label>
			      		<select class="col-6" name="sort_code">
			      			<c:forEach var="bannerMap" items="${bannerList}">
			      				<c:if test="${bannerMap.img eq '-9999' }">
			      					<option value="${bannerMap.sort.sort_code}">${bannerMap.sort.sort_name}</option>
			      				</c:if>
			      				<c:if test="${bannerMap.img ne '-9999' }">
			      					<option value="${bannerMap.sort.sort_code}" disabled="disabled">${bannerMap.sort.sort_name}</option>
			      				</c:if>			      			
			      			</c:forEach>
			      		</select>
			      		<br><br>
	          			<label class="col-3" for="addFile1">베너이미지</label>	          			
						<input class="col-6 px-0" type="file" name="ad_img_url">	
					</form>				
			      </div>
			      
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-success" onclick="insertBanner();">등록</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			      </div>
			    </div>
			  </div>
		</div>
         
         
   </div>

<jsp:include page="../include/footer_admin.jsp"></jsp:include>