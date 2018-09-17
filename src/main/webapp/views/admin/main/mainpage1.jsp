<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script  src="/triangleView/js/sample.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
html, body {
	font-family: 'Open Sans', sans-serif; /*글씨체 묶어서 저장함*/
	height: 100%; /*최상위 태그에 높이 값을지정*/
}

body {
	background: #FFFFFF;
	height: 100%;
	margin: 0 0 0 0px;
}

img {
	max-width: 80%; /*이미지 크기를 영역내의 80%로 정의함*/
}

ul {
	list-style: none; /*항목모양을 정의함*/
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none; /*글자에 줄을 넣음 none이기때문에 줄그어짐 없앰*/
}

#header {
	float: left;
	width: 100%;
	background: #d2452d;
	position: relative; /*기준이 되는 위치가 자기 자신으로 바뀜*/
}

.mainlogo {
	/* 위쪽 메뉴바위에 배경*/
	float: left;
	background: #a7e387;
	max-width: 210px;
	padding: 10px;
	min-height: 44px;
	background: #e5361f;
	width: 100%;
	max-height: 44px;
}

.mainlogo img {
	max-height: 80px;
	position: relative;
	bottom: 10px;
	left: 20px;
}

.login-back {
	/* 위쪽 로그인창 옆의 배경*/
	min-height: 64px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box; /*박스사이징 설정하면 더이상 박스의 크기를 늘리지 않는다.*/
	background: #e5361f;
}

.login-back img {
	width: 39px;
	height: 41px;
	border-radius: 50%;
	float: right;
	position: relative;
	top: 13px;
	right: 50px;
}

/*사이드바 옆에 들어갈 항목*/
#sidebar {
	overflow: hidden; /*섹션부분이 값이 html의 범위를 넘어 가면 숨김기능*/
	font: 12px/20px 돋움;
	color: #424242;
	width: 210px;
	height: 100%;
	float: left;
	background: #2A2D33;
}

#list {
	width: 106%;
	height: calc(100% - 95px); /*사칙연산으로 높이 설정기능*/
	padding: 0;
	background: #2A2D33;
	border-right: 1px solid #E0E0E0;
	/*사용자가 해당부분을 확인 할수있도록 스크롤로 표시*/
}

#list h2 {
	color: #c2c2c2;
	font-size: 2.0em;
	float: left;
	width: 100%;
	font-family: 'Open Sans', sans-serif; /*원하는 글꼴을 쉽표로 구분하여 표시할수있다.*/
	font-weight: 600;
	text-transform: uppercase; /*모든문자를 대문자로 변환시킴*/
	padding: 3px 2px 20px;
	border-top: 0 solid #4D4C4C;
	background: #2A2D33;
	margin: 10px 0;
	text-align: center;
}
#list ul #member h2{

margin-top:0px;
}


 #list ul li a {
	color: #C2C2C2;
	font-size: .95em;
	 padding: 15px 20px;
	float: left;
	width: 100%;
	font-weight: 600;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	text-align: center;
} 
#list ul p a{
	padding:0 0 0 0px;

}

#list ul li h2:hover a {
	color: #333;
	background: #fff;
}

#list ul li :hover a {
	color: #333;
}

#list p {
	padding: 0 10px;
	margin: 0;
	height: 0;
	font-size: 1.5em;
	color:#f5f5f5;
	text-align: center;
	overflow : hidden;
	-moz-transition: height 0.5s ease-in;
	-webkit-transition: height 0.5s ease-in;
	-o-transition: hegith 0.5s ease-in;
	transition: height 0.5s ease-in;
	overflow: hidden;
}

#list :target p {
	overflow: auto;
	height: 20px;
}

#content {
	float: left;
	width: calc(100% - 210px);
	height: 100%;
	word-wrap: break-word; /*div영역내에서 텍스트가 넘칠경우 알아서 텍스트 정렬변환*/
	background: #3c59cd;
	font-family: Raleway, sans-serif;
}


/*여기서부터 그래프 차트 영역*/

::-webkit-scrollbar {
	width: 12px;
}

::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.5);
}

