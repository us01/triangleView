<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.chain.triangleView.review.review.vo.RwComment"%>
<%@page import="com.chain.triangleView.review.review.vo.Form"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	HashMap<String, Object> reviewForm = (HashMap<String, Object>)request.getAttribute("reviewForm");

	Iterator<String> keys = reviewForm.keySet().iterator();
	Form form = null;
	ArrayList<RwComment> rwComment = null;
	
	int rwNo = -1;
	
	while(keys.hasNext()){
		String key = keys.next();
		if(key.equals("form")){
			form = (Form)reviewForm.get(key);
			rwNo = form.getRwNo();
		}else if(key.equals("rwComment")){
			rwComment = (ArrayList<RwComment>)reviewForm.get(key);
		}
	}
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
	.modal{
		text-align:center;
	}
	.review-Form {
		display: inline-flex;
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
	.childComment_apply {
		font-size:11px;
		display:inline-block;
		padding-right:10px;
		color:#365899;
		float:right;
	}
	.parentComment_apply {
		font-size:11px;
		display:inline-block;
		padding-left: 70px;
		color:#365899;
		float:left;
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
	.childCommentInsertProfileImageArea {
		width:25px;
		height:25px;
		border-radius:50%;
		overflow:hidden;
		margin-top:4px;
		margin-left:10px;
	}
	.childCommentInsertProfileImageArea img{
		width:25px;
		height:25px;
	}
	.parentCommentInsertProfileImageArea {
		width:33px;
		height:33px;
		border-radius:50%;
		overflow:hidden;
		margin-top:5px;
		margin-left:10px;
		margin-right:15px;
		
	}
	.parentCommentInsertProfileImageArea img{
		width:33px;
		height:33px;
	}
	.reviewProfileImageArea img{
		width:42px;
		height:42px;
	}
	.addchlidCommentArea {
		display:none;
	}
	.parentCommentProfileImageArea img{
		width:33px;
		height:33px;
	}
	.childCommentProfileImageArea img{
		width:25px;
		height:25px;
	}
	
	.reviewTitleArea {
		width:232px;
		text-align:left;
		height:35px;
		border-radius:18px;
	}
	.parentCommentInsertInputArea {
		displya:inline;
		margin-top:5px;
		width:232px;
		text-align:left;
		height:35px;
		border-radius:18px;
		background:white;
		
	}
	.parentCommentInsert {
		position:absolute;
		background:#f2f3f5;
		left:0px;
		top: 455px;
		width:300px;
		height:45px;
		display:flex;
	}
	.parentCommentInsertInputArea div {
		display:inline;
	}
	.parentCommentInsertInputArea input{
		vertical-align:middle;
		border:none;
		margin-left:10px;
		margin-top:6px;
		box-sizing:border-box;
		outline:none;
	}
	.childCommentInsertInputArea {
		margin-top:4px;
		margin-left:10px;
		width:228px;
		text-align:left;
		height:25px;
		border-radius:18px;
		background:white;
		
	}
	.childCommentInsert {
		margin-right:8px;
		margin-top:5px;
		margin-bottom:5px;
		background:#f2f3f5;
		width:280px;
		border-radius:15px;
		height:33px;
		display:flex;
		float:right;
	}
	.childCommentInsertInputArea div {
		display:inline;
	}
	.childCommentInsertInputArea input{
		vertical-align:middle;
		border:none;
		margin-left:10px;
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
	.commentLoginInfoArea {
		width:100%;
		font-size:12px;
		background:#f2f3f5;
		height:46px;
		text-align:center;
		padding-top:15px;
		color:#878787;
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
	.subSideArea {
		display:inline;
		width:100px;
	}
	.subSideArea button {
		width: 70px;
		background-color: #f8585b;
		border: none;
		color: #FDEBEC;
		padding: 6px 0;
		text-align: center;
		text-decoration: none;
		font-size: 14px;
		margin: 4px;
		cursor: pointer;
		border-radius:5px;
	}
</style>
<script>
	function addCommentAreaDisplay(rwNo){
		var display = $('.addchlidCommentArea'+rwNo).css('display');
		
		if(display == "none"){
			$('.addchlidCommentArea').css('display', 'none');
			document.getElementById('addchlidCommentArea'+rwNo).style.display = 'block';
		}else{
			document.getElementById('addchlidCommentArea'+rwNo).style.display = 'none';
		}
	}
	
	function addComment(rwNo, commentNo, inputId){
		<% if(loginUser != null){ %>
			var userNo = '<%= loginUser.getUserNo() %>';
		<% } %>
		var commentContent = '';
		
		if(commentNo == -1){
			commentContent = $('#parentComment'+rwNo).val();
		}else{
			commentContent = $('#childComment'+inputId).val();
		}
		
		location.href='<%= request.getContextPath() %>/addComment?rwNo=' + rwNo + '&commentNo=' + commentNo + '&userNo=' + userNo + '&commentContent=' + commentContent;
	}
	
	function subSiteMove(subSite){
		$(location).attr('href', subSite);
	}
</script>
</head>
<body>
	<% if(form.getCoorLink() != null){ %>
	<div class="subSideArea"> 
		<button onclick="subSiteMove('<%= form.getCoorLink() %>')">관련 링크</button>
	</div>
	<% } %>
	<div class="review-Form">
		<div class="contentArea">
			<%= form.getRwContent() %>
		</div>
		<div class="contentInfoArea">
			<div>
				<div class="contentinfo-header">
					<div class="reviewProfileImageArea">
						<img src="/triangleView/profileImg_upload/<%= form.getThumbnail() %>">
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
				<% if(rwComment != null){ %>
					<div class="contentinfo-comment">
						<% for(int i = 0; i < rwComment.size(); i++){ %>
							<% if(!rwComment.get(i).getParentCommentNo()){ %>
								<div class="addParentComment">
									<div class="parentComment-insertArea">
										<div class="parentCommentProfileImageArea">
											<img src="/triangleView/profileImg_upload/<%= rwComment.get(i).getThumbnail() %>">
										</div>
										<div class="parentCommentArea">
											<span class="parentComment">
											<a class="parentComment_Id">@ <%= rwComment.get(i).getNick() %></a>
												<%= rwComment.get(i).getCommentContent() %>
											</span>
										</div>
									</div>
									<% if(loginUser != null){ %>
										<span class="parentComment_apply" onclick="addCommentAreaDisplay(<%= rwComment.get(i).getCommentNo() %>)">답글 달기</span>
										<span class="parentComment_apply"><%= rwComment.get(i).getRwDate() %></span>
										<div class="addchlidCommentArea addchlidCommentArea<%= rwComment.get(i).getCommentNo() %> " id="addchlidCommentArea<%= rwComment.get(i).getCommentNo() %>">
											<div class="childCommentInsert">
												<div class="childCommentInsertProfileImageArea">
													<img src="/triangleView/profileImg_upload/<%= loginUser.getThumbnail() %>">
												</div>
												<div class="childCommentInsertInputArea">
													<input id='childComment<%= i %>' type="text">
													<div onclick="addComment(<%= rwComment.get(i).getRwNo() %>, <%= rwComment.get(i).getCommentNo()%>, <%= i %>)">등록</div>
												</div>
											</div>
										</div>
									<% }else{ %>
										<span class="parentComment_apply" style="padding-left:188px;"><%= rwComment.get(i).getRwDate() %></span>
									<% } %>
								</div>
							<% }else{ %>
								<div class="addChildComment">
									<div class="childComment-insertArea">
										<div class="childCommentProfileImageArea">
											<img src="/triangleView/profileImg_upload/<%= rwComment.get(i).getThumbnail() %>">
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
				<% } %>
				<!--코멘트  -->
				<% if(loginUser != null){ %>
					<div>
						<div class="parentCommentInsert">
							<div class="parentCommentInsertProfileImageArea">
								<img src="/triangleView/profileImg_upload/<%= loginUser.getThumbnail() %>">
							</div>
							<div class="parentCommentInsertInputArea">
								<input id='parentComment<%= rwNo %>' type="text">
								<div onclick="addComment(<%= rwNo %>, -1, -1)">등록</div>
							</div>
						</div>
					</div>
				<% }else{ %>
					<div class="commentLoginInfoArea">댓글은 로그인 후 이용하세요</div>
				<% } %>
			</div>
		</div>
	</div>
</body>
</html>