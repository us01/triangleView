<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
<form class="JoinForm" id="form" name="testGo" action="" method="post" encType="multipart/form-data">

      <div id="container" class="w3-container">
         <div class="page-header">
            <h2 style="text-align:center;"><img src="/triangleView/img/member/reviewer.png" style="width:80px; margin-top: -15px;">일반회원가입</h2>
         </div>

         <div class="profileImage" style="align:center;">
            <p style="text-align: -webkit-left;">
               <span class="w3-tag" style="margin-left:3px;background-color: white; color: black; margin-top: 57px;">프로필 이미지</span> 
               <input type='file' id="imgInput" name="imgInput" accept="image/gif, image/jpeg, image/png" style="margin-left: 220px; visibility: hidden;" /> 
               <label for="imgInput" class="ico_test1" id="icon_test1">
               <img id="image_section" src="/triangleView/img/member/profile.png" width="150px" height="150px" alt="이미지 파일이 아닙니다." class="w3-circle"
               style="margin-top: 30px; margin-left: -3px;" />
               </label>
            </p>
         </div>

  
  

         <div class="w3-container" id="nickname">
            <p><span class="w3-tag" style="background-color: white; color:black;margin-top: 20px;">닉네임</span></p>
            <div class="input-group" style="text-align: center;">
               <input type="text" class="w3-input w3-change" id="nick" name="nick" 
                  placeholder="닉네임을 입력해 주세요" style="width:270px;"> 
			<input type="button" class="btn-success" id="nickCheck" value="중복검사" style="margin-top:-50px; margin-left: 399px;"></input>
               <br><label id="nickResult"></label>
            </div>
         </div>


         <div class="w3-container">
            <p><span class="w3-tag" style="background-color: white; color:black;margin-top: 20px;">비밀번호</span></p>
            <div style="text-align: center;">
               <input type="password" class="w3-input w3-change" 
               id="userPwd" name="userPwd" placeholder="비밀번호" style="width:270px;">
            </div>
         </div>

         <div class="w3-container">
            <p><span class="w3-tag" style="background-color: white; color:black;">비밀번호확인</span></p>
            <div style="text-align: center;">
               <input type="password" class="w3-input w3-change" name="userPwdCheck"
                  id="userPwdCheck" placeholder="비밀번호 확인" style="width:270px; margin-top: 20px;">
               <br><label id="pwdresult"></label>
            </div>
         </div>


			<div class="w3-container">
				<p>
					<span class="w3-tag" style="background-color: white; color:black;">핸드폰번호</span>
				</p>
				<div style="text-align: center;">
					<input type="text" class="w3-input w3-change" id="phone" name="phone"
						placeholder="핸드폰번호를 입력해주세요" style="width:270px; margin-top: 20px;">
				</div>
			</div>
			
         <div class="w3-container">
            <p>
               <span class="w3-tag" style="background-color: white; color:black;">나이</span>
            </p>
            <div style="text-align: center;">
               <input type="text" class="w3-input w3-change" id="age" 
               name="age" placeholder="만 나이를 입력해 주세요" style="width:270px; margin-top: 20px;">
            </div>
         </div>

         <div class="w3-container">
            <p>
               <span class="w3-tag" style="background-color: white; color:black;">성별</span>
            </p>
            <div style="text-align: center;">
               <input name="gender" type="radio" class="w3-radio" value="M"
                  onclick="doOpenCheck(this);">남자 <input name="gender"
                  type="radio" class="w3-radio" value="F"
                  onclick="doOpenCheck(this);">여자 <br />
            </div>
         </div>

             <div class="w3-container" style="margin-top: 20px;">
            <p><span class="w3-tag" style="background-color: white; color:black; margin-top: -20px;">주소</span></p>
            <input type="button" onclick="sample4_execDaumPostcode()" 
               value="우편번호 찾기" class="btn-success" style="width: 120px;">
            
            <br> 
            <input type="text" id="sample4_postcode" placeholder="우편번호" 
            class="w3-input w3-change" name="sample4_postcode" style="width:300px;">
            <br> 
            <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="w3-input w3-change" name="sample4_roadAddress"> 
            <input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="w3-input w3-change" name="sample4_jibunAddress"> 
            <br><span id="guide" style="color: #999"></span><br/>
         </div>


         <div class="w3-container">
            <p>
               <span class="w3-tag" style="background-color: white; color:black; margin-top: -30px; margin-left: -5px;">관심사</span>
            </p>
            <input type="checkbox" class="w3-check" name="category" value="1">자유
            <input type="checkbox" class="w3-check" name="category" value="2">IT/가전
            <input type="checkbox" class="w3-check" name="category" value="3">음악
            <input type="checkbox" class="w3-check" name="category" value="4">뷰티 
            <input type="checkbox" class="w3-check" name="category" value="5">스포츠
            <br>
            <input type="checkbox" class="w3-check" name="category" value="6">금융 
            <input type="checkbox" class="w3-check" name="category" value="7">게임&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" class="w3-check" name="category" value="8">취미 
            <input type="checkbox" class="w3-check" name="category" value="9">인생 
            
         </div>

         <div class="w3-container" style="margin-top: 20px;">
            <p>
               <span class="w3-tag" style="background-color: white; color:black;margin-top: -25px; margin-left: -5px;">자기소개</span>
            </p>
            <textarea id="intro" rows="5" style="width: 490px; resize: none;" name="intro" ></textarea>
            <!-- <span id="text_counter"></span> -->
         </div>

         <div class="w3-container" style="text-align: center; height: 40px;">
            <input type="button" class="subButton" id="newMember" value="일반회원가입" disabled="disabled" onclick="youHaveTo()"></input>
			<input type="reset" class="subButton" onclick="end();" value="가입취소"></input>
         </div>


</body>
</html>