<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.choiseInsertMemberArea {
		width:200px;
		height:115px;
		border-radius:5px;
		position:fixed;
		background:white;
		margin:0 auto;
		padding:10px;
	}
	.choiseInsertMemberArea p {
		text-align:center;
		font-size:13px;
	}
	.divisionLineLeftTop {
		background-color:#efefef;
		height:1px;
		width:60px;
		display:inline-block;
		margin-top:10px;
		float:left;
	}
	.divisionLineRightTop {
		background-color:#efefef;
		height:1px;
		width:60px;
		display:inline-block;
		margin-top:10px;
		margin-bottom:20px;
		float:right;
	}
	.divisionTitle {
		display:inline-block;
		font-size:13px;
		width: 80px;
    	text-align: center;
	}
	.submitBtn {
		width: 199px;
		background-color: #f8585b;
		border: none;
		color: #FDEBEC;
		padding: 6px;
		text-align: center;
		text-decoration: none;
		font-size: 14px;
		margin-top: 4px;
		margin-bottom: 4px;
		cursor: pointer;
		border-radius:5px;
	}
</style>
<script>
	function insertGeneralMemberPageMove(){
		document.getElementById('insertMemberTypeArea').style.display = 'none';
		$(".insertMemberTypeArea").css("margin-left", "-275px");
		$.ajax({
			url : "/triangleView/views/member/insertGeneralMemberPage.jsp",
			data : "html",
			success : function(data) {
				$(".insertMemberTypeArea").html(data);
				document.getElementById('insertMemberTypeAearArea').style.display = 'block';
				document.getElementById('insertMemberTypeArea').style.display = 'block';
			}
		});
	}
	
	function insertCompanyMemberPageMove(){
		document.getElementById('insertMemberTypeArea').style.display = 'none';
		$(".insertMemberTypeArea").css("margin-left", "-275px");
		$.ajax({
			url : "/triangleView/views/member/insertCompanyMemberPage.jsp",
			data : "html",
			success : function(data) {
				$(".insertMemberTypeArea").html(data);
				document.getElementById('insertMemberTypeAearArea').style.display = 'block';
				document.getElementById('insertMemberTypeArea').style.display = 'block';
			}
		});
	}
</script>
</head>
<body>
	<div class="choiseInsertMemberArea">
		<div class="divisionLineLeftTop"></div>
		<div class="divisionTitle">가입 종류</div>
		<div class="divisionLineRightTop"></div>
		<input class="submitBtn" type="button" value="일반회원" onclick="insertGeneralMemberPageMove()">
		<input class="submitBtn" type="button" value="기업회원" onclick="insertCompanyMemberPageMove()">
	</div>
</body>
</html>