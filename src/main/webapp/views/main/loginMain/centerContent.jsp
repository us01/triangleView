<%@page import="com.chain.triangleView.review.review.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/triangleView/css/w3.css">
<title></title>
<style>
	.centerContent {
		margin:0 auto;
		display:inline-block;
		width:68%;
	}
	.viewForm{
		width:210px;
		height:287px;
		margin:7px;
		margin-top:8px;
		position:relative;
		display:inline-block;
		float:left;
		border:1px solid #E5E5E5;
		background:white;
	}
	.viewMainImage img{
		width:210px;
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
	.formArea {
		z-index: 300;
   		position: fixed;
   		left: 50%;
   		margin-left:-500px;
    	top: 110px;
	}
	@media all and (max-width:768px){
		.centerContent { 
			width:100%; 
			display:inline-table;
		}
	}
</style>
<script>
	function loadReivewForm(rwNo, rwContentType){
		$.ajax({
			url : "/triangleView/loadOneReviewForm.rf",
			type : "GET",
			data : {
				'rwNo':rwNo,
				'rwContentType':rwContentType
			},
			success : function(data) {
				$(".formArea").html(data);
				document.getElementById('formAreaArea').style.display = 'block';
				document.getElementById('formArea').style.display = 'block';
			}
		});
	}

	function formDisplayNone() {
		document.getElementById('formArea').style.display = 'none';
		document.getElementById('formAreaArea').style.display = 'none';
	}
</script>
</head>
<body>
	<div class="centerContent">
		<% for(int i = 0; i <= reviewList.size()-1; i++){ %>
			<div class="viewForm">
				<div class="viewMainImage">
					<img src="/triangleView/img/test3.jpg" onclick="loadReivewForm(<%= reviewList.get(i).getRwNo() %>, <%= reviewList.get(i).getRwContentType() %>)">
				</div>
				<div class="formType">
					<img src="/triangleView/img/viewList/video.png">
				</div>
				<div class="viewTitle">
					<p><%= reviewList.get(i).getRwTitle() %></p>
				</div>
				<div class="viewSearchImage">
					<img src="/triangleView/img/viewList/views.png">
					<p><%= reviewList.get(i).getRwCount() %></p>
				</div>
				<div class="viewLikeImage">
					<img src="/triangleView/img/viewList/like.png">
					<p><%= reviewList.get(i).getLikeCount() %></p>
				</div>
				<div class="reviewWriter">
					@ <p><%= reviewList.get(i).getNick() %></p>
				</div>
			</div>
		<% } %>
	</div>
	<div id="formArea" class="formArea"></div>
	<div id="formAreaArea" class="w3-modal" onclick="formDisplayNone();"></div>
</body>
</html>