<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.chain.triangleView.userHome.userHome.vo.HomeReview"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	HashMap<String, Object> userHome = (HashMap<String, Object>)request.getAttribute("userHome");
	ArrayList<HomeReview> reviews = (ArrayList<HomeReview>)userHome.get("reviews");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/triangleView/css/w3.css">
<script
	src="https://code.jquery.com/color/jquery.color-2.1.2.js"
	integrity="sha256-1Cn7TdfHiMcEbTuku97ZRSGt2b3SvZftEIn68UMgHC8="
	crossorigin="anonymous">
</script>
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
		cursor:pointer;
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
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
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
	.viewSearchImage > img, .viewLikeImage > img{
		width:30px;
		height:25px;
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
		display:inline-flex;
		z-index: 300;
   		position: fixed;
   		left: 50%;
   		margin-left:-500px;
    	top: 110px;
	}
	@media all and (max-width:768px) {
		.centerContent { width:100%; }
	}
</style>
<script>
	function loadReivewForm(rwNo, rwContentType, userNo){
		$.ajax({
			url : "/triangleView/loadOneReviewForm.rf",
			type : "GET",
			data : {
				rwNo : rwNo,
				rwContentType : rwContentType,
				userNo : userNo
			},
			success : function(data) {
				$(".formArea").html(data);
				document.getElementById('formAreaArea').style.display = 'inline-flex';
				document.getElementById('formArea').style.display = 'inline-flex';
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
	<div class="myHomeListArea">
		<% for(int i = 0; i < reviews.size(); i++){ %>
			<div class="viewForm">
				<% if(loginUser != null){ %>
					<div class="viewMainImage" onclick="loadReivewForm(<%= reviews.get(i).getRwNo() %>, <%= reviews.get(i).getRwContentType() %>, <%= loginUser.getUserNo() %>)">
				<% }else{ %>
					<div class="viewMainImage" onclick="loadReivewForm(<%= reviews.get(i).getRwNo() %>, <%= reviews.get(i).getRwContentType() %>, -1)">
				<% } %>
					<img src="<%= request.getContextPath() %>/review_upload/<%= reviews.get(i).getThumbnail() %>">
				</div>
				<div class="formType">
					<% if(reviews.get(i).getRwContentType() == 0){ %>
						<img src="/triangleView/img/viewList/text.png">
					<% }else if(reviews.get(i).getRwContentType() == 1){ %>
						<img src="/triangleView/img/viewList/card.png">
					<% }else{ %>
						<img src="/triangleView/img/viewList/video.png">
					<% } %>
				</div>
				<div class="viewTitle">
					<p><%= reviews.get(i).getRwTitle() %></p>
				</div>
				<div class="viewSearchImage">
					<img src="/triangleView/img/viewList/view.png">
					<p><%= reviews.get(i).getRwCount() %></p>
				</div>
				<div class="viewLikeImage">
					<img src="/triangleView/img/viewList/love.png">
					<p><%= reviews.get(i).getLikeCount() %></p>
				</div>
				<div class="reviewWriter">
					@ <p><%= reviews.get(i).getNick()%></p>
				</div>
			</div>
		<% } %>
	</div>
	<div id="formArea" class="formArea"></div>
	<div id="formAreaArea" class="w3-modal" onclick="formDisplayNone();"></div>
</body>
</html>