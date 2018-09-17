<%@page import="java.util.ArrayList"%>
<%@page import="com.chain.triangleView.review.review.vo.RwComment"%>
<%@page import="com.chain.triangleView.review.review.vo.Form"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> reviewForm = (HashMap<String, Object>)request.getAttribute("reviewForm");

	Iterator<String> keys = reviewForm.keySet().iterator();
	Form form = null;
	ArrayList<RwComment> rwComment = null;
	
	while(keys.hasNext()){
		String key = keys.next();
		if(key.equals("form")){
			form = (Form)reviewForm.get(key);
		}else if(key.equals("rwComment")){
			rwComment = (ArrayList<RwComment>)reviewForm.get(key);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/triangleView/css/w3.css">
<script
	src="https://code.jquery.com/color/jquery.color-2.1.2.js"
	integrity="sha256-1Cn7TdfHiMcEbTuku97ZRSGt2b3SvZftEIn68UMgHC8="
	crossorigin="anonymous">
</script>
<title>Insert title here</title>
<style>
	.modal{
		text-align:center;
	}
	.review-Form {
		display: flex;
		width:1000px;
		margin:0 auto;
	}
	.contentArea {
		width:700px;
		height:500px;
		background:white;
	}
	.contentInfoArea {
		overflow:hidden;
		position:relative;
		width:300px;
		height:500px;
		background:white;
		border-left:1px solid #E9EBEE;
	}
	.contentinfo-header{
		width:300px;
		height:52px;
		padding:16px;
		display:inline-flex;
	}
	.contentinfo-comment {
		width:318px;
		height:291px;
		overflow:hidden;
		overflow-y:scroll;
		border-top:1px solid #E9EBEE;
	}
	.parentComment-insertArea{
		width:300px;
		display:inline-flex;
		padding-left:8px;
		padding-right:16px;
	}
	.childComment-insertArea{
		width:230px;
		display:inline-flex;
		padding-right:8px;
		float:right;
	}
	.parentCommentArea {
		padding-left:8px;
		padding-right:8px;
		padding-top:3px;
		padding-bottom:3px;
		width:215px;
		background:#E9EBEE;
		border-radius:15px;
		margin-top: 3px;
    	margin-bottom: 3px;
	}
	.childCommentArea {
		padding-left:8px;
		padding-right:8px;
		padding-top:3px;
		padding-bottom:3px;
		width:182px;
		background:#E9EBEE;
		border-radius:15px;
		margin-top: 3px;
    	margin-bottom: 3px;
	}
	.parentComment_Id {
		font-size:12px;
		font-weight:bold;
		color:#365899;
	}
	.childComment_Id {
		font-size:12px;
		font-weight:bold;
		color:#365899;
	}
	.parentComment {
		font-size:11px;
		text-align:left;
		margin-right:200px;
	}
	.childComment {
		font-size:11px;
		text-align:left;
		margin-right:200px;
	}
	.parentComment_apply {
		font-size:11px;
		display:inline-block;
		padding-right: 16px;
		float:right;
	}
	.childComment_apply {
		font-size:11px;
		display:inline-block;
		padding-right: 16px;
		float:right;
	}
	.profileImageArea {
		width:33px;
		height:33px;
		overflow:hidden;
		margin-top:10px;
		margin-right:15px;
		
	}
	.reviewProfileImageArea {
		width:42px;
		height:42px;
		border-radius:50%;
		overflow:hidden;
		margin-right:15px;
		
	}
	.parentCommentProfileImageArea {
		width:33px;
		height:33px;
		border-radius:50%;
		margin-top:8px;
		overflow:hidden;
		margin-left:5px;
		margin-right:15px;
	}
	.childCommentProfileImageArea {
		width:25px;
		height:25px;
		border-radius:50%;
		margin-top:8px;
		overflow:hidden;
		margin-right:8px;
	}
	
	.commentInsertProfileImageArea {
		width:33px;
		height:33px;
		border-radius:50%;
		overflow:hidden;
		margin-top:5px;
		margin-left:10px;
		margin-right:15px;
		
	}
	.reviewProfileImageArea img{
		width:42px;
		height:42px;
	}
	.parentCommentProfileImageArea img{
		width:33px;
		height:33px;
	}
	.childCommentProfileImageArea img{
		width:25px;
		height:25px;
	}
	.commentInsertProfileImageArea img{
		width:33px;
		height:33px;
	}
	.reviewTitleArea {
		width:232px;
		text-align:left;
		height:35px;
		border-radius:18px;
	}
	.commentInsertInputArea {
		displya:inline;
		margin-top:5px;
		width:232px;
		text-align:left;
		height:35px;
		border-radius:18px;
		background:white;
		
	}
	.commentInsertInputArea div {
		display:inline;
	}
	.commentInsertInputArea input{
		vertical-align:middle;
		border:none;
		margin-left:10px;
		margin-top:6px;
		box-sizing:border-box;
		outline:none;
	}
	.contentinfo-body {
		width:300px;
		display:table;
	}
	.reviewSideContent {
		padding: 16px;
		width:268px;
		text-align:left;
	}
	.like-qty {
		width:145px;
		padding: 3px;
		display:inline-block;
		margin:0px;
		padding-left:5px;
		text-align:left;
		font-size:12px;
		color: #777D88;
	}
	.comment-qty {
		width:139px;
		padding: 3px;
		display:inline-block;
		margin:0px;
		padding-right:5px;
		text-align:right;
		font-size:12px;
		color: #777D88;
	}
	.reviewTitleArea P{
		font-family:'맑은고딕';
		display:inline-block;;
		width:219px;
		font-size:13px;
		font-weight:bold;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
		margin-top:0px;
		margin-bottom:0px;
		text-align:left;
		font-weight:unset;
	}
	.reviewTitleArea P:nth-of-type(1){ 
		font-size:14px;
		font-weight:bold;
		margin-top:10px;
	}
	.reviewTitleArea P:nth-of-type(2), .reviewTitleArea P:nth-of-type(3){
		font-size:12px; 
		text-align:right;
	}
	.commentInsert {
		position:absolute;
		background:#f2f3f5;
		left:0px;
		top: 455px;
		width:300px;
		height:45px;
		display:flex;
	}
</style>
</head>
<body>
	<div class="review-Form">
		<div class="contentArea"><%= form.getRwContent() %></div>
		<div class="contentInfoArea">
			<div>
				<div class="contentinfo-header">
					<div class="reviewProfileImageArea">
						<img src="/triangleView/img/mypage/defaultProfileImage.jpg">
					</div>
					<div class="reviewTitleArea">
						<p><%= form.getRwTitle() %></p>
						<br>
						<p>@ <%= form.getNick() %> </p>
						<br>
						<p><%= form.getWriteDate() %></p>
					</div>
				</div>
				<div class="contentinfo-body">
					<div class="reviewSideContent">
						<%= form.getRwComment() %>
					</div>
					<div class="like-qty">
						<img src="/triangleView/img/reviewForm/like.png"><span><%= form.getRwLikeCount() %></span>명
					</div>
					<div class="comment-qty">
						댓글 <span><%= form.getRwCommentCount() %></span>개
					</div>
				</div>
				<!--코멘트  -->
				<div class="contentinfo-comment">
					<% for(int i = 0; i < rwComment.size(); i++){ %>
						<% if(!rwComment.get(i).getParentCommentNo()){ %>
							<div class="addParentComment">
								<div class="parentComment-insertArea">
									<div class="parentCommentProfileImageArea">
										<img src="/triangleView/img/mypage/defaultProfileImage.jpg">
									</div>
									<div class="parentCommentArea">
										<span class="parentComment">
										<a class="parentComment_Id">@ <%= rwComment.get(i).getNick() %></a>
											<%= rwComment.get(i).getCommentContent() %>
										</span>
									</div>
								</div>
								<span class="parentComment_apply"><%= rwComment.get(i).getRwDate() %></span>
							</div>
						<% }else{ %>
							<div class="addChildComment">
								<div class="childComment-insertArea">
									<div class="childCommentProfileImageArea">
										<img src="/triangleView/img/mypage/defaultProfileImage.jpg">
									</div>
									<div class="childCommentArea">
										<span class="childComment">
										<a class="childComment_Id">@ <%= rwComment.get(i).getNick() %></a>
											<%= rwComment.get(i).getCommentContent() %>
										</span>
									</div>
								</div>
								<span class="childComment_apply"><%= rwComment.get(i).getRwDate() %></span>
							</div>
						<% } %>
					<% } %>
				</div>
				<!--코멘트  -->
				<div>
					<div class="commentInsert">
						<div class="commentInsertProfileImageArea">
							<img src="/triangleView/img/mypage/defaultProfileImage.jpg">
						</div>
						<div class="commentInsertInputArea">
							<input type="text">
							<div>검색</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>