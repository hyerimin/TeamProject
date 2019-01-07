<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" href="css/mybody.css">
    <link rel="stylesheet" href="css/signUp.css">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="css/board_custom.css"  rel="stylesheet">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
 
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
        <a href="javascript:location.href='myEvent?u_id=${lvo.u_name}'">참여 현황</a>
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
        <!-- //navigation-->

        <div id="category">
            <ul class="ico_wrap"></ul>
        </div>

            
        <!-- 콘텐츠 영역 -->
        <div id="contents_wrap" class="boxShadow" style="margin-left: 30px; ">
            <h3 class="con_title" style="margin-left: 500px;">회원탈퇴
            <span class="con_sub"></span> <span class="navi"></span>
            </h3>
            <form name="delform" method="post" >
            <%-- 혹시나 비교값으로 u_id를 또 불러와야하나?.. 굳이 필요없는듯한데 --%>
			<input type="hidden"  id="u_id" name="u_id" value="${sessionScope.lvo.u_id}"/>
            
            <table width="100%" border="0" cellspacing="10" cellpadding="0" class="boardInsert">
              
              <tr>
                <th>비밀번호</th>
                <td><input type="password" id="u_pwd" name="u_pwd" class="input" style="width:250px; margin-top: 0px; margin-left: 30px;" /></td>
              </tr>
              <tr>
                <th>탈퇴사유</th>
                <td>
                  <textarea name="content" rows="10" style="width:560px; height: 300px; margin-top: 20px;" wrap="on"></textarea>
                  <p class="align_r" style="font-size:12px;color:#888; margin-top:10px; margin-left: 95px;">(회원탈퇴를 하시는 경우 데이터가 모두 삭제되며 이는 추후 복구되지 않습니다.)</p>
                </td>
              </tr>
            </table>
            <p class="align_r mgt_10" style="text-align: center;">
            <input type="button" value="회원탈퇴"  onclick="delFbbs()"  class="btn_point_color" 
            style="margin-top: 30px; margin-bottom: 100px; margin-left: 570px;"/></p>
            </form>
          </div>

                  

        <div class="section section-small section-get-started">
            <div class="parallax filter">
                <div class="image" style="background-image: url('images/wizard-book.jpg')"></div>
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
    </div>
	<input type="hidden"  value="${message}"  id="chkmsg">
     <!-- Bootstrap core JavaScript -->
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.bundle.min.js"></script>

     <script>
     $(function(){
    	 var msg = $("#chkmsg").val();
    	if( msg.length >1) 
    		alert(msg);
     });
     
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
      // 비밀번호 미입력시 경고창
 /*     function checkValue(){
          if(!document.delform.password.value){
              alert("비밀번호를 입력하지 않았습니다.");
              return false;
          }
     }
   */		
	function delFbbs() {
	   		
		   var pwd =$("#u_pwd").val();
		   var id =$("#u_id").val();
		   
		   console.log(pwd);
		   console.log(id);
		   
		   
		   if(pwd.length <1){
			   alert("비밀번호를 정확하게 입력해주세요!");
			   return;
		   }

    	  if(confirm("삭제하시겠습니까?")){
    		  document.delform.action = "deluser";
    		  
    		  document.delform.submit();
    	  	  }
		}
     </script>
</body>
</html>