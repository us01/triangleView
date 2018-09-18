<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<link rel="stylesheet" href="/triangleView/css/w3.css">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body {
	font-family: 'Roboto';
}
</style>
<style>
.button {
	background-color: #db8e1f;
	border: none;
	color: white;
	padding: 80px 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 18px;
	margin: 4px 2px;
	cursor: pointer;
	width: 200px;
	height: 200px;
}

.button2 {
	background-color: #008CBA;
} /* Blue */
.button3 {
	background-color: #f44336;
} /* Red */

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 420px; /* 80%; */
	/* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#settingArea {
	z-index: 300;
	position: absolute;
	left: 30%;
	margin-left: -175px;
	top: -25px;

}
</style>

<body>

	<div class="w3-modal-content" style="text-align: center;" id="settingArea">
		<p style="text-align: center">게시글 형태를 선택하세요</p>
		<button id="member" class="button" onclick="window.open('/triangleView/views/writeForm/write1.jsp', '_blank', 
		'width=1000 height=500 left=150px top=50px')">
			카드형 <br>게시물 작성
		</button>
		<button id="company" class="button button2"onclick="window.open('/triangleView/views/writeForm/write2.jsp', '_blank', 
		'width=1000 height=500 left=150px top=50px')">
			텍스트 <br>게시물 작성
		</button>
		<button id="company" class="button button3" onclick="window.open('/triangleView/views/writeForm/write3.jsp', '_blank', 
		'width=1000 height=500 left=150px top=50px')">
			동영상 <br>게시물 작성
		</button>
	</div>
</body>
</html>