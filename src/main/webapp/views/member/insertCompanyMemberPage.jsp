<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>companyUser</title>
<!-- w3 혁동 밤길조심해... -->
<link rel="stylesheet" href="/triangleView/css/w3.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="/triangleView/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="/triangleView/css/style.css" media="screen" title="no title" charset="utf-8">
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<style>
	body {
		font-family: '맑은고딕';
	}
	
	display:inline-block ; border: 1px solid black ; input[type=checkbox] {
		-ms-transform: scale(2); /* IE */
		-moz-transform: scale(2); /* FF */
		-webkit-transform: scale(2); /* Safari and Chrome */
		-o-transform: scale(2); /* Opera */
		padding: 10px;
		font-size: 200px;
	}
	
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
	
	.subButton {
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
	
	.w3-card {
		width: 50%;
	}
	
	.w3-change {
		display: inline-block;
		width: 300px;
	}
	
	.image {
		text-align: center;
		display: table-cell;
	}
	
	.JoinForm {
		background: white;
		width: 550px;
	}
</style>
<script>

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image_section').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imgInput").change(function() {
		readURL(this);
	});

	$("#userPwdCheck").change(function() {
		if ($("#userPwd").val() != $(this).val()) {
			$("#pwdresult").html("비밀번호가 일치하지 않습니다").css("color", "red");
			$("#userPwdCheck").val('');
			$(this).select();
			$('#newMember').attr("disabled", true);
		} else {
			$("#pwdresult").html("비밀번호가 일치합니다").css("color", "green");
			$('#newMember').attr("disabled", false);
		}
	})

	$(document).ready(function() {
		$("#age").keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

	});

	$(document).ready(function() {
		$("#businessnum").keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

	});

	$(document).ready(function() {
		$("#businessNo").keyup(function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});

	});

	function sample4_execDaumPostcode() {

		daum.postcode
				.load(function() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
									var extraRoadAddr = ''; // 도로명 조합형 주소 변수

									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraRoadAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraRoadAddr += (extraRoadAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraRoadAddr !== '') {
										extraRoadAddr = ' (' + extraRoadAddr
												+ ')';
									}
									// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
									if (fullRoadAddr !== '') {
										fullRoadAddr += extraRoadAddr;
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
									document
											.getElementById('sample4_roadAddress').value = fullRoadAddr;
									document
											.getElementById('sample4_jibunAddress').value = data.jibunAddress;

									// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
									if (data.autoRoadAddress) {
										//예상되는 도로명 주소에 조합형 주소를 추가한다.
										var expRoadAddr = data.autoRoadAddress
												+ extraRoadAddr;
										document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
												+ expRoadAddr + ')';

									} else if (data.autoJibunAddress) {
										var expJibunAddr = data.autoJibunAddress;
										document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
												+ expJibunAddr + ')';

									} else {
										document.getElementById('guide').innerHTML = '';
									}
								}
							}).open();
				});

	}

	$(document).ready(function() {
		var left = 140
		$('#text_counter').text('작성할 수 있는 글자수: ' + left);

		$('#intro').keyup(function() {

			left = 140 - $(this).val().length;

			if (left < 0) {
				$('#text_counter').addClass("overlimit");
				$('#newMember').attr("disabled", true);
				alert("글자수 초과입니다. 수정해주세요.");
			} else {
				$('#text_counter').removeClass("overlimit");
				$('#newMember').attr("disabled", false);
			}

			$('#text_counter').text('작성할 수 있는 글자수: ' + left);
		});
	});

$(function(){
		
		$("#nickCheck").click(function(){
			var nick = $("#nick").val();
			
			
			$.ajax({

				url:"nickCheck.do",
				data:{nick:nick},
				type:"post",
				success:function(data){
					var num = data;
					if(num == 0){
						
						$("#nickResult").text("사용가능한 닉네임입니다.").css("color", "green");
						$('#newMember').attr("disabled", false);
					}else{
						
						$("#nickResult").text("중복되는 닉네임입니다.").css("color", "red");
						$('#newMember').attr("disabled", true);
					}
				},
				error:function(){
					console.log("서버 전송 실패");
				}
				
			});
			
		});
	});
</script>
</head>

