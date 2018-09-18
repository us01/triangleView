<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<style>
body {
	margin: 30px;
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

#field {
	width: 100px;
	height: 100px;
	border: 1px solid;
}
/* 여기부터 새로운거 */
input[type=file] {
	display: none;
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

.imgs_wrap {
	border: 2px solid #A8A8A8;
	margin-top: 30px;
	margin-bottom: 30px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.imgs_wrap img {
	max-width: 150px;
	margin-left: 10px;
	margin-right: 10px;
}


input:hover + p.arrow_box {
  display: block;
}

.arrow_box {
  display: none;
  position: absolute;
  padding: 16px;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}




</style>

<script type="text/javascript">
	// 이미지 정보들을 담을 배열
	var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
		$("#input_imgs").on("change", putinImg);
		//한줄추가
	});

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');

	}

	/* 추가한것 */
	function putinImg(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:800px; height:500px;'></a>";
						$(".item").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' style='width:250px; height:150px;'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
		/* location.href = "forWrite1/editor.jsp"; */

	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function submitAction() {
		console.log("업로드 파일 갯수 : " + sel_files.length);
		var data = new FormData();

		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);

		if (sel_files.length < 1) {
			alert("한개이상의 파일을 선택해주세요.");
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "./write1_af.php");
		xhr.onload = function(e) {
			if (this.status == 200) {
				console.log("Result : " + e.currentTarget.responseText);
			}
		}

		xhr.send(data);

	}

	function moveEditor() {
		location.href = "forWrite1/editor.jsp"

	}

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
</head>

<body>

	<div class="container">
		<h4>카드형 게시판</h4>
		<hr>

		<h5>제목</h5>
		<div class="input-group">
			<input type="text" class="w3-input" id="title"
				style="width: 490px" placeholder="글제목을 입력해주세요">
		</div>

		<h5>카테고리</h5>
		<div class="input-group">

			<select name="job" class="custom-select">
				<option value="IT" selected="selected">IT</option>
				<option value="뷰티">뷰티</option>
				<option value="일상">일상</option>
				<option value="가전">가전</option>
				<option value="게임">게임</option>
				<option value="여행">여행</option>
				<option value="장소">장소</option>
				<option value="음식">음식</option>
				<option value="자유">자유</option>
			</select>

		</div>

		<div>
			<h5>이미지편집기</h5>
			<div class="changePhoto">
				<a>
				<input type="button" class="my_button" id="newPhoto" value="이미지편집" onclick="moveEditor();">
				<p class="arrow_box">원하시는 이미지 파일을 편집해서 저장후에 업로드 해주세요!</p>
				</a>
			</div>


			<div>
				<h5>게시글 작성</h5>
				<div class="input_wrap">
					<a href="javascript:" onclick="fileUploadAction();"
						class="my_button">파일 업로드</a> <input type="file" id="input_imgs"
						multiple />
				</div>
			</div>

			<div>
				<div class="imgs_wrap">
					<img id="img" />
				</div>
			</div>

			<!-- <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a> -->


			<h5>해쉬태그 작성</h5>
			<div class="hash">
				<input type="text" class="form-control" id="hash" 
				style="width: 490px; height: 50px" placeholder="hashtag를 입력해주세요">
			</div>
			<br>

			<div class="form-group">

				<h5>한마디</h5>
				<textarea id="introduce" rows="5" style="width: 490px; resize: none;"></textarea>
				<br>
				<span id="text_counter"></span>
			</div>

			<div class="container2">
				<div class="btn-holder">
					<button type="submit" class="subButton" id="end" onclick="submitAction();">
						게시물 작성
					</button>
					<button type="submit" class="subButton"
						onclick="javascript:window.close()">
						작성취소
					</button>
				</div>
			</div>
		</div>
		</div>
</body>
</html>