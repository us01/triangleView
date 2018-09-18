<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	%>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>YouTube</title>



<!-- w3 혁동 밤길조심해... -->
<link rel="stylesheet" href="../../css/w3.css" media="screen"
	title="no title" charset="utf-8">
<!-- font awesome -->
<link rel="stylesheet" href="../../css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../css/style.css" media="screen"
	title="no title" charset="utf-8">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

.container2 .btn-holder {
	justify-content: flex-end;
	display: flex;
}

body {
	margin: 30px;
}

.youtubeWrap {
	position: relative;
	width: 100%;
	padding-bottom: 56.25%;
}

.youtubeWrap iframe {
	position: absolute;
	width: 100%;
	height: 100%;
}

.my_button {
	display: inline-block;
	width: 150px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 10px;
	border :0;
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
	margin-left: 5px;
}

.area {
	width: 500px;
}
</style>


</head>


<body>
<form class="write2Form" id="form" action="<%=request.getContextPath() %>/insertWrite3.bo" method="post" > 
	<h4>동영상 게시판</h4>
	<hr>
	<h5>제목</h5>
	<div class="input-group">
		<input type="text" class="w3-input" id="title" name="title"
			style="width: 490px" placeholder="글제목을 입력해주세요">
	</div>
	<h5>카테고리</h5>
	<div class="input-group">
		<select name="categoryCheck" class="form-control">
				<option value="1" name="category" selected="selected">자유</option>
				<option value="2" name="category">IT/가전</option>
				<option value="3" name="category">음악</option>
				<option value="4" name="category">뷰티</option>
				<option value="5" name="category">스포츠</option>
				<option value="6" name="category">금융 </option>
				<option value="7" name="category">게임</option>
				<option value="8" name="category">취미</option>
				<option value="9" name="category">인생</option>
		</select>

	</div>

	<h5>게시글 작성</h5>

	<div class="layer" id="youtubeUpload">
		<div class="input-group">
		<label>URL주소를 입력해주세요</label>
			<input type="text" id="videoUpload" name="videoUpload" class="form-control" style="width:490px;" onfocus="this.select()" > 
				<br>
				<input type="button" id="btn_test" value="등록하기">
			</span>
		</div>
	</div>

	<br>


	<h5>미리보기</h5>
	<div style="text-align:center;">
		<iframe id="video_test" name="video_test" width="424" height="238" src="" frameborder="0"
		 value="hoo" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>


	<script type="text/javascript">
        $("#btn_test").click(function(){
            //주소값 추출
        	var link = $("#videoUpload").val();
            //링크영상값 추출
            var check = "embed";
          	//링크영상에 embed문자가 있는지 체크
          	var check2= "youtu.be";       
          	//링크영상에 youtu.be문자가 있는지 추출
          	var result = "";
          	
		if (link.indexOf(check) != -1) {
			  	result = $("#video_test").attr("src", link);
				$("#video_test").attr("src", link);
			} else {
				if (link.indexOf(check2) != -1) {
					var cut = link.split("be/");
					result = "https://www.youtube.com/embed/" + cut[1];
					$("#video_test").attr("src", result);
			
				} else {
					var cut = link.split("=");
					result = "https://www.youtube.com/embed/" + cut[1];
					$("#video_test").attr("src", result);

				}

			}
		});
        
    
        //링크는 세가지 형태
        //https://www.youtube.com/watch?v=zT8IpKMjZqA
        //https://www.youtube.com/embed/NIDcZJTJ3N0
        //https://youtu.be/JD42_J2FaoU
	</script>

	<h5>해쉬태그 작성</h5>
	<div class="hash">
		<input type="text" class="form-control" id="title" name="hash"
			style="width: 490px; height: 50px" placeholder="hashtag를 입력해주세요">
	</div>

	<br>

	<div class="form-group">
		<!-- <label for="introduce">한마디</label> -->
		<h5>한마디</h5>
		<textarea id="introduce" name="introduce" rows="5" style="width: 490px; resize:none;" ></textarea>
		<span id="text_counter"></span>
	</div>
	<!-- 140자 이상의 소개는 가입불가능 -->
	<script>
				$(document).ready(function() {
					var left = 100
					$('#text_counter').text('작성할 수 있는 글자수: ' + left);

					$('#introduce').keyup(function() {

						left = 100 - $(this).val().length;

						if (left < 0) {
							$('#text_counter').addClass("overlimit");
							$('#end').attr("disabled", true);
						} else {
							$('#text_counter').removeClass("overlimit");
							$('#end').attr("disabled", false);
						}

						$('#text_counter').text('작성할 수 있는 글자수: ' + left);
					});
				});
	</script>

	<br>

	<div class="container2">
		<div class="btn-holder">
			<button type="submit" class="subButton" name="end" id="end">게시물 작성</button>
			<button type="reset" class="subButton"
				onclick="javascript:window.close()">작성취소</button>
		</div>
	</div>
</form>

</body>
</html>