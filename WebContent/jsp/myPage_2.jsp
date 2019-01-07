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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<!-- Custom styles for this template -->

<link href="css/board_custom.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

<link href="css/Hayley.css" rel="stylesheet">
<link href="css/gaia.css" rel="stylesheet">
<link href="css/botom-board.css" rel="stylesheet">
<link href="css/mybody.css" rel="stylesheet">


<style>
#main {
	margin: 0 auto;
}

.mt30 {
	margin-top: 60px;
}

.buttons {
	width: 65%;
	height: 60px;
	margin-left: 260px;
	margin-top: 4%;
	margin-bottom: 3%;
}

.buttons>button {
	width: 31%;
	height: 100%;
}

.tables {
	width: 65%;
	margin-left: 240px;
}

.paging {
	list-style: none;
	margin-top: 40px;
	margin-left: 28%;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}

div#searchbar{
	padding-top: 20px;
	margin-top: 20px;
	margin-bottom: 50px;
	margin-left: 500px;
}
.input-box {
	display: inline;
	height: 40px;
	width: 400px;
	margin-left: 38%;
	margin-bottom: 30px;
}

.input-box>input {
	width: 15%;
}
</style>

</head>
<body>
    <div id="mySidenav" class="sidenav" style="width: 250px;">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" style="display: none;">&times;</a>
        <a href="javascript:location.href='myInfo?u_id=${lvo.u_id}'">내 정보</a>
        <a href="javascript:location.href='myEvent?r_writer=${lvo.u_name}'">참여 현황</a>
        <a href="javascript:location.href='myBoard?boardType=free&f_writer=${lvo.u_name }'">내가 쓴 글</a>
        <a href="javascript:location.href='signout?u_id=${lvo.u_id}'">회원탈퇴</a>
    </div><!--  		<a href="javascript:location.href='myflist?f_writer='${vo.u_name }'">내가 쓴 글</a>  -->
<!--       <a href="javascript:location.href='myflist?boardType=free'">내가 쓴 글</a>-->


	<div id="main" style="margin-left: 250px;">
		<nav class="navbar navbar-expand-lg navbar-light bg-light h70">
			<div class="container">
				<a class="navbar-brand" href="index">INCREPAS</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse cw" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index">
								Home </a></li>
						<li class="nav-item"><a class="nav-link" href="register">
								나눔등록 </a></li>
						<li class="nav-item"><a class="nav-link" href="showList">
								나눔보기 </a></li>
						<li class="nav-item"><a class="nav-link"
							href="free_board"> 게시판 </a></li>
						<li class="nav-item">
							<!-- Use any element to open the sidenav --> <a class="nav-link"
							onclick="openNav()" style="cursor: pointer;">마이페이지<i
								class="fas fa-info-circle"></i></a>
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

		<div class="table_layout">
			<div class="buttons">
                    <button type="button" 
                    onclick="location.href='myEvent?r_writer=${vo.u_name }'" class="btn btn-secondary">내가 나눔한 재능</button>
                    <button type="button" 
                    onclick="location.href='myinEvent?u_name=${vo.u_name }'" class="btn btn-secondary">내가 참여한 재능</button>
                    <button type="button" 
                    onclick="location.href='myhistoryEvent?r_writer=${vo.u_name }'" class="btn btn-secondary">지난 참여목록</button>
			</div>
		</div>
		<!-- //navigation-->

		<div class="tables">
			<table class="table table-sm">
				<colgroup>
					<col width="10%";>
					<col width="";>
					<col width="10%";>
					<col width="10%";>
					<col width="10%";>
				</colgroup>
				<thead>
					<tr class="table-group alert-dark">
						<th class="IDX" scope="col">번호</th>
						<th class="TITLE" scope="col">제목</th>
						<th class="WRITER" scope="col">글쓴이</th>
						<th class="WRITEDATE" scope="col">등록일</th>
						<th class="HIT" scope="col">조회수</th>
					</tr>
				</thead>

				<tbody>

						<c:forEach items="${list }" var="vo" varStatus="idx">
							<tr>
							<c:if test="${vo.r_writer  == lvo.u_name }">
								<td data-title="IDX">${rowTotal-((nowPage-1)*blockList+idx.index) }</td>
								<td data-title="TITLE"><a
									href="rdetail?r_idx=${vo.r_idx}&nowPage=${nowPage}">${vo.r_title }</a></td>
								<td data-title="WRITER">${vo.r_writer }</td>
								<td data-title="WRITEDATE">${fn:substring(vo.r_writeDate, 0, 10) }</td>
								<td data-title="HIT">0</td>	
							</c:if>
							</tr>
						</c:forEach>
					<tr>
						<td colspan="5">${pageCode }</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 
		<div class="searchbar" id="searchbar">
			<select name="search_key" style="height: 29.5px;">
				<option value="f_title">제목</option>
				<option value="f_writer">글쓴이</option>
			</select> <input type="text" name="searchValue" id="searchValue"
				placeholder="검색어 입력">
			<button type="button" class="btn btn-outline-info" onclick="searching()">검색</button>
		</div>
		 -->
		<td colspan="4">
		<div class="input-box">
			<select name="opt" id="opt" style="height: 27px; margin-bottom: 70px;">
				<option value="r_title">제목</option>
				<option value="r_writer">글쓴이</option>
			</select> <input type="text" name="searchValue" id="searchValue"
				placeholder="검색어 입력">
			<button type="button" class="btn btn-outline-info"
				onclick="searching()">검색</button>
		</div>
		</td>
 
		<!-- 콘텐츠 영역 -->

		<!-- 콘텐츠 영역 끝 -->

		<div class="section section-small section-get-started">
			<div class="parallax filter">
				<div class="image"
					style="background-image: url('images/wizard-book.jpg')"></div>
				<div class="container">
					<div class="title-area">
						<h2 class="text-white">저희는 인크레파스 교육생입니다.</h2>
						<div class="separator line-separator">♦</div>
						<p class="description">인크레파스에 대해 더 알고싶으면 아래를 클릭해주세요!</p>
					</div>
					<div class="button-get-started">
						<a class="btn btn-xl" href="http://www.increpas.com/index.inc"
							style="background-color: azure;">인크레파스 가기!</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<footer class="py-5 bg-warning">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; HAYLEY
					2017</p>
				<!-- //right area END -->
				<div class="quick1">
					<a href="#"><img src="images/btn_top.png" /></a>
				</div>
			</div>
		</footer>
	</div>

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
		 
		 function searching(){
			 var searchType = document.getElementById("opt").value;
		     var searchValue = document.getElementById("searchValue").value.trim();
			
			if(searchValue != null && searchValue != "")
				location.href = "myEvent?searchType="+searchType+"&searchValue="+searchValue;
			else
				alert("검색어를 입력해 주세요");
		 }
	</script>
</body>
</html>