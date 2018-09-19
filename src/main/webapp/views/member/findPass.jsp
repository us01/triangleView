<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>findPass</title>

	<!-- w3 혁동 밤길조심해... -->
	<link rel="stylesheet" href="/triangleView/css/w3.css" media="screen" title="no title" charset="utf-8">
    <!-- font awesome -->
    <link rel="stylesheet" href="/triangleView/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="/triangleView/css/style.css" media="screen" title="no title" charset="utf-8">
    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    
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

.layer {
	display:none;
}

</style>
<script>
/*             <!-- 핸드폰번호는 숫자만 입력받게함 --> */

	$(document).ready(function() {
		$("#personalnum").keyup(function() {
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

	$(document).ready(function() {

		/* 라디오 버튼 변경시 이벤트 */
		$("input[name='findOut']:radio").change(function() {

			var findOut = this.value;

			if (findOut == "1") {
				$("#email").hide();
				$("#phone").show();
			} else if (findOut == "2") {
				$("#email").show();
				$("#phone").hide();
			}
		});
	});
</script>
</head>
<body>
	<div id="all" class="all">
	<div class="page-header" style="margin-left: 15px;">
		<h3>비밀번호찾기</h3>
	</div>

	<div class="w3-container" id="insertId">
		<p>
			<span class="w3-tag w3-red">아이디를 입력해주세요</span>
		</p>
		<div class="input-group" style="text-align: center;">
			<input type="text" class="w3-input w3-change" id="userId" placeholder="아이디 입력해 주세요" style="width:300px;"> 
			<button class="btn btn-success">아이디인증</button>
		</div>
	</div>

	<br>

		<div class="w3-container">
			<label>인증방법을 선택해주세요</label> <br> <input name="findOut"
				type="radio" value="1" onclick="doOpenCheck(this);">등록한 핸드폰 번호로 인증 <br />
			<div class="layer" id="phone">
				<input type="text" class="w3-input w3-change" id="InputName" placeholder="이름" style="width: 150px;"><br> 
					<input type="tel" class="w3-input w3-change" id="personalnum" name="personalnum" placeholder="- 없이 입력해 주세요" style="width: 300px;"> 
					<button class="btn btn-success" id="sendVertify1">인증번호전송</button>
					<p id="p2" style="width: 100px; height: 20px; /*display:none;  */"></p>
					<br> 
			<input type="text" name="checkNum" id="checkNum" class="w3-input w3-change" placeholder="인증번호를 입력해주세요"  style="width: 300px;"> 
				 <label id="pwdresult"></label><br>
				<input type="button" class="btn-success" id="vertifyNum" value="인증번호 입력" ></input>
			</div>

			<input name="findOut" type="radio" value="2"
				onclick="doOpenCheck(this);">등록한 이메일로 인증 <br />
			<div class="layer" id="email">
				<input type="text" class="w3-input w3-change" id="InputName" placeholder="이름" style="width: 150px;"><br> 
				<input type="email" class="w3-input w3-change" id="InputEmail" placeholder="아이디(이메일형식)" style="width: 300px;"> 
                <button class="btn btn-success"  id="sendVertify2">인증번호 전송</button>
				<br> <input type="text" class="w3-input w3-change" id="InputEmail" placeholder="인증번호입력" style="width: 300px;">
				<br>
			</div>
		</div>
		<br>

			<p id="p3" style="width: 100px; height:20px; /* display:none; */"></p>
		<div class="w3-container" style="text-align: center;">
			<input type="button" class="subButton" id="findPass" value="비밀번호찾기" disabled="disabled"></input>
			<input type="button" class="subButton" onclick="end();" value="취소"></input>

			<script>
				function end() {
					document.getElementById('insertMemberTypeArea').style.display = 'none';
					document.getElementById('insertMemberTypeAearArea').style.display = 'none';
				}
				//이메일인증
				$("#sendVertify2").click(function(){
					var id = $("#InputEmail").val();
					
					$.ajax({
						url : "sendPass.no",
						type : "post",
						data : {
							id : id
						},
						success : function(data) {
							console.log("성고오오오오옹!");
							$("#p2").text(data);
							var num = data;
							
						},
						error : function() {
							console.log("실패ㅠㅠ");
						}

					});
				});

				$("#findPass").click(function(){
					var phone = $("#personalnum").val();
					<%-- location.href="<%=request.getContextPath()%>/findId.no?phone="+ phone; --%>
					
					$.ajax({
						url : "findId.no",
						type : "post",
						data : {
							phone : phone
						},
						success : function(data) {
						/* 	$("#p3").text(data);
							var num = data;
							var resultText = "아이디 : " + num;
							alert(resultText);
							$("#p4").val(resultText).css("color", "red").css("font-size","20px"); */
							 $("#p3").text(data).css("color", "red").css("font-size","20px"); 
							
						},
						error : function() {
							console.log("실패!");
						}

					});
				});

				$("#sendVertify1").click(function() {

					var phone = $("#personalnum").val();

					$.ajax({
						url : "snscheck.sns",
						type : "post",
						data : {
							phone : phone
						},
						success : function(data) {
							$("#p2").text(data);
							var num = data;
						},
						error : function() {
							console.log("실패!");
						}

					});

				});

				$("#vertifyNum").click(function(event) {
					event.preventDefault();
					var num2 = $("#checkNum").val() * 1;
					var num1 = $("#p2").text() * 1;

					if ($("#p2").text() != num2) {

						$("#pwdresult").text("인증번호가 일치하지 않습니다").css("color", "red");
						$('#findPass').attr("disabled", true);
					} else {
						$("#pwdresult").text("인증번호가 일치합니다").css("color", "green");
						$('#findPass').attr("disabled", false);

					}

				});
			</script>
			<!-- <button type="submit" class="subButton" onclick="javascript:window.close()">취소 </button> -->
		</div>
	</div>


</body>
</html>