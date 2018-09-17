<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="/triangleView/js/sample.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
	
	

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
  background: #fff; 
	color: #333;
}

#list ul li :hover a {
	 
	color: #333;
} 


#list p {
	padding: 0 10px;
	margin: 0;
	height: 0;
	font-size: 1.5em;
	color: #f5f5f5;
	text-align: center;
	overflow: hidden;
	-moz-transition: height 0.5s ease-in;
	-webkit-transition: height 0.5s ease-in;
	-o-transition: hegith 0.5s ease-in;
	transition: height 0.5s ease-in;
	overflow: hidden; /* 부모요소를 넘어가는 자식부분을 숨김 */
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
.search {
	height: 40px;
	width: 400px;
	border: 1px solid #d2452d;;
	background: #ffffff;
	display: inline-block;
	border-radius: 4px;
	margin-left: 400px;
	margin-top:30px;
}

.search-bar {
	font-size: 16px;
	width: 325px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

.search-btn {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #d2452d;;
	outline: none;
	float: right;
	color: #ffffff;
}

#top {
	margin-left: 300px;
	margin-right: 200px;
	display: inline-block;
}

.select-script {
	position: relative;
	width: 200px;
	height: 40px;
	line-height: 40px;
	border: 1px solid #606976;
	border-radius: 4px;
	text-transform: uppercase;
	background: #fff;
}

.select-script label {
	position: absolute;
	width: 90%;
	font-size: .86em;
	color: #606976;
	top: 0;
	left: 0;
	padding: 0 5%;
}

.select-script label:after {
	content: '▼';
	width: 40px;
	height: 40px;
	position: absolute;
	top: 100;
	right: 0;
	font-size: .76em;
	color: #fff;
	text-align: center;
	background: #606976;
}

.select-script select {
	width: 100%;
	height: 40px;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: alpha(opacity = 0) /* IE 8 */;
}
/*테이블생성*/
.mTable {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	margin: 20px 10px;
}

.mTable th {
	width: 155px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
	background: #ce4869;
}

.mTable td {
	width: 155px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #eee;
}

.date{
	
	margin-left:280px;
	margin-top:100px;


}
.date>fromDt{

	width:100px;
	






}
 .date>toDt{
 
 	width:100px;
 	
 
 
 
 
 }
 
 	
 
 
 
 




</style>
<script type="text/javascript">
			$(document).ready(function(){

				var select = $('.select-script select');
				select.change(function(){
					var select_name = $(this).children('option:selected').text();
					$(this).siblings("label").text(select_name);
				});

			});
		</script>


<script language="javascript" type="text/javascript">
$(document).ready(function() {

//******************************************************************************
// 상세검색 달력 스크립트
//******************************************************************************
var clareCalendar = {
monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
dayNamesMin: ['일','월','화','수','목','금','토'],
weekHeader: 'Wk',
dateFormat: 'yymmdd', //형식(20120303)
autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
changeMonth: true, //월변경가능
changeYear: true, //년변경가능
showMonthAfterYear: true, //년 뒤에 월 표시
//buttonImageOnly: true, //이미지표시
buttonText: '달력선택', //버튼 텍스트 표시
//buttonImage: 'res/img/comn/calendar.gif', //이미지주소
showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
yearRange: '1990:2020' //1990년부터 2020년까지
};
$("#fromDt").datepicker(clareCalendar);
$("#toDt").datepicker(clareCalendar);
$("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
});

</script>



 




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
					<p>기업회원목록</p>
					<p>기업탈퇴목록</p></li>
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
			<h1 align="center">*수익내역*</h1>
			<div class="date">
			<input name="fromDt" type="text" id="fromDt" size="8" maxlength="8" title="시작일자" style="width:150px"> ~ 
			<input name="toDt" type="text" id="toDt" size="8" maxlength="8" title="종료일자" style="width:150px">
			</div>
			<div style="position:absolute; top:40.5%; left:24%; margin-left:100px;" >
			
			<div class="select-box select-script">
				<label for="selectbox">검색목록</label> <select id="select-box"
					title="선택 구분">
					<option selected="selected">검색목록</option>
					<option>결제코드</option>
					<option>기업명</option>
					<option>결제종류</option>
					<option>상품코드</option>
					<option>상품명</option>
					<option>상품명</option>
					<option>상품명</option>
					
					

					</select>
					</div>
			</div>
			
				
				
					<div class="search">
						<input type="text" placeholder="검색어 입력" class="search-bar">
						<button class="search-btn">검색</button>
					</div>
					



			<table class="mTable">
				<thead>
					<tr>
						<th>아이디</th>
						<th>기업명</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>결제액</th>
						<th>누적액</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>#$@we2220</td>
						<td>오뚜기</td>
						<td>#445050</td>
						<td>오뚜기밥</td>
						<td>9900원</td>
						<td>카드</td>
						


					</tr>

				</tbody>

			</table>

		</div>
	</section>
</body>
</html>