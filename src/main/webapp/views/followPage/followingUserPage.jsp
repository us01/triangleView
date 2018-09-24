<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Member> userList = (ArrayList<Member>)request.getAttribute("userList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<style>
	.followArea {
		width:400px;
		height:400px;
		background:white;
		border-radius:20px;
	}
	.followInfoAear {
		height:24px;
		padding-top:14px;
		padding-bottom:14px;
		border-bottom:1px solid #E9EBEE;
	}
	.followInfoAear > p {
		font-size:17px;
		font-weight:bold;
		margin:0px;
		text-align:center;
	}
	.followUserListArea > ul{
		list-style:none;
		padding-left:0px;
		margin:0px;
	}
	.followUserListArea > ul li{
		padding-top:8px;
		padding-bottom:8px;
		padding-left:16px;
		padding-right:16px;
	}
	.userInfoArea {
		display:inline-flex;
	}
	.userImgInfoArea img {
		border-radius:50%;
	}
	.userNickInfoArea {
		width: 240px;
		font-family:'맑은고딕';
	}
	.userNickInfoArea div{
		display:block;
		text-align:left;
	}
	.NickArea {
		font-weight:bold;
		font-size:12px;
		color:#262626;
		margin:0px;
		margin-top:5px;
	} 
	.introArea {
		font-size:12px;
		color:#999;
		margin:0px;
	}
	.userImgInfoArea img {
		width:30px;
		height:30px;
		margin:5px;
		margin-right:10px;
	}
	.followTrueBtn {
		right:5px;
		width: 94px;
		background-color: #f8585b;
		border: none;
		color: #FDEBEC;
		margin-top:3px;
		padding: 7px;
		text-align: center;
		text-decoration: none;
		font-size: 14px;
		cursor: pointer;
		border-radius:5px;
	}
	.followFalseBtn {
		right:5px;
		width: 94px;
		background-color: lightgray;
		border: none;
		color: white;
		margin-top:3px;
		padding: 7px;
		text-align: center;
		text-decoration: none;
		font-size: 14px;
		cursor: pointer;
		border-radius:5px;
	}
</style>
<script>
	function followFalse(meNo, userNo){
		$.ajax({
			url:'<%= request.getContextPath() %>/followFalse',
			type:'get',
			data:{
				meNo:meNo,
				userNo:userNo
			},
			success:function(data){
				if(data == '팔로우'){
					$('.followTrueBtn' + userNo).remove();
					
					$button = '<button class="followFalseBtn followFalseBtn'+ userNo +'" onclick="followTrue(' + meNo + ', ' + userNo + ')">팔로우 취소</button>';
					
					$('.followingBtnArea' + userNo).append($button);
				}else if(data == '팔로우 실패'){
					alert('팔로우 실패, 고객센터로 문의 주세요');
				}
			}
		});
	}
	
	function followTrue(meNo, userNo){
		$.ajax({
			url:'<%= request.getContextPath() %>/followTrue',
			type:'get',
			data:{
				meNo:meNo,
				userNo:userNo
			},
			success:function(data){
				if(data == '팔로우 취소'){
					$('.followFalseBtn' + userNo).remove();
					
					$button = '<button class="followTrueBtn followTrueBtn'+ userNo +'" onclick="followFalse(' + meNo + ', ' + userNo + ')">팔로우</button>';
					
					$('.followingBtnArea' + userNo).append($button);
				}else if(data == '팔로우 취소 실패'){
					alert('팔로우 실패, 고객센터로 문의 주세요');
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="followArea">
		<div class="followInfoAear">
			<p>팔로워</p>
		</div>
		<div class="followUserListArea">
			<ul>
				<% for(int i = 0; i < userList.size(); i++){ %>
					<li>
						<div class="userInfoArea">
							<div class="userImgInfoArea">
								<div>
									<img src="/triangleView/img/test3.jpg"/>
								</div>
							</div>
							<div class="userNickInfoArea">
								<div class="NickArea"><%= userList.get(i).getNick() %></div>
								<div class="introArea"><%= userList.get(i).getIntro() %></div>
							</div>
							<div class="followingBtnArea<%= userList.get(i).getUserNo() %>">
								<button class="followFalseBtn followFalseBtn<%= userList.get(i).getUserNo() %>" onclick="followTrue(<%= loginUser.getUserNo() %>, <%= userList.get(i).getUserNo() %>)">팔로우 취소</button>
							</div>
						</div>
					</li>
				<% } %>
			</ul>
		</div>
	</div>
</body>
</html>