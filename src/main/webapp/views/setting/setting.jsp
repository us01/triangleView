<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.settingListArea {
		width:250px;
		height:191px;
		background:white;
		margin:0 auto;
		border-radius:15px;
	}
	.settingListArea > ul {
		list-style:none;
		padding-left:0px;
	}/* 
	.settingListArea > ul > a:link { text-decoration: none;}
	.settingListArea > ul > a:visited { text-decoration: none;}
	.settingListArea > ul > a:hover { text-decoration: none;} */
	
	.settingListArea ul li {
		border-bottom:1px solid #efefef;
		height:33px;
		cursor:pointer;
		text-align:center;
		padding-top:13px;
	}
	.settingListArea ul li:last-child {
		border-bottom:0px;
	}
	.settingListArea > ul > li > p {
		display:inline;
	} 
</style>
<script>
	function modifyPwd(){
		$.ajax({
			url:"../setting/modifyPwdPage.jsp",
			data:"html",
			success:function(data){	
				$(".settingArea").html(data);
				document.getElementById('settingBoardArea').style.display='block';
				document.getElementById('settingArea').style.display='block';
			}
		});
	}
	function logout(){
		location.href='<%= request.getContextPath() %>/logout.me';
	}
	
	function changeProfile(){
		location.href = '/triangleView/views/setting/settingPage.jsp';
	}
</script>
</head>


<body>

	<div class="settingListArea">
		<ul>
			<li onclick="changeProfile()"><p>프로필 편집</p></li>
			<li onclick="modifyPwd()"><p>비밀번호 변경</p></li>
			<li onclick="logout()"><p>로그아웃</p></li>
			<li><p>취소</p></li>
		</ul>
	</div>
</body>
</html>