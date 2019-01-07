<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/mybody.css">
    <link rel="stylesheet" href="css/signUp.css">
    <link href="css/board_custom.css"  rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 
    <link href="css/Hayley.css" rel="stylesheet">
    <link href="css/gaia.css"  rel="stylesheet">

    <style>
        #main{margin: 0 auto; }
        .table_layout{height: 650px; }
        .mt30{margin-top: 60px; }
        .buttons{width: 104%; height: 100px; margin: 0 auto; margin-top: 8%; margin-bottom: 8%; }
        .buttons>button{width: 31%; height: 100%;  }
        .paging{width: 15%; margin: 0 auto; }
    </style>

</head>
<body>
    <div id="mySidenav" class="sidenav" style="width: 250px;">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="display: none;">&times;</a>
        <a href="javascript:location.href='myInfo?u_id=${lvo.u_id}'">내 정보</a>
        <a href="javascript:location.href='myEvent?r_writer=${lvo.u_name}'">참여 현황</a>
        <a href="javascript:location.href='myBoard?boardType=free&f_writer=${lvo.u_name }'">내가 쓴 글</a>
        <a href="javascript:location.href='signout?u_id=${lvo.u_id}'">회원탈퇴</a>
    </div>

    <div id="main" style="margin-left: 250px;">
        <nav class="navbar navbar-expand-lg navbar-light bg-light h70">
            <div class="container">
                <a class="navbar-brand" href="index">INCREPAS</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse cw" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                    <a class="nav-link" href="index">
                        	Home
                    </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="register">
                        	나눔등록
                    </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="showList">
                        	나눔보기
                    </a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="free_board">
                       		 게시판
                    </a>
                    <li class="nav-item">
                    <!-- Use any element to open the sidenav -->
                    <a class="nav-link" onclick="openNav()" style="cursor: pointer;">마이페이지<i class="fas fa-info-circle"></i></a>
                    </li>
                </ul>
                </div>
            </div>
        </nav>

        <div id="category">
            <ul class="ico_wrap"></ul>
        </div>
        <!-- //navigation-->

            	<!-- 콘텐츠 영역 -->

		<div id="body_contents">
			<div id="mini_c">
			<h2>회원 정보수정</h2><br/>
			<!-- <form action="${ac }" method="post" encType="multipart/form-data"> -->
			
                <span class="mini_comment">기본회원정보를 입력해주세요</span>
                <table>
                   <tbody>
                        <colgroup>
                            <col width="150px">
                            <col width="650px">
                        </colgroup>
                        <tr>
                            <td class="left_col">
                                <label for="u_name">이름</label>                           
                            </td>
                            <td height="30">
                                <input type="text" name="u_name" id="u_name"
                            	value="${vo.u_name }" disabled="disabled"/>
                            </td>
                        </tr>
                        <c:if test="${as != 'disabled'}">	
                       <tr>
                           <td class="left_col">
                                <label for="u_pwd">비밀번호</label>
                           </td>
                           <td height="50">
                               <input type="password" name="u_pwd" id="u_pwd" />
                               <!-- value="${vo.u_pwd }" disabled="disabled"/ -->
                               <br/>
                               <span class="mini_comment">* 회원정보 수정 페이지로 이동하기 위해 비밀번호를 입력해주세요.</span>
                           </td>
                       </tr>
                       </c:if>
                       <tr>
                            <td class="left_col">
                                    <label for="u_email">이메일</label>
                            </td>
                            <td height="50">
                                <input type="text" name="u_email" id="u_email" style="width: 150px; margin-right: 10px;"
                                 value="${vo.u_email }"  disabled="disabled"/>
                        <!--          <select name="u_bday" id="u_bday"> 실험용 .. 안됨. -->
                <!--                    <option value=1 <c:if test="${u_bday == 1 }" ></c:if>>gmail.com</option>
                                    <option value=2 <c:if test="${u_bday == 2 }" ></c:if>>naver.com</option>
                                    <option value=3 <c:if test="${u_bday == 3 }" ></c:if>>daum.net</option>
                                </select><br/>
                                 -->
                               <span class="mini_comment">
                               <br/>
                               * 이메일은 활동에 필요한 정보를 받기 위해 필요하며 수신 동의와 함께 정확한 정보를 입력해 주세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="left_col">
                                <label for="u_bday">생년월일</label>                           
                            </td>
                            <td height="30">
                                <input type="text" name="u_bday" id="u_bday"
                            	value="${vo.u_bday }" disabled="disabled"/>
                            </td>
                        </tr>
                       <tr>
                            <td class="left_col">
                                <label for="u_phone">휴대전화번호</label>
                            </td>
                            <td>
                                 <input type="text" name="u_phone" value="${vo.u_phone }"disabled="disabled"/>
                                 <br/>
                                 <span class="mini_comment">* 수신 동의 선택시 각종 이벤트 내용을 문자로 발송드립니다.</span>
                            </td>
                        </tr>
                   </tbody>
                </table>
                </div>
                <div class="l_btn" id="l_btn">
                    <button class="okay_btn" onclick="passnext()"
						  style="cursor:pointer">
                    <!-- <button class="okay_btn" onclick="javascript:location.href='myedit?u_id=${param.u_id}'"
						  style="cursor:pointer">-->
                    수정하기
                    </button>
                    <!-- onClick="javascript:location.href='myedit?u_id=${param.u_id}'"  -->
                    <!-- passOk() -->
                </div>
	        </div>
	        <input type="hidden" name="u_id" value="${vo.u_id}">
			
	    </div>
	
		<!-- 콘텐츠 영역 끝 -->

        <div class="section section-small section-get-started">
                <div class="parallax filter">
                    <div class="image"
                        style="background-image: url('images/wizard-book.jpg')">
                    </div>
                    <div class="container">
                        <div class="title-area">
                            <h2 class="text-white">저희는 인크레파스 교육생입니다.</h2>
                            <div class="separator line-separator">♦</div>
                            <p class="description">인크레파스에 대해 더 알고싶으면 아래를 클릭해주세요!</p>
                        </div>
                        <div class="button-get-started">
                              <a class="btn btn-xl" href="http://www.increpas.com/index.inc" style="background-color: azure;">인크레파스 가기!</a>
                        </div>             
                    </div>
                </div>
            </div>
           
            <!-- Footer -->
            <footer class="py-5 bg-warning">
                <div class="container">
                 <p class="m-0 text-center text-white">Copyright &copy; HAYLEY 2017</p>
                  <!-- //right area END -->
                <div class="quick1">
                  <a href="#"><img src="images/btn_top.png" /></a>
                </div>
               </div>
            </footer>
   

     <!-- Bootstrap core JavaScript -->
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.bundle.min.js"></script>

     <script>
         /* Set the width of the side navigation to 250px and the left margin of the page content to 250px and add a black background color to body */
     function openNav() {
          document.getElementById("mySidenav").style.width = "250px";
          document.getElementById("main").style.marginLeft = "250px";
          document.body.style.backgroundColor = "rgba(255,255,255,0.6)";
      }

      /* Set the width of the side navigation to 0 and the left margin of the page content to 0, and the background color of body to white */
      function closeNav() {
          document.getElementById("mySidenav").style.width = "0";
          document.getElementById("main").style.marginLeft = "0";
          document.body.style.backgroundColor = "white";
      }
