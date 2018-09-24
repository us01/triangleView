<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@page import="com.chain.triangleView.review.review.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
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
	body {
		font-family:'맑은고딕';
	}
	.contentsAear {
		margin:0 auto;
		width:900px;
	}
	.hotLivewList {
		background:white;
		margin:0 auto;
		height:307px;
		border:1px solid #dbdbdb;
	}
	.contentsAear ul{
		list-style:none;
		padding-left:0px;
		margin:0 auto;
		width:900px;
	}
	.contentsAear ul li {
		text-align:left;
	}
	.viewForm{
		width:203px;
		display:inline-block;
		float:left;
		margin:9px;
		position:relative;
		border:1px solid #dbdbdb;
		height:287px;
	}
	
	.viewForm:first-child{
		margin-left:9px;
	}
	.viewForm:last-child{
		margin-left:13px;
	}
	.viewMainImage img{
		width:203px;
		height:221px;
		cursor:pointer;
	}
	.viewForm div:nth-of-type(6) p{
		font-size:8px;
		margin:0px;
	}
	.formType{
		top:0px;
		left:0px;
		position:absolute;
		z-index:2;
	}
	.formType img{
		width:25px;
	}
	.viewTitle {
		width:100%;
		display:inline-block;
		text-align: left;
	}
	.viewTitle p {
		font-size:13px;
		font-weight:bold;
		padding-left:5px;
		margin-top:2px;
		margin-bottom:2px;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
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
	.eyeImage{
		width:29px;
		height:29px;
	}
	.likeImage{
		width:29px;
		height:29px;
	}
	.reviewWriter {
		text-align:right;
		font-size:11px;
		font-weight:bold;
		display:inline-block;
		width:203px
	}
	.reviewWriter p{
		display:inline;
		padding-right:5px;
		font-size:12px;
		font-weight:bold;
		margin:0px;
		cursor:pointer;
	}
	
	.reviewerRecruitmentListArea {
		background:white;
		margin:0 auto;
		height:320px;
		border:1px solid #dbdbdb;
	}
	.recruitmentForm {
		width:204px;
		display:inline-block;
		float:left;
		margin:9px;
		position:relative;
		border:1px solid #dbdbdb;
		height:301px;
	}
	.recruitmentCategoryArea {
		top:0px;
		left:0px;
		position:absolute;
		z-index:7;
		width:40px;
		height:20px;
		background:#444444;
		text-align:center;
	}
	.recruitmentCategoryArea label{
		font-size:9px;
		font-family:'맑은고딕';
		color:white;
		line-height:19px;
	}
	.recruitmentImageArea img{
		width:204px;
		height:215px;
	}
	.recruitmentTitleArea{
		width:194px;
		height:61px;
		padding-left:5px;
		padding-right:5px;
		display:inline-block;
	}
	.recruitmentTitleArea label{
		display:grid;
		font-size:12px;
		font-weight:bold;
		padding-top:11px;
		padding-bottom:4px;
	}
	.recruitmentTitleArea p{
		display:table-cell;
		font-size:9px;
		padding-top:4px;
		padding-bottom:11px;
		margin:0px;
	}
	.recruitmentStrengthArea{
		width:194px;
		height:25px;
		padding-left:5px;
		padding-right:5px;
		background:black;
		display:table;
		position:relative;
	}
	.recruitment_state_area{
		top:5px;
		left:160px;
		position:absolute;
		z-index:7;
		background:green;
		width:40px;
		height:15px;
		border-radius:2px;
		text-align:center;
	}
	.recruitment_state_area label{
		font-size:11px;
		color:white;
	}
	
	.noticeEventArea {
		background:white;
		margin:0 auto;
		margin-top:60px;
		border:1px solid #dbdbdb;
	}
	.noticeEventArea div{
		margin:9px;
		width:432px;
		height:180px;
		display:inline-block;
		border:1px solid #dbdbdb;
	}
	.noticeEventArea div:first-child{
		width:430px;
		margin-right:4px;
	}
	.noticeEventArea div:last-child{
		width:431px;
		margin-left:5px;
	}
	.noticeEventArea div:first-child img{
		width:430px;
		height:180px;
	}
	.noticeEventArea div:last-child img{
		width:431px;
		height:180px;
	}
	
	.title {
		margin-top:30px;
		color:gray;
		margin-bottom:10px;
	}
	.formArea {
		z-index: 300;
   		position: fixed;
   		left: 50%;
   		margin-left:-500px;
    	top: 110px;
	}
	@media all and (max-width:768px) {
		.centents {
			width:100%;
		}
		.contentsAear {
			margin:0 auto;
			width:95%;
		}
		.contentsAear ul{
			width:100%;
		}
		.hotLivewList {
			width:100%;
			display:inline-table;
		}
		.reviewerRecruitmentListArea {
			width:100%;	
			display:inline-table;
		}
		.noticeEventArea{
			width:100%;
			text-align:-webkit-center;
		}
		..noticeEventArea div {
			width:431px;
		}
		.noticeEventArea div:first-child{
			margin:5px;
			margin-bottom:0px;
		}
		.noticeEventArea div:last-child{
			margin:5px;
		}
	}
</style>
<script>
	function goHome(word){
		var goUser = $(word).attr("id");
		var goMe = '';
		<% if(loginUser != null){ %>
			goMe = '<%= loginUser.getUserId() %>';
		<% } %>
		
		if(goMe != goUser){
			location.href='<%= request.getContextPath()%>/userHome?goUser=' + goUser + '&goMe=' + goMe;
		}else{
			location.href='<%= request.getContextPath()%>/myHome';
		}
	}
	
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
	<jsp:include page="./mainCategory.jsp"></jsp:include>
	<div class="contentsAear">
		<ul>
			<li>
				<h2 class="title">인기리뷰</h2>
				<div class="hotLivewList">
					<%for(int i = 0; i <= reviewList.size()-1; i++){%>
						<div class="viewForm">
							<div class="viewMainImage">
								<img src="/triangleView/img/test3.jpg" onclick="loadReivewForm(<%= reviewList.get(i).getRwNo() %>, <%= reviewList.get(i).getRwContentType() %>)" >
							</div>
							<div class="formType">
								<% if(reviewList.get(i).getRwContentType() == 0){ %>
									<img src="/triangleView/img/viewList/text.png">
								<% }else if(reviewList.get(i).getRwContentType() == 1){ %>
									<img src="/triangleView/img/viewList/card.png">
								<% }else{ %>
									<img src="/triangleView/img/viewList/video.png">
								<% } %>
							</div>
							<div class="viewTitle">
								<p><%= reviewList.get(i).getRwTitle() %></p>
							</div>
							<div class="viewSearchImage">
								<img src="/triangleView/img/viewList/views.png">
								<p><%= reviewList.get(i).getTodayRwCount() %></p>
							</div>
							<div class="viewLikeImage">
								<img src="/triangleView/img/viewList/like.png">
								<p><%= reviewList.get(i).getLikeCount() %></p>
							</div>
							<div class="reviewWriter" onclick="goHome(this)" id="<%= reviewList.get(i).getUserId() %>">
								@ <p><%= reviewList.get(i).getNick() %></p>
							</div>
						</div>
					<% } %>
				</div>
			</li>
			<li>
				<h2 class="title">리뷰체험단</h2>
				<div class="reviewerRecruitmentListArea">
					<div class="recruitmentForm">
						<div class="recruitmentImageArea">
							<img src="/triangleView/img/test3.jpg">
						</div>
						<div class="recruitmentCategoryArea">
							<label>라이프</label>
						</div>
						<div class="recruitmentTitleArea">
							<label>뇌섹시대 기분좋은 습싹</label>
							<p>문제적남자 뇌색캔디 _ 뇌색겸 제고</p>
						</div>
						<div class="recruitmentStrengthArea">
							
							<div class="recruitment_state_area">
								<label>신청중</label>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="noticeEventArea">
					<div>
						<a href=""><img src="/triangleView/img/main/testevent10.png"></a>
					</div>
					<div>
						<a href=""><img src="/triangleView/img/main/testevent11.png"></a>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<div id="formArea" class="formArea"></div>
	<div id="formAreaArea" class="w3-modal" onclick="formDisplayNone();"></div>
</body>
</html>