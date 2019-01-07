<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>재능나눔 게시판 </title>


    <link rel="stylesheet" href="lib/css/pagination.css">
    <link href="css/gaia.css"  rel="stylesheet">
     <!-- style★ -->

    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/showList.css"  rel="stylesheet">
  </head>

  <body>
    <div id="main">
    <jsp:include page="nav.jsp"/>

	<!-- Side -->
	<div id="wrap">
		<div id="wingNavi_ty2"class="hayley">  
		<c:forEach var="vo" items="${list }" varStatus="idx">          
	        <li>
	            <a href="javascript:chkLogin(${vo.r_idx})" target="_self" data-log="Main_Right_Banner1">
	            <img src="${vo.imagepath }" alt="sale " width="112" height="100"></a>
	        </li>
          </br>
		</c:forEach>
		    <li>
				<a href="#" target="_top" class="btn_gotop"><img src="images/top.gif" alt="페이지 상단으로 이동" width="112" height="34"></a>
			</li>
		</div>
	</div>	
  
  
    <!-- Portfolio -->
    <section class="content-section" id="portfolio">
      <div class="container">
        <div class="content-section-heading text-center">
          <h2 class="text-secondary mb-0">재능나눔</h2>
          <h3 class="mb-5">함께나누면 두배 즐거운 재능을 나눠보아요</h3>
		</div>
	  <div class="row no-gutters">        
      <%-- 여기부터 나눔보기 반복문 --%>
      <c:forEach var="vo" items="${list }" varStatus="idx">
          <div class="col-lg-6 col-xl-4">
             <a class="portfolio-item" href="javascript:chkLogin(${vo.r_idx})">
             <span class="caption"></span>
          <div class="card" style="width: 18rem;">
		 	 <img class="card-img-top" src="${vo.imagepath }" alt="Card image cap" style="width: 250px; height: 154px;">
			  <div class="card-body">
			     <h5 class="card-title">${vo.r_title }</h5>
			     <p class="card-text overwrap">${vo.r_sTitle}</p>
			     <a href="javascript:chkLogin(${vo.r_idx})" class="btn btn-primary">나눔 상세보기</a>
			  </div>
		  </div>
			</a>
		 </div>
	 </c:forEach>


     <!-- 페이징 -->
	 <div class="container">
       <nav aria-label="Page navigation example">
			${pageCode }	             
	   </nav>
	</div>		
      
          
     <!-- 검색창 -->
	 <div class="input-box" style="margin-left: 410px;">
       <select name="search" id="search" style="height: 27px;">
               <option value="r_title">제목</option>
               <option value="r_writer">글쓴이</option>
       </select>
       <input type="text" name="searchValue" id="searchValue" placeholder="검색어 입력">
       <button type="button" class="btn btn-outline-info" onclick="search()">검색</button>
     </div>
	</div>           
   </div>
 	 	</section>

 
 	<!-- Footer -->
	<jsp:include page="footer.jsp"/>
 
 
  </div>
  
  	<script src="js/jquery.min.js"></script>

	<script>
		function search(){
		    var searchType = document.getElementById("search").value;
		     var searchValue = document.getElementById("searchValue").value.trim();
		   
		   if(searchValue != null && searchValue != "")
		      location.href = "rlist?searchType="+searchType+"&searchValue="+searchValue
		   else
		      alertify.alert("검색어를 입력해 주세요");
		 }
		
		function chkLogin(r_idx){
			if(${lvo != null}){
				location.href = 'rdetail?r_idx='+r_idx+'&nowPage='+${nowPage};
			}
			else
				alertify.alert("로그인이 필요합니다");
		}
 	</script>
</body>
</html>