/*      function sendData(){

	    	<c:if test="${as != 'disabled'}">
		    	if(document.forms[0].u_pwd.value == "" || document.forms[0].u_pwd.value.trim().length == 0){
		    		alert("비밀번호를 입력하세요");
		    		document.forms[0].pwd.focus();
		    		return;
		    	}
	    	</c:if>
			//document.forms[0].submit();
			//"javascript:location.href='myedit?u_id=${param.u_id}'"
			location.href = 'myedit?u_id='+'${param.u_id}';
	} 
*/      
/*		function passOk() {
			var u_pwd = "${vo.u_pwd}";
			
			if(u_pwd == ${vo.u_pwd}){

				location.href = 'myedit?u_id='+'${param.u_id}';
				
				}else {
					alert("비밀번호가 틀렸습니다");
				}
		}
 */     
 /*     
      function gogo(){*/
    	/*  "javascript:location.href='edit.inc?seq=${param.seq} 
    	  '+'&u_email='+'${vo.u_email }'*/
 /*   	  onClick="javascript:location.href='edit.inc?seq=${param.seq}&nowPage=${param.nowPage }'" */
 /*   	  location.href = 'myedit?u_id='+'${param.u_id}';
      }
 */
	function passnext() {
		
	   var pwd =$("#u_pwd").val();
	   var id =$("#u_id").val();
	   
	   console.log(pwd);
	   console.log(id);
	   
	   
	   if(pwd != ${vo.u_pwd}){
		   alert("비밀번호를 정확하게 입력해주세요!");
		   return;
	   }
	   location.href = 'myedit?u_id='+'${param.u_id}';
 	}
 /*javascript:location.href='myedit?u_id=${param.u_id}'"*/
 	
 
 
 
     </script>
</body>
</html>