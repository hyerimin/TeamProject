<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <a href="javascript:location.href='myEvent?u_id=${lvo.u_id}'">참여 현황</a>
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
                    </li>
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
	     <form action="myedit" method="post">
		<%-- 다음은 수정한 후 view.inc로 돌아갈 때 필요한 값 --%>
		<input type="hidden" name="u_id" value="${vo.u_id }"/>

		<div id="body_contents">
			<div id="mini_c">
			<h2>회원 정보수정</h2>
			<br/>
                <span class="mini_comment">기본회원정보를 입력해주세요</span>
                <table>
                   <tbody>
                        <colgroup>
                            <col width="150px">
                            <col width="650px">
                        </colgroup>
                        <tr>
                            <td class="left_col">
                                <label for="u_name">이름:</label>                           
                            </td>
                            <td height="30">
                                <input type="text" name="u_name" id="name"
                            	value="${vo.u_name }" disabled="disabled"/>
                            	
                            </td>
                        </tr>
                       <tr>
                           <td class="left_col">
                                <label for="u_pwd">비밀번호</label>
                           </td>
                           <td height="50">
                               <span class="mini_comment">새 비밀번호를 입력해주세요.</span><br/> 
                               <input type="password" name="u_pwd" id="pw"/>
                               
                              
                        <tr>
                            <td class="left_col">
                               <label for="c_pw">비밀번호 확인</label>
                            </td>
                            <td height="50">
                                <span class="mini_comment">입력하신 비밀번호 확인을 위해 다시 한번 입력해주세요.</span><br/> 
                                <input type="password" name="c_pw" id="c_pw"/>
                            </td>
                       </tr>
                       <tr>
                            <td class="left_col">
                                    <label for="u_email">이메일</label>
                            </td>
                            <td height="50">
                                <input type="text" name="u_email" id="email" style="width: 150px; margin-right: 10px;"/>
                              <!--  $("#u_email_last" option:selected").val(); -->
                                
                                <input type="checkbox" name="agree">  정보 수신 동의<br/>
                                <span class="mini_comment">* 이메일은 활동에 필요한 정보를 받기 위해 필요하며 수신 동의와 함께 정확한 정보를 입력해주세요.</span>
                            </td>
                        </tr>
                      <tr>
                            <td class="left_col">
                                <label for="u_bday">생년월일</label>                           
                            </td>
                            <td height="30">
                                <input type="text" name="u_bday" id="u_bday"/><br/>
                            	<span class="mini_comment">* 생년월일은 연월일 8자만 입력해주세요. (예시 :19881203)</span>
                            </td>
                        </tr>
                       <tr>
                            <td class="left_col">
                                <label for="u_phone">휴대전화번호</label>
                            </td>
                            <td>
                                 <input type="text" id="phone" name="u_phone" style="margin-right: 10px;"/>
                                 <input type="checkbox" name="agree">  정보 수신 동의<br/>
                                 <span class="mini_comment">* 수신 동의 선택시 각종 이벤트 내용을 문자로 발송드립니다.</span>
                            </td>
                        </tr>
                   </tbody>
                </table>
                </div>
                <div class="l_btn" id="l_btn">
                    <button class="okay_btn" type="button" onclick="check(this.form)">수정완료</button>
                	<button class="okay_btn" type="button" onclick="location.href='myInfo?u_id=${vo.u_id}'">취소</button>
                </div>
	        </div>     
	  	  </form>
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
	 	function check(ff){
	 		var name = $("#name").val();
			var id = $("#id").val();
			var pw = $("#pw").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var c_pw = $("#c_pw").val();
			// 
			if ( email.trim().length < 1 ){
				alert("이메일을 입력해 주세요");
				$("#email").focus();
				return;
			}		
			if(name.trim().length < 1){
				alert("이름을 입력해 주세요");
				$("#name").focus();
				return;
			}
			if(pw.trim().length < 1){
				alert("비밀번호를 입력해 주세요");
				$("#pw").focus();
				return;
			}
			if ( c_pw.trim().length < 1 ){
				alert("비밀번호확인을 해주세요");
				$("#c_pw").focus();
				return;
			}			
			if ( pw == c_pw ) {		
					
						$.ajax({
							type : 'POST',
							data : "u_email="+encodeURIComponent(email),
							url : "check_email2",
							dataType : "json"
						}).done(function(data){
							if ( data.count == 1 ){
								alert("이미 사용중인 이메일입니다.");				
				                $("#email").focus();			
				                return;
							}else{																
								alert("회원정보가 수정되었습니다.");	
								ff.submit();	
							}						
						}).fail(function(err){
							alert("err :" + err);
						});								
														
			}else{
				alert("비밀번호가 일치하지 않습니다.")
				return;
			}
			return;
		}
	 	
	 	
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
     </script>
</body>
</html>