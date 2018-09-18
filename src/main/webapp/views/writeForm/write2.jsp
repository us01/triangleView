<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<meta charset="utf-8">
<!-- w3 혁동 밤길조심해... -->
<link rel="stylesheet" href="../../css/w3.css" media="screen"
	title="no title" charset="utf-8">
<!-- font awesome -->
<link rel="stylesheet" href="../../css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="../../css/style.css" media="screen"
	title="no title" charset="utf-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

  <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="forWrite2/css/froala_editor.css">
  <link rel="stylesheet" href="forWrite2/css/froala_style.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/code_view.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/colors.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/emoticons.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/image_manager.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/image.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/line_breaker.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/table.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/char_counter.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/video.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/fullscreen.css">
  <link rel="stylesheet" href="forWrite2/css/plugins/file.css">

  <link rel="stylesheet" href="forWrite2/css/themes/red.css">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

  <style>
body {
	text-align: center;
}

section {
	width: 81%;
	margin: auto;
	text-align: left;
}

.container2 {
	justify-content: space-between;
	flex-direction: column;
	height: 100vh;
	display: flex;
}

.container2 .btn-holder {
	justify-content: flex-end;
	display: flex;
}


</style>
</head>
<body>
<form class="write2Form" id="form" action="<%=request.getContextPath() %>/insertWrite2.bo" method="post" > 
	<div class="container">
		<h4>글쓰기 게시판</h4>
		<hr>
		<h5>제목</h5>
		<div class="input-group">
			<input type="text" class="form-control" id="title" name="title"
				style="width: 510px" placeholder="글제목을 입력해주세요">
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
		<section id="editor">
      		<textarea id='edit' name="edit" style="margin-top: 30px;">


      	</textarea>
  		</section>

		<h5>해쉬태그 작성</h5>
		<div class="hash">
			<input type="text" class="form-control" id="hash" name="hash"
				style="width: 510px; height: 50px" placeholder="hashtag를 입력해주세요">
		</div>
		<br>


		<div class="form-group">
			
			<h5>한마디</h5>
			<textarea id="introduce" name="introduce" rows="5" style="width: 510px"></textarea>
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


		<div class="container2">
			<div class="btn-holder">
				<button type="submit" class="btn btn-info" id="end" name="end">
					게시물 작성<i class="fa fa-check spaceLeft"></i>
				</button>
				<button type="reset" class="btn btn-warning"
					onclick="javascript:window.close()">
					작성취소<i class="fa fa-times spaceLeft"></i>
				</button>
			</div>
		</div>
	</div>
	</form> 



<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/froala_editor.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/align.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/code_beautifier.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/code_view.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/colors.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/draggable.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/emoticons.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/font_size.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/font_family.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/image.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/file.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/image_manager.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/line_breaker.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/link.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/lists.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/paragraph_format.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/paragraph_style.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/video.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/table.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/url.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/entities.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/char_counter.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/inline_style.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/save.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/fullscreen.min.js"></script>
  <script type="text/javascript" src="forWrite2/js/plugins/quote.min.js"></script>

  <script>
    $(function(){
      $('#edit').froalaEditor({
        theme: 'red'
      })
    });
  </script>
</body>
</html>
