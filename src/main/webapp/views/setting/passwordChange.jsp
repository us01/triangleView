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
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="https://code.jquery.com/color/jquery.color-2.1.2.js"
	integrity="sha256-1Cn7TdfHiMcEbTuku97ZRSGt2b3SvZftEIn68UMgHC8="
	crossorigin="anonymous">
</script>
<style>
.containChange {
	width: 670px;
	height: 600px;
	text-align: left;
	margin-left: 150px;
	font-size: 13px;
	float: right;
	margin-right: -220px;
}

.btn-success {
	background-color: #f8585b;
	border: none;
	color: #FDEBEC;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border-radius: 5px;
}

.profileOut {
	width: 100px;
	height: 100px;
	border-radius: 100px;
	margin-left: -120px;
	margin-top: 100px;
}

.containPassword {
	margin-top: -120px;
}
</style>
</head>
<body>
	<form class="changeForm" id="form" name="passwordUpdate" action="" method="post">
		<div class="containChange">
			<div>
				<img class="profileOut" id="image_section"
					src="/triangleView/img/member/profile.png" />
			</div>
			<div class="containPassword">
				<div>
					<span class="" style="background-color: white; color: black;">이전
						비밀번호</span>
					<div>
						<input type="password" class="" id="oldPwd" name="oldPwd"
							placeholder="이전 비밀번호" style="width: 270px;">
					</div>
				</div>
				<div>
					<span class="" style="background-color: white; color: black;">새
						비밀번호</span>
					<div>
						<input type="password" class="" id="newPwd" name="newPwd"
							placeholder="새로운 비밀번호" style="width: 270px;">
					</div>
				</div>
				<div>
					<span class="" style="background-color: white; color: black;">
						새 비밀번호 확인</span>
					<div>
						<input type="password" class="" id="userPwdCheck"
							name="newPwdCheck" placeholder="비밀번호 확인" style="width: 270px;">
						<br> <label id="pwdresult"></label>
					</div>
				</div>
			</div>
			<div class="" style="text-align: center; height: 40px; margin-top: 10px; display: inline-block;">
				<input type="button" class="btn-success" id="updatePass"
					value="비밀번호 변경" disabled="disabled" onclick="youHaveTo()"></input>
				<input type="reset" class="btn-success" onclick="end();" value="취소"></input>
			</div>
		</div>
	</form>
	
	<script>
		//비밀번호체크
		$("#userPwdCheck").change(function() {
			
			if ($("#newPwd").val() != $(this).val()) {
				
				$("#pwdresult").html("비밀번호가 일치하지 않습니다").css("color", "red");
				$("#userPwdCheck").val('');
				$(this).select();
				$('#updatePass').attr("disabled", true);
			} else {
				$("#pwdresult").html("비밀번호가 일치합니다").css("color", "green");
				$('#updatePass').attr("disabled", false);
			}
		})
		
		function youHaveTo(){
		
			theForm = document.passwordUpdate;
			
			form.action = "<%=request.getContextPath()%>/updatePassword.me";
					form.submit();
		}
	</script>
</body>
</html>