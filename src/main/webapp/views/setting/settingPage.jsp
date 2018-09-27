<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<script
	src="https://code.jquery.com/color/jquery.color-2.1.2.js"
	integrity="sha256-1Cn7TdfHiMcEbTuku97ZRSGt2b3SvZftEIn68UMgHC8="
	crossorigin="anonymous">
</script>

<style>
body {
	margin: 0px;
	/* background: #fafafa; */
	font-family: '맑은고딕';
}

.outLine {
	width: 1000px;
	margin: 0 auto;
	text-align: -webkit-center;
	display: block;
}

tr {
	height: 150px;
}

table {
	text-align: center;
}

.container {
	width: 800px;
	height: 450px;
	border: 1px solid black;
	text-align: center;
	display: inline-block;
}

.menu {
	display: inline-block;
	border: 1px solid white;
	width: 120px;
	height: 450px;
	border: 1px solid black;
}

.show {
	display: inline-block;
	border: 1px solid white;
	width: 670px;
	height: 450px;
}


.subMenu1, .subMenu2, .subMenu3,.subMenu4, .subMenu5 {
	width:118px;
	height:50px;
	border: 1px solid gray;
	background-color: white;
	display:table;
	border-left: 2px solid transparent;
    font-size: 16px;
	line-height: 20px;
	vertical-align:middle;
   /*  display: block; */
   /*  height: 100%; */
   /* padding: 16px 16px 16px 30px; */
   /*  width: calc(100% - 48px); */
	
}

div.subMenu1:hover, div.subMenu2:hover, div.subMenu3:hover, div.subMenu4:hover, div.subMenu5:hover{
	background-color:#f7edea;
	cursor:pointer;
}

/* .inside1{
border-left: 2px solid transparent;
    display: block;
    font-size: 16px;
   height: 100%; 
    line-height: 20px;
    padding: 16px 16px 16px 30px;
    width: calc(100% - 48px); 
} */

</style>



</head>
<body>
<jsp:include page="../main/header/headerNav.jsp" flush="true" />
<br>
<br>
<br>
<br>
	<div name="outLine" class="outLine">
		<div id="container" class="container">
			<div class="menu">
				<div class="subMenu1" onclick="changeProfile()">
					프로필수정
				</div>
				<div class="subMenu2">
					비밀번호수정
				</div>
				<div class="subMenu3">
					포인트	
				</div>
				<div class="subMenu4">
					파워리뷰어
				</div>
				<div class="subMenu5">
					회원탈퇴
				</div>
			</div>
			
			<div class="show">
			
			</div>
		</div>
	</div>

<script>

function changeProfile(){
	
	$.ajax({
		url : "/triangleView/views/setting/profileChange.jsp",
		data : "html",
		success : function(data) {
			$(".show").html(data);
			
		}
	});
}

</script>
</body>
</html>