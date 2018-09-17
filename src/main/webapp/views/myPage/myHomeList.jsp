<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
		font-family:'맑은고딕';
	}
	.myHomeListArea {
		margin:0 auto;
		display:inline-block;
		width:100%;
	}
	.viewForm{
		background:white;
		width:234px;
		height:287px;
		margin:7px;
		margin-top:10px;
		position:relative;
		display:inline-block;
		float:left;
		border:1px solid #E5E5E5;
	}
	.viewMainImage img{
		width:234px;
		height:210px;
	}
	.formType{
		top:0px;
		left:10px;
		position:absolute;
		z-index:2;
	}
	.viewTitle {
		width:100%;
		display:inline-block;
		text-align: left;
	}
	.viewTitle p {
		font-size:13px;
		font-weight:bold;
		width:210px;
		padding-left:5px;
		margin-top:5px;
		margin-bottom:5px;
	}
	.viewSearchImage, .viewLikeImage{
		width:50%;
		float:left;
		display:table;
		text-align:center;
	}
	.viewSearchImage p, .viewLikeImage p{
		display:table-cell;
		font-size:7px;
		font-weight: bold;
		text-align:left;
		vertical-align:middle;
		margin:0px;
		color:darkgray;
	}
	.reviewWriter {
		text-align:right;
		font-size:11px;
		font-weight:bold;
		padding-top:31px;
	}
	.reviewWriter p{
		display:inline;
		padding-right:3px;
		font-size:12px;
		font-weight:bold;
		margin:0px;
	}
	@media all and (max-width:768px) {
		.centerContent { width:100%; }
	}
</style>
</head>
<body>
	<div class="myHomeListArea">
		<div class="viewForm">
			<div class="viewMainImage">
				<img src="/triangleView/img/test3.jpg">
			</div>
			<div class="formType">
				<img src="/triangleView/img/viewList/video.png">
			</div>
			<div class="viewTitle">
				<p>왜 잠이 갑자기 안오지</p>
			</div>
			<div class="viewSearchImage">
				<img src="/triangleView/img/viewList/views.png">
				<p>2,305</p>
			</div>
			<div class="viewLikeImage">
				<img src="/triangleView/img/viewList/like.png">
				<p>516</p>
			</div>
			<div class="reviewWriter">
				@ <p> one_bin_293</p>
			</div>
		</div>
	</div>
</body>
</html>