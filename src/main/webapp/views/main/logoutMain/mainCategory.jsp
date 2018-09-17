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
</head>
<body>
	<div class="category">
		<ul>
			<li value="1"><img src="/triangleView/img/main/freedom.png">
				<p>자유</p></li>
			<li><img src="/triangleView/img/main/game.png">
				<p>게임</p></li>
			<li><img src="/triangleView/img/main/hobby.png">
				<p>취미</p></li>
			<li><img src="/triangleView/img/main/appliance.png">
				<p>IT/가전</p></li>
			<li><img src="/triangleView/img/main/life.png">
				<p>인생</p></li>
			<li><img src="/triangleView/img/main/banking.png">
				<p>금융</p></li>
			<li><img src="/triangleView/img/main/sports.png">
				<p>스포츠</p></li>
			<li><img src="/triangleView/img/main/beauty.png">
				<p>뷰티</p></li>
			<li><img src="/triangleView/img/main/music.png">
				<p>뮤직</p></li>
		</ul>
	</div>
</body>
</html>