.content {
	/*메인페이지 배경*/
	float: left;
	background: #E9EEF4;
	width: 100%;
	height: calc(100% - 64px);
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.content-header {
	/*메인페이지 위쪽 회색 헤더*/
	background: #808080;
	float: left;
	width: 100%;
	margin-bottom: 15px;
	padding: 15px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	border-bottom: 1px solid #ccc;
}

.content-header h1 {
	margin: 0;
	font-weight: normal;
	padding-bottom: 5px;
}

.content-header p {
	margin: 0;
	padding-left: 2px;
}

.widget-box {
	background: #fff;
	border: 1px solid #E0E0E0;
	float: left;
	width: 100%;
	margin: 0 0 15px 15px;
}

.widget-header {
	background: #a7e387;
}

.widget-header h2 {
	font-size: 15px;
	font-weight: normal;
	margin: 0;
	padding: 11px 15px;
	color: #F9F9F9;
	display: inline-block;
}

.sample-widget {
	max-width: 47%;
}

.widget-box .fa-cog {
	float: right;
	color: #fff;
	margin: 11px 11px 0 0;
	font-size: 20px;
}
</style>
</head>
<body>
	<section id="sidebar">
		<div class="mainlogo">
		<a href="/triangleView/views/main/admin/main/mainpage2.jsp"><img
				src="/triangleView/img/admin/blue.png"></a>
		</div>
		<div id="list">
			<ul>

				<li id="member"><h2>
						<a href="#member"> 회원관리</a>
					</h2>
					<p><a href="#" onclick="javascript:memberList(); return false;">회원관리목록</a></p>
					<p><a href="#" onclick="javascript:memberOut(); return false;">회원탈퇴현황</a></p></li>
				<li id="company"><h2>
						<a href="#company">기업회원관리</a>
					</h2>
					<p><a href="#" onclick="javascript:companyList(); return false;">기업회원목록</a></p>
					<p><a href="#" onclick="javascript:companyOut(); return false;">기업탈퇴목록</a></p></li>

				<li id="reviews"><h2>
						<a href="#reviews"> 게시물관리</a>
					</h2>
					<p><a href="#" onclick="javascript:reviewsOut(); return false;">게시물삭제</a></p>
					<p><a href="#" onclick="javascript:reviewsList(); return false;">게시물삭제목록</a></p></li>
				<li id="payment"><h2>
						<a href="#payment"> 결제관리</a>
					</h2>
					<p><a href="#" onclick="javascript:sell(); return false;">구매내역</a></p>
					<p><a href="#" onclick="javascript:margin(); return false;">수익내역</a></p>
				<li>
				<li id="point"><h2>
						<a href="#point"> 포인트관리</a>
					</h2>
					<p><a href="#" onclick="javascript:exchange(); return false;">환급내역</a></p>
					<p><a href="#" onclick="javascript:pay(); return false;">지급내역</a></p></li>
				<li id="monitor"><h2>
						<a href="#monitor">리뷰모니터링</a>
					</h2></li>

			</ul>
		</div>
	</section>

	<section id="content">

		<div class="login-back">


			<img src="/triangleView/img/admin/login.png">



		</div>



		<div class="content">
			<div class="content-header"></div>
			<div class="widget-box sample-widget">
				<div class="widget-header">
					<h2>일간 방문자수</h2>
					<i class="fa fa-cog"></i>
				</div>
				<div class="widget-content">
					<img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/87118/sample-data-1.png">
				</div>
			</div>
			<div class="widget-box sample-widget">
				<div class="widget-header">
					<h2>일간 게시물 등록수</h2>
					<i class="fa fa-cog"></i>
				</div>
				<div class="widget-content">
					<img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/87118/sample-data-1.png">
				</div>
			</div>
			<div class="widget-box sample-widget">
				<div class="widget-header">
					<h2>일간 제휴및공고수</h2>
					<i class="fa fa-cog"></i>
				</div>
				<div class="widget-content">
					<img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/87118/sample-data-1.png">
				</div>
			</div>
			<div class="widget-box sample-widget">
				<div class="widget-header">
					<h2>일간 조회수</h2>
					<i class="fa fa-cog"></i>
				</div>
				<div class="widget-content">
					<img
						src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/87118/sample-data-1.png">
				</div>
			</div>
		</div>
	</section>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>