<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>나눔 상세보기</title>
    <link href="css/gaia.css"  rel="stylesheet">
  	<link href="css/showDetail.css"  rel="stylesheet">
</head>
<body>
	

  <div id="main">
	<jsp:include page="nav.jsp"/>
	   
    <!-- Page Content -->
    <div class="container">
	 <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">
					
          <!-- Title -->
          <h1 class="mt-4">제목: ${rvo.r_title}</h1>

          <!-- Author -->
          <p class="lead"> 작성자: <span class="name-text">${rvo.r_writer}</span>
          <br/>
          <span class="wd-text">${fn:substring(rvo.r_writeDate,0,10) }</span>   
          </p>
          <br>
            <div class="cateRight">
	           <span class="btn btn-warning">1차 카테고리: ${rvo.r_category1}</span>
	           <span class="btn btn-warning">2차 카테고리: ${rvo.r_category2}</span>
            </div>
			<hr>
		 
	      <!-- sTitle  -->
          <h5>간략 소개 : </h5>
        
          <!-- Preview Image -->
          <div class="fll"><img class="img-fluid rounded" src="${rvo.imagepath }" alt="image">
			<p>${rvo.r_sTitle}</p>
		  </div>
          </br>
          <hr>
          
          
    <!-- star -->
    <div class="col-lg-8 mb-8 margin2">
 	  <div>
       	   <input class="text-warning " type='hidden' value="${rc_avg}"/>
      		<c:if test="${rc_avg==0 }">
       	    	<img src="images/star_bic_0.PNG" >(0.0 stars)
       	    </c:if>
       	    <c:if test="${rc_avg==1 }">
       	    	<img src="images/star_bic_1.PNG" >(1.0 stars)
       	    </c:if>
       	    <c:if test="${rc_avg==2 }">
       	    	<img src="images/star_bic_2.PNG" >(2.0 stars)
       	    </c:if>
       	    <c:if test="${rc_avg==3 }">
       	    	<img src="images/star_bic_3.PNG" >(3.0 stars) 
       	    </c:if>
       	    <c:if test="${rc_avg==4 }">
       	    	<img src="images/star_bic_4.PNG" >(4.0 stars) 
       	    </c:if>
       	    <c:if test="${rc_avg==5 }">
       	    	<img src="images/star_bic_5.PNG" >(5.0 stars) 
       	    </c:if>          	
      </div>			
    </div>
	<hr>          
                   
                   
    <!-- Date -->
    <div class="input-group justify-content-center">
	<div class="btn btn-warning ">재능나눔 기간</div>
	  <span class="form-control col-lg-4" 
	  aria-label="Recipient's username with two button addons" aria-describedby="button-addon4">
	  <span class="name-size-bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  ${fn:substring(rvo.r_sDate,0,10)} ~ ${fn:substring(rvo.r_eDate,0,10)}</span>
	  </span>
	 	<div class="nowjoin"><input type="text" value="현재 참여인원: ${rvo.r_join } / ${rvo.r_equals }" disabled="disabled"
	 	style="height: 100%; text-align: center;">
	 	</div>
		<button class="btn btn-primary " id="regBtn" type="button" style="margin-left: 270px;">참여하기</button>
	</div>
	<hr>
		
		

	<!-- Content -->
	<nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" 
	    href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">서비스설명</a>
	    <a class="nav-item nav-link" id="nav-profile-tab" href="javascript:openWin();">
			지도보기
		</a>
    </div>
    </nav>
    
	<div class="tab-content" id="nav-tabContent">
  		<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"> <p>${rvo.r_content}</p>
             <form action="regEdit" method="post">
				<table>
					<colgroup>
					<col width="100px">
					<col width="300px">
					<col width="100px">
					</colgroup>
				  <tbody>
					<tr>
					  <td height="20" align="center" bgcolor="#669AB3"><font color="#FFFFFF">첨부파일</font></td>
					  <td colspan="3" bgcolor="#F2F7F9">
						  <a href="javascript:download('${rvo.uploadFileName}')">
						  	&nbsp;&nbsp;${rvo.uploadFileName}
						  </a>
					  </td>
			 		  <td>
				          <button class="btn btn-primary" type="button" onclick="editReg()">글 수정</button>
						  <button class="btn btn-danger" type="button" onclick="delReg()" >글  삭제</button>
						  <button class="btn btn-dark" type="button" 
							onclick="javascript:location.href='backlist?r_idx=${rvo.r_idx}&nowPage=${rvo.nowPage }'">나눔보기</button> 
					  </td>
			 		</tr>
				 </tbody>
			   </table> 
			 </form>
  		</div>
		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
	  		<p>${rvo.r_add}</p>
	  		<div id="map" style="width: 750px; height: 500px;">
			</div>
		</div>
	</div>
          
          <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">리뷰 남기기 :</h5>
            <div class="card-body">
              <form action="rcomm" method="post" name="cmtform">
                <div class="comment">
                <input type="hidden" name="rc_writer" value="${sessionScope.lvo.u_name }">
				<input type="hidden" name="nowPage" value="${param.nowPage }">
				<input type="hidden" name="r_idx" value="${rvo.r_idx }">
				<input type="hidden" name="u_idx" value="${lvo.u_idx }">
                <span class="margin">
					<img id=image1 onmouseover=show(1) onclick=mark(1) onmouseout=noshow(1) src="images/star0.png">
					<img id=image2 onmouseover=show(2) onclick=mark(2) onmouseout=noshow(2) src="images/star0.png">
					<img id=image3 onmouseover=show(3) onclick=mark(3) onmouseout=noshow(3) src="images/star0.png">
					<img id=image4 onmouseover=show(4) onclick=mark(4) onmouseout=noshow(4) src="images/star0.png">
					<img id=image5 onmouseover=show(5) onclick=mark(5) onmouseout=noshow(5) src="images/star0.png">
				</span>        
                <br/>
                <span class="margin1" id=startext>★★별점주기★★</span>                        
                  </div>
                  <input type='hidden' name="rc_star"/>
                <br/>
                  <textarea class="form-control" rows="3" name="rc_content"></textarea>
                    <button class="btn btn-primary" type="button" onclick="sendData(this.form)">등록하기</button>
               </form>
            </div>
          </div>

		  <!-- Single Comment -->
			<p>댓글 수: ${rc_count}</p>
          <c:forEach items="${rcvo}" var="rc">
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <a class="text-hayley1">${rc.rc_writer} </a><span>&nbsp;&nbsp;${fn:substring(rc.rc_writeDate,0,19)}</span>
          	   <c:if test="${sessionScope.lvo.u_name == rc.rc_writer}"> <!-- 작성자만 댓글 삭제 가능 -->
          	   <span><button class="del btn btn-danger" type="button" 
          	   onclick="javascript:location.href='del?r_idx=${rvo.r_idx}&rc_idx=${rc.rc_idx}&nowPage=${param.nowPage}'">
          	   <i class="fa fa-minus-circle"></i></button></span>
          	    </c:if>
          	   <div>
          	   <input class="text-warning" type='hidden' value="${rc.rc_star}"/>
         
          	    <c:if test="${rc.rc_star==1 }">
          	    	<img src="images/star_1.PNG" >
          	    </c:if>
          	    <c:if test="${rc.rc_star==2 }">
          	    	<img src="images/star_2.PNG" >
          	    </c:if>
          	    <c:if test="${rc.rc_star==3 }">
          	    	<img src="images/star_3.PNG" >
          	    </c:if>
          	    <c:if test="${rc.rc_star==4 }">
          	    	<img src="images/star_4.PNG" >
          	    </c:if>
          	    <c:if test="${rc.rc_star==5 }">
          	    	<img src="images/star_5.PNG" >
          	    </c:if>          	
          	    </div>    
          	    <p>${rc.rc_content}</p>
            </div>
          </div>
		  </c:forEach>
			</div>
          </div>

        </div>
      </div>

    <!-- Paging -->
	<div class="container">
		<nav aria-label="Page navigation example">
				${pageCode1 }	             
		</nav>
	</div>		
     
    
	<!-- Footer -->
	<jsp:include page="footer.jsp"/>
	
	
	<!-- 게시물 삭제시 전송할 Form -->
	<form action="delReg" method="post">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<input type="hidden" name="r_idx" value="${rvo.r_idx }">
		<input type="hidden" id="r_pwd" name="r_pwd" value="">
	</form>
	<hr>
   
	<!-- Join -->
	<form action="join" method="post" id="joinEvent">
    	<input type="hidden" name="r_idx" value="${rvo.r_idx }">
    	<input type="hidden" name="r_edate" value="${fn:substring(rvo.r_eDate,0,10) }">
    	<input type="hidden" name="r_writer" value="${rvo.r_writer }">
    	<input type="hidden" name="u_email" value="${lvo.u_email }">
    	<input type="hidden" name="u_name" value="${lvo.u_name }">
    	<input type="hidden" name="u_id" value="${lvo.u_id }">
    	<input type="hidden" name="nowPage" value="${rvo.nowPage }">
    	<input type="hidden" name="u_idx" value="${lvo.u_idx }">
	</form>

  <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
  <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b993f511047d6f3483b350293c73ff3&libraries=services"></script>
  <script type="text/javascript">
	 $(function(){
		  $("#regBtn").click(function(){
			  var chk = confirm("참여하시겠습니까?");
			  
			  if(chk){
				  var params = jQuery("#joinEvent").serialize();
				  
				  $.ajax({
					  url : "join",
					  data: params,
					  type: "POST",
					  dataType: "JSON"
				  }).done(function(data){
					  if(data.isJoin == 'Success'){
						  alert("참여 완료!");
						  location.reload();
					  }
					  else if(data.isJoin == 'Already'){
						  alertify.error("이미 참여하셨습니다");
						  return;
					  }
					  else{
						  alertify.error("인원 초과!");
						  return;
					  }
				  }).fail(function(err){
						console.log(err);  
				  })
			  }
		  });
	 });

	 
	function download(fname){	
		location.href="FileDownload?dir=upload&filename="+encodeURIComponent(fname);
		//위의 FileDownload는 서블릿이다.
	}

	
	function openWin(){ 
        juso = encodeURIComponent("${rvo.r_add}");
        window.open("map?juso="+juso,'window_name','width=750,height=500,location=no,status=no,scrollbars=yes');            
     }
  
	
 	function sendData(frm){
 		var comm = frm.rc_content.value;
 	
 		if(comm.trim().length > 0)
 			frm.submit();
 		else{
 			alertify.alert("내용을 입력하세요");
 			return;
 		}
  	}
 	
  	
	function sendStar(frm){
		
		frm.submit();
  	}
	
	
	function avgStar(frm){
		frm.submit();
  	}
	

    var locked = 0;
    function show(star){
   	  if(locked)
   		  return;
   	  var i;
   	  var image;
   	  var el;
      	  var e = document.getElementById('startext');
      	  var stateMsg;
			 for (i= 1; i<= star; i++){
		   	  image = 'image' + i;
		   	  el = document.getElementById(image);
		   	  el.src = "images/star1.png";
		     }
			 switch(star){
		     case 1:
		   	  stateMsg = "괜히.. 했..어요..";
		   	  break;
		     case 2:
		   	  stateMsg = "기대하진 말아요..";
		   	  break;
		     case 3:
		   	  stateMsg = "무난했어요~~^.^";
		   	  break;
		     case 4:
		   	  stateMsg = "기대해도 좋아요!";
		   	  break;
		     case 5:
		   	  stateMsg = "얼른 참여하세요!";
		   	  break;
		     default:
		     	  stateMsg = "";
		     }
    	 e.innerHTML = stateMsg;        
     }
          
     function noshow(star){
	   	if(locked)
	   		return;
	   	var i;
	   	var	image;
	   	var el;
   	
		   	for(i = 1; i<=star; i++){
		   		image = 'image' + i;
		   		el = document.getElementById(image);
		   		el.src = "images/star0.png";
		   	}
     }
     
     function lock(star){
   	  show(star);
   	  locked = 1;
     }
     
     function mark(star){
   	  lock(star);
   	  alertify.alert(star+"점을 선택하셨습니다.");
   	  document.cmtform.rc_star.value = star;
     }
     
     
     function loadMap(){
   	  	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  		mapOption = {
  			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  			level : 3
  		// 지도의 확대 레벨, 숫자가 작을수록 더 가까이 보인다.
  		};

  		// 지도를 생성합니다    
  		var map = new daum.maps.Map(mapContainer, mapOption);

  		// 주소-좌표 변환 객체를 생성합니다
  		var geocoder = new daum.maps.services.Geocoder();

  		// 주소로 좌표를 검색합니다
  		geocoder.addressSearch("${vo.r_add}", 
			function(result, status) {

				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {
			
					var coords = new daum.maps.LatLng(result[0].y,
							result[0].x);
			
					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords
					});
			
					// 인포윈도우로 장소에 대한 설명을 표시합니다
					var infowindow = new daum.maps.InfoWindow(
							{
								content : '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
							});
					infowindow.open(map, marker);
			
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
     }
     
     
    $(function() {
         // for map  
          
          $(window).load(function(){
             loadMap();
          });
 
    });
    
     
   	function delReg() {
   		var ori_writer = "${rvo.r_writer}";
   		var user_name = "${sessionScope.lvo.u_name}";
   		
   		if(ori_writer == user_name){
   			var pwd = prompt("비밀번호를 입력해 주세요");
   			
   			if(pwd == ${rvo.r_pwd}){
   				document.getElementById("r_pwd").value = pwd;
   				location.href = 'delReg?r_idx='+${rvo.r_idx}+'&r_pwd='+pwd;
   			}else if(pwd == null) {
				return;
			}else {
				alertify.error("비밀번호가 틀렸습니다");
   			}	
   		}else
   			alertify.error("작성자만 삭제가 가능합니다");
   	}
   	
   	
   	function editReg(){
   		var ori_writer = "${rvo.r_writer}";
   		var user_name = "${sessionScope.lvo.u_name}";
   		
   		if(ori_writer == user_name)
   			javascript:location.href='regEdit?r_idx='+${rvo.r_idx}+'&nowPage='+${rvo.nowPage };
  		else
  			alertify.error("작성자만 수정이 가능합니다");	
   	}
   	
   	
   	function rereply(t) {
		if(!login_id) {
			alertify.alert("로그인을 해주세요");
			return;
		}
		var replyTr = $(t).closest('tr');
		var replyForm = $(t).closest('form');
		
		// 대댓글창이 열려있으면
		if(!replyOpen) {
			// 기존댓글창 및 값 정리
			$("#reply_input").remove();
			breply_to = $(replyForm).children("input[name=m_id]");
			breply_group = $(replyForm).find("input[name=breply_group]");
			replyOpen=true;
			$(replyTr).after("<tr id='reply_input'><td colspan=2><form><input type='text'
			name='breply_content' id='breply_content2'><input onclick='sendRr(this.form)' type='button' value='보내기'></form></td></tr>");
		}else {
			replyOpen = false;
			$("#reply_input").remove();
			breply_to="";
			breply_group="";
		}
	}
    
   	</script>
</body>
</html>
