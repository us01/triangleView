<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.chain.triangleView.SNS.SNScheck"%>
	<%
	String snsRan= (String)request.getAttribute("ran");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<title>findId</title>


<!-- w3 혁동 밤길조심해... -->
<link rel="stylesheet" href="/triangleView/css/w3.css" media="screen"
	title="no title" charset="utf-8">
<!-- font awesome -->
<link rel="stylesheet" href="/triangleView/css/font-awesome.min.css"
	media="screen" title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="/triangleView/css/style.css" media="screen"
	title="no title" charset="utf-8">

<script
   src="https://code.jquery.com/color/jquery.color-2.1.2.js"
   integrity="sha256-1Cn7TdfHiMcEbTuku97ZRSGt2b3SvZftEIn68UMgHC8="
   crossorigin="anonymous">
</script>

<!-- CSS -->
<style>

button {
	width: 180px;
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
	border-radius: 5px;
}

.btn-success {
	width: 120px;
	background-color: #3178b1;
	border: none;
	color: #FDEBEC;
	padding: 6px;
	text-align: center;
	text-decoration: none;
	font-size: 14px;
	margin-top: 4px;
	margin-bottom: 4px;
	cursor: pointer;
	border-radius: 5px;
}

.subButton {
	width: 120px;
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
	border-radius: 5px;
}

.w3-card {
	width: 50%;
}

.w3-change {
	display: inline-block;
	width: 300px;
}


</style>
<script>
	$(function(){
		$("#phonenumber").keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	});
	
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("findOut");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}


</script>
</head>

<body>
	<div class="page-header" style="margin-left: 15px;">
		<h3>아이디찾기</h3>
	</div>


	<div class="w3-container" id="phoneNum">
		<p>
			<span class="w3-tag w3-red">등록한 핸드폰 번호로 인증</span>
		</p>
		<div class="input-group" style="text-align: center;">
			<input type="text" class="w3-input w3-change" id="username" placeholder="이름을 입력해 주세요" style="width:300px;">
			<%-- <form action="<%=request.getContextPath()%>/snscheck.sns" method="post"> --%>
				<input type="text" class="w3-input w3-change" id="personalnum" name="phone" placeholder="핸드폰번호를 입력해주세요">
				<input type="submit" class="btn-success" id="sendVertify" value="인증번호 전송"  ></input>
				<p id="p2" style="width:300px; height:50px; border:1px solid red"></p>
		
			<input type="text" name="checkNum" id="checkNum" class="w3-input w3-change" placeholder="인증번호를 입력해주세요"> 
			<span class="input-group-btn">
			<input type="button" class="btn-success" id="vertifyNum" value="인증번호 입력" ></input>
			<label id="pwdresult"></label>
			</span>
			<!-- </form> -->
		</div>
	</div>
	
	<script>
	
	$("#sendVertify").click(function(){
		
		var phone= $("#personalnum").val();
		
		$.ajax({
			url:"snscheck.sns",
			type:"get",
			data:{phone:phone},
			success:function(data){
					 $("#p2").text(data);
					var num = data;
				$("#checkNum").click(function(){
					if ($("#checkNum").val() != num) {
					    $("#pwdresult").html("비밀번호가 일치하지 않습니다").css("color", "red");
					} else {
				        $("#pwdresult").html("비밀번호가 일치합니다").css("color", "green");
					} 			
				});
			},
			error:function(){
						console.log("실패!");
			} 

		}); 

	});
	</script>
	<br>

	<div class="w3-container" style="text-align: center;">
		<input type="button" class="subButton" id="findId" value="아이디찾기"></input>
		<input type="button" class="subButton" onclick="end();" value="취소"></input>
	</div>

	<script>
		function end() {
			document.getElementById('insertMemberTypeArea').style.display = 'none';
			document.getElementById('insertMemberTypeAearArea').style.display = 'none';
		}
	</script> 



</body>
</html>