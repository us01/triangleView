<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.leftContent {
		display: inline-block;
		border:1px solid #E5E5E5;
		float: left;
		width: 15%;
		border-radius:10px;
		margin-top:9px;
		background:white;
	}
	
	.leftProfile {
		width: 96%;
		list-style: none;
		padding-left: 0px;
		display:inline-block;
		vertical-align:top;
		text-align:center;
	}
	.leftProfile li{
		width: 100%;
		padding-left: 0px;
	}
	
	.leftProfile li hr {
		width: 70%;
		height: 1px;
		margin:15px;
		margin-left:21px;
	}
	.leftProfile li h6 {
		margin:0 auto;
	}
	
	.leftProfile .leftProfileImage {
		width: 120px;
		height: 120px;
		background: #C5CCE9;
		border-radius: 50%;
		margin-left:12px;
	}
	.leftProfile li .introduction {
		text-align:center;
		padding-left: 6px;
		padding-right: 8px;
		width: 95%;
		color: black;
		font-size:8px;
	}
	
	.leftProfile .nickNameArea{
		font-size:13px;
	}
	.leftProfile li:nth-of-type(3){
		margin-bottom:30px;
	}
	.leftProfile li .follow, .leftProfile li .follower{
		color: black;
		font-size:17px;
		margin-top:5px;
		margin-bottom:9px;
		font-weight:bold;
	}
	.leftProfile li:nth-of-type(5){
		margin-bottom:40px;
	}
	.interest {
		width: 130px;
		display: inline-block;
		text-align:center;
		padding:4px;
		margin-top:4px;
	}
	.interest .category {
		display: inline-block;
		text-align:center;
		width: 31px;
		height:31px;
		padding:0px;
		background: #C5CCE9;
		border-radius: 50%;
		margin:3px;
		font-size:9px;
	}
	.logoutleftArea {
		margin-top:216px;
		margin-bottom:240px;
		font-size:12px;
		color : white;
	}
	@media all and (max-width:768px) {
		.leftContent {
			display: none;
		}
	}
	
	.logoutInBtn{
	
		border-radius : 5px;
		background: white;
    	color: #f7323f;
		width : 100px;
		height : 35px;
		margin-top : 15px;
		margin-left : auto;
		margin-right : auto;
		text-align : center;
		line-height : 35px;
	}
	
	.logoutInBtn:hover{
		
		cursor : pointer;
		
	}
</style>
</head>
<body>
	<div class="leftContent" id="leftContentDiv">
		<% if(loginUser != null){ %>
			<ul class="leftProfile">
				<li>
					<div class="leftProfileImage">
						<img src="/triangleView/img/test.png" style="border-radius:50%; width:120px; height:120px;">
					</div>
				</li>
	
				<li>
					<p class="introduction">
						<%= loginUser.getIntro() %>
					</p>
				</li>
				<li>
					<h6 class="nickNameArea">@&nbsp;<%= loginUser.getNick()%></h6>
				</li>
				<li>
					<h6>팔로우</h6>
					<p class="follow"><%= loginUser.getFollowCount() %></p>
				</li>
				<li>
					<h6>팔로워</h6>
					<p class="follower"><%= loginUser.getFollowingCount() %></p>
				</li>
				<li>
					<h6>관심주제</h6>
					<div class="interest">
						<div class="category">게임</div>
						<div class="category">취미</div>
						<div class="category">IT</div>
						<div class="category">인생</div>
						<div class="category">금융</div>
						<div class="category">스포츠</div>
						<div class="category">뷰티</div>
						<div class="category">동물</div>
						<div class="category">기타</div>
					</div>
				</li>
			</ul>
		<% }else{ %>
			<script>
				$("#leftContentDiv").css('backgroundImage','url(/triangleView/img/main/loginBack2.png)');
			</script>
			<div class="logoutleftArea">
				<p style="margin-botton : 10px;"><b>회원 전용 <br/><br/>
					서비스입니다. <br/><br/>
					로그인 후 이용해 <br/><br/>
					주세요!</b></p>
				<div class="logoutInBtn" onclick="insertMemberTypeDisplayBlock()"><b>로그인</b></div>
				<div class="logoutInBtn" onclick="choiseInsertMemberPageMove()"><b>회원가입</b></div>
			</div>
		<% } %>
	</div>
	<script>
		function choiseInsertMemberPageMove(){
			document.getElementById('insertMemberTypeArea').style.display = 'none';
			$(".insertMemberTypeArea").css("margin-left", "-250px");
			$.ajax({
				url : "/triangleView/views/member/choiseInsertMemberPage.jsp",
				data : "html",
				success : function(data) {
					$(".insertMemberTypeArea").html(data);
					document.getElementById('insertMemberTypeAearArea').style.display = 'block';
					document.getElementById('insertMemberTypeArea').style.display = 'block';
				}
			});
		}
	</script>
</body>
</html>