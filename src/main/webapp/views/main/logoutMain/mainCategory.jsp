<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.category{
		padding-top:25px;
		margin:0 auto;
		width:900px;
		text-align:center;
		background:white;
		border:1px solid #dbdbdb;
	}
	.category ul {
		margin:0 auto;
		list-style-type:none;
		padding-left:0px;
	}
	.category ul li:first-child {
		padding-left:37px;
	}
	.category ul li {
		display:inline-block;
		padding-right:28px;
	}
	.category ul li img{
		cursor:pointer;
	}
	.category ul li p {
		font-family:"나눔고딕";
		font-size:13px;
		text-align:center;
		color:#7A7A7A;
		text-shadow:0px 1px #fff;
		cursor:pointer;
	}
	@media all and (max-width:768px) {
		.category{
			width:99%;
		}
		.category ul {
			margin:0 auto;
			list-style-type:none;
			text-align:center;
		}
		.category ul li{
			width:30%;
			padding-right:1%;
		}
		.category ul li img{
			width:35px;
			height:35px;
		}
		.category ul p {
			font-size:0.8em;
			margin-left:0;
		}
		.category ul li:first-child {
			padding-left:0px;
		}
	}
</style>
<script>
	$(function(){
		$("#searchReviewInput").keypress(function(key) {
			if(key.which == 13){
				var searchHash = $("#searchReviewInput").val();
				var searchData = $("#searchReviewInput").val();
				location.href="<%= request.getContextPath()%>/searchReview.sr?searchHash=" + searchHash +"&searchData=" + searchData;
			}
			
		});
	})
	
	function searchCategory(category){
		
		var searchHash = "";
		var searchData = "";
		
		switch(category){
		case 1 : searchHash = "자유"; searchData = searchHash; break;
		case 2 : searchHash = "게임"; searchData = searchHash; break;
		case 3 : searchHash = "취미"; searchData = searchHash; break;
		case 4 : searchHash = "IT"; searchData = searchHash; break;
		case 5 : searchHash = "인생"; searchData = searchHash; break;
		case 6 : searchHash = "금융"; searchData = searchHash; break;
		case 7 : searchHash = "스포츠"; searchData = searchHash; break;
		case 8 : searchHash = "뷰티"; searchData = searchHash; break;
		case 9 : searchHash = "뮤직"; searchData = searchHash; break;
		}
		location.href="<%= request.getContextPath()%>/searchReview.sr?searchHash=" + searchHash +"&searchData=" + searchData;
	}
</script>
</head>
<body>
	<div class="category">
		<ul>
			<li onclick="searchCategory(1)"><img src="/triangleView/img/main/freedom.png">
				<p>자유</p></li>
			<li onclick="searchCategory(2)"><img src="/triangleView/img/main/game.png">
				<p>게임</p></li>
			<li onclick="searchCategory(3)"><img src="/triangleView/img/main/hobby.png">
				<p>취미</p></li>
			<li onclick="searchCategory(4)"><img src="/triangleView/img/main/appliance.png">
				<p>IT/가전</p></li>
			<li onclick="searchCategory(5)"><img src="/triangleView/img/main/life.png">
				<p>인생</p></li>
			<li onclick="searchCategory(6)"><img src="/triangleView/img/main/banking.png">
				<p>금융</p></li>
			<li onclick="searchCategory(7)"><img src="/triangleView/img/main/sports.png">
				<p>스포츠</p></li>
			<li onclick="searchCategory(8)"><img src="/triangleView/img/main/beauty.png">
				<p>뷰티</p></li>
			<li onclick="searchCategory(9);"><img src="/triangleView/img/main/music.png">
				<p>뮤직</p></li>
		</ul>
	</div>
</body>
</html>