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

.button1{
	background: url(/triangleView/img/writeForm/cardReview.png) 0 0 no-repeat;
	background-size: 200px;
	width: 200px;
	height: 200px;
	display: inline-block;
	/* position: absolute;
	top: 0;
	left: 30px; */
	border: 1px solid white;
	left: 120px;
    top: 50px;
}

.button2 {
		background: url(/triangleView/img/writeForm/textReview.png) 0 0 no-repeat;
	background-size: 200px;
	width: 200px;
	height: 200px;
	display: inline-block;
	/* position: absolute;
	top: 0;
	left: 30px; */
	border: 1px solid white;
	left: 320px;
    top: 50px;
} 
.button3 {
		background: url(/triangleView/img/writeForm/movieReview.png) 0 0 no-repeat;
	background-size: 200px;
	width: 200px;
	height: 200px;
	display: inline-block;
	/* position: absolute;
	top: 0;
	left: 30px; */
	border: 1px solid white;
	left: 520px;
    top: 50px;
} 

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
<script>
function write1PageMove() {
	/* window.open('/triangleView/views/writeForm/write1.jsp', '_blank', 'width=705 height=435 left=255px top=155px') */
	location.href="/triangleView/views/writeForm/write1.jsp";
	
/* 	$(".writeForm").append(".reviewListArea")
 	$(".reviewListArea").css("display", "none");
	$.ajax({
		url : "/triangleView/views/writeForm/write1.jsp",
		data : "html",
		success : function(data) {
			$(".uploadViewAear").html(data);
			
			$(".uploadViewAear").css("margin-left","-10px");
			$(".writeForm").css("margin-left","-210px");
			$(".writeForm").css("width","700px");
			//document.getElementById('uploadViewAear').style.display = 'block';
			//document.getElementById('uploadViewAearArea').style.display = 'block';
		}
	});  */
}

function write2PageMove() {
	/* window.open('/triangleView/views/writeForm/write2.jsp', '_blank', 'width=1000 height=500 left=150px top=50px') */
	location.href="/triangleView/views/writeForm/write2.jsp";
}
function write3PageMove() {
	/* window.open('/triangleView/views/writeForm/write3.jsp', '_blank', 'width=1000 height=500 left=150px top=50px') */
	location.href="/triangleView/views/writeForm/write3.jsp";
} 

</script>
<body>

	<div class="w3-modal-content" style="text-align:center; height:300px; width:700px; background-color: white;" id="settingArea" >
	
		<p style="text-align: center; font-weight: bold; margin: 25px 0 10px; font-size: 18px;">게시글 형태를 선택하세요</p>
		<div class="buttonFreind">
			<button id="write1" class="button button1" onclick="write1PageMove()">
			</button>
			<button id="write2" class="button button2" onclick="write2PageMove()">
			</button>
			<button id="write3" class="button button3" onclick="write3PageMove()">
			</button>
		</div>	
	</div>
	
<%-- 	<div id="modal-cont-area1" style="display:none">
		<%@ include file="/views/writeForm/write1.jsp" %>
	</div>
	<div id="modal-cont-area2" style="display:none">
		<%@ include file="/views/writeForm/write2.jsp" %>
	</div>
	<div id="modal-cont-area3" style="display:none">
		<%@ include file="/views/writeForm/write3.jsp" %>
	</div>  --%>
	
<!-- 	<script>
		$(function(){
			$('#write1').click(function(){
				$('.w3-modal-content').css('display','none');
				$('#modal-cont-area1').css('display','block');
				$('.uploadViewAear').css('margin-left', '-427.5px');
			});
			$('#write2').click(function(){
				$('.w3-modal-content').css('display','none');
				$('#modal-cont-area2').css('display','block');
				$('.uploadViewAear').css('margin-left', '-427.5px');
			});
			$('#write3').click(function(){
				$('.w3-modal-content').css('display','none');
				$('#modal-cont-area3').css('display','block');
				$('.uploadViewAear').css('margin-left', '-427.5px');
			});
		})
	</script>  -->
</body>
</html>