<body>
	<form class="JoinForm" id="form" action="<%=request.getContextPath() %>/insertCompanyMember.me" method="post" encType="multipart/form-data">
		<div id="container" class="w3-container">
			<div class="page-header">
				<h2>기업회원가입</h2>
			</div>

			<div class="w3-card image" style="align: center;">
				<p>
					<span class="w3-tag w3-red">회원이미지</span> <input type='file'
						id="imgInput" name="imgInput" accept="image/gif, image/jpeg, image/png" /> <img
						id="image_section" src="/triangleView/img/icon1.png" width="150px"
						height="150px" alt="이미지 파일이 아닙니다." class="w3-circle" />
				</p>
			</div>

         <div class="w3-container w3-form" id="mail1">
            <p><span class="w3-tag w3-red">아이디(이메일)</span></p>
            <div class="input-group" style="text-align: center;">
               <input type="email" class="w3-input w3-change" id="userId" name="userId"
                  placeholder="아이디(이메일형식)"> <span class="input-group-btn">
			<input type="button" class="btn-success" id="sendVertify" value="인증번호전송"></input>
               </span>
               
                <p id="p2" style="width: 100px; height: 20px;">
                
            </div>
         </div>

	 <div class="w3-container" id="mail2">
            <p><span class="w3-tag w3-red">인증번호입력</span></p>
            <div class="input-group" style="text-align: center;">
               <input type="text" id="checkNum" class="w3-input w3-change" placeholder="인증번호">
		<input type="button" class="btn-success" id="vertifyNum" value="인증번호입력"></input>
		<br><label id="checkVerify"></label>
            </div>
         </div>

			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">기업이름</span>
				</p>
				<div style="text-align: center;">
					<input type="text" class="w3-input w3-change" id="copName" name="copName"
						placeholder="기업이름을 입력해 주세요">
				</div>
			</div>

			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">담당자이름</span>
				</p>
				<div style="text-align: center;">
					<input type="text" class="w3-input w3-change" id="personName" name="personName"
						placeholder="담당자이름을 입력해 주세요">
				</div>
			</div>
			
         <div class="w3-container" id="nickname">
            <p><span class="w3-tag w3-red">닉네임</span></p>
            <div class="input-group" style="text-align: center;">
               <input type="text" class="w3-input w3-change" id="nick" name="nick" 
                  placeholder="닉네임을 입력해 주세요"> 
			<input type="button" class="btn-success" id="nickCheck" value="중복검사"></input>
              <br><label id="nickResult"></label>
            </div>
         </div>

         <div class="w3-container">
            <p><span class="w3-tag w3-red">비밀번호</span></p>
            <div style="text-align: center;">
               <input type="password" class="w3-input w3-change" id="userPwd" name="userPwd" placeholder="비밀번호">
            </div>
         </div>

         <div class="w3-container">
            <p><span class="w3-tag w3-red">비밀번호확인</span></p>
            <div style="text-align: center;">
               <input type="password" class="w3-input w3-change" name="userPwdCheck"
                  id="userPwdCheck" placeholder="비밀번호 확인">
               <br><label id="pwdresult"></label>
            </div>
         </div>

<!-- 			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">담당자메일</span>
				</p>
				<div style="text-align: center;">
					<input type="email" class="w3-input w3-change" id="personalname"
						placeholder="이메일을 입력해주세요">
				</div>
			</div> -->

			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">사업자등록번호</span>
				</p>
				<div style="text-align: center;">
					<input type="text" class="w3-input w3-change" id="businessNo" name="businessNo"
						placeholder="사업자등록번호를 입력해주세요">
				</div>
			</div>

			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">담당자번호</span>
				</p>
				<div style="text-align: center;">
					<input type="text" class="w3-input w3-change" id="phone" name="phone"
						placeholder="담당자전화번호를 입력해주세요">
				</div>
			</div>



         <div class="w3-container">
            <p><span class="w3-tag w3-red">회사주소</span></p>
            <input type="button" onclick="sample4_execDaumPostcode()" 
               value="우편번호 찾기" class="btn-success">
            
            <br> 
            <input type="text" id="sample4_postcode" placeholder="우편번호" class="w3-input w3-change" name="sample4_postcode">
            <br> 
            <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="w3-input w3-change" name="sample4_roadAddress"> 
            <input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="w3-input w3-change" name="sample4_jibunAddress"> 
            <br><span id="guide" style="color: #999"></span><br/>
         </div>



			<div class="w3-container">
            <p>
               <span class="w3-tag w3-red">관심사</span>
            </p>
            <input type="checkbox" class="w3-check" name="category" value="1">자유
            <input type="checkbox" class="w3-check" name="category" value="2">IT/가전
            <input type="checkbox" class="w3-check" name="category" value="3">음악
            <input type="checkbox" class="w3-check" name="category" value="4">뷰티
            <br> 
            <input type="checkbox" class="w3-check" name="category" value="5">스포츠
            <input type="checkbox" class="w3-check" name="category" value="6">금융 
            <input type="checkbox" class="w3-check" name="category" value="7">게임
            <input type="checkbox" class="w3-check" name="category" value="8">취미 
            <input type="checkbox" class="w3-check" name="category" value="9">인생 
            
        	 </div>

			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">회사소개</span>
				</p>
				<textarea id="intro" rows="5" style="width: 490px; resize: none;" name="intro" ></textarea>
				<span id="text_counter"></span>
			</div>

			<div class="w3-container">
				<p>
					<span class="w3-tag w3-red">약관동의</span>
				</p>
				<div data-toggle="buttons">
					<label class="btn btn-primary active"> <input id="agree"
						type="checkbox" class="w3-check"> <!-- autocomplete="off" checked -->
					</label><a href="#">이용약관</a>에 동의합니다.
				</div>
			</div>

			<div class="w3-container" style="text-align: center;">
			 <input type="submit" class="subButton" id="newMember" value="기업회원가입" disabled="disabled"></input>
			<input type="button" class="subButton" onclick="end();" value="가입취소"></input>
			</div>
			<script>
				function end() {
					document.getElementById('insertMemberTypeArea').style.display = 'none';
					document.getElementById('insertMemberTypeAearArea').style.display = 'none';
				}
				
				$("#sendVertify").click(function(){
					var id = $("#userId").val();
					
					$.ajax({
						url : "sendVerify.no",
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
				
				//인증번호 확인
				$("#vertifyNum").click(function(event) {
					event.preventDefault();
					var num2 = $("#checkNum").val() * 1;
					var num1 = $("#p2").text() * 1;
					

					if ($("#p2").text() != num2) {
						$("#checkVerify").text("인증번호가 일치하지 않습니다").css("color", "red");
						$('#newMember').attr("disabled", true);
					} else {
						$("#checkVerify").text("인증번호가 일치합니다").css("color", "green");
						$('#newMember').attr("disabled", false);
					}

				});
			</script>
		</div>
	</form>
</body>
</html>