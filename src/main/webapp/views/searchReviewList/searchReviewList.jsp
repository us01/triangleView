<%@page import="com.chain.triangleView.member.member.vo.Member"%>
<%@page import="com.chain.triangleView.review.review.vo.Review"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Review> searchReviewList = (ArrayList<Review>)request.getAttribute("searchReviewList");
	String searchReviewData = "default";

	if(request.getAttribute("searchReviewData") != null){
		searchReviewData = (String)request.getAttribute("searchReviewData");
		System.out.println("1. 검색어 초기화 됐냐 ==========================" + searchReviewData);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/triangleView/css/w3.css">
<title></title>
<style>
	.viewForm{
		width:210px;
		height:287px;
		margin:7px;
		margin-top:8px;
		position:relative;
		display:inline-block;
		float:left;
		border:1px solid #E5E5E5;
		background:white;
	}
	.viewMainImage img{
		width:210px;
		height:210px;
		cursor:pointer;
	}
	.formType{
		top:0px;
		left:10px;
		position:absolute;
		z-index:2;
	}
	.viewTitle {
		width:100%;
		display:inline-block;
		text-align: left;
	}
	.viewTitle p {
		font-size:13px;
		font-weight:bold;
		overflow:hidden;
		white-space:nowrap;
		text-overflow:ellipsis;
		padding-left:5px;
		margin-top:5px;
		margin-bottom:5px;
	}
	.viewSearchImage, .viewLikeImage{
		width:50%;
		float:left;
		display:table;
		text-align:center;
	}
	.viewSearchImage p, .viewLikeImage p{
		display:table-cell;
		font-size:7px;
		font-weight: bold;
		text-align:left;
		vertical-align:middle;
		margin:0px;
		color:darkgray;
	}
	.reviewWriter {
		text-align:right;
		font-size:11px;
		font-weight:bold;
		padding-top:31px;
	}
	.reviewWriter p{
		display:inline;
		padding-right:3px;
		font-size:12px;
		font-weight:bold;
		margin:0px;
		cursor:pointer;
	}
	.formArea {
		z-index: 300;
   		position: fixed;
   		left: 50%;
   		margin-left:-500px;
    	top: 110px;
	}
	.reviewInfoArea {
		margin-top:9px;
		display: flex;
		border: 1px solid #E5E5E5;
		background:white;
		border-radius: 10px;
	}
	.graphArea {
		width:50%;
	}
	.cloudTageArea {
		width:50%;
	}
	.canvasArea {
		display:inline-block;
	  	text-align: center;
	  	color: #bdc3c7;
	}
	@media all and (max-width:768px){
		.centerContent { 
			width:100%; 
			display:inline-table;
		}
	}
</style>
<script>
	function loadReivewForm(rwNo, rwContentType){
		$.ajax({
			url : "/triangleView/loadOneReviewForm.rf",
			type : "GET",
			data : {
				'rwNo':rwNo,
				'rwContentType':rwContentType
			},
			success : function(data) {
				$(".formArea").html(data);
				document.getElementById('formAreaArea').style.display = 'block';
				document.getElementById('formArea').style.display = 'block';
			}
		});
	}

	function formDisplayNone() {
		document.getElementById('formArea').style.display = 'none';
		document.getElementById('formAreaArea').style.display = 'none';
	}
	
	$(function(){
		
		var searchReviewData = '<%=searchReviewData%>';
		console.log('<%=searchReviewData%>');
		$.ajax({
			url : "<%=request.getContextPath()%>/crolling",
			type : "GET",
			data : {searchReviewData:searchReviewData},
			success : function(data) {
					
				var myColor = ["#39ca74","#e54d42","#f0c330"];
				var myData = [data["good"], data["soso"], data["bad"]];
				var myLabel = ["긍정","부정","보통"];
				
				function getTotal()	{
				  var myTotal = 0;
				  for (var j = 0; j < myData.length; j++) {
				    myTotal += (typeof myData[j] == 'number') ? myData[j] : 0;
				  }
				  return myTotal;
				}
				
				function plotData() {
				  var canvas;
				  var ctx;
				  var lastend = 0;
				  var myTotal = getTotal();
				  var doc;
				  canvas = document.getElementById("canvas");
				  var x = (canvas.width)/2.2;
				  var y = (canvas.height)/2.0;
				  var r = 75;
				  
				  ctx = canvas.getContext("2d");
				  ctx.clearRect(0, 0, canvas.width, canvas.height);
				
				  for (var i = 0; i < myData.length; i++) {
				    ctx.fillStyle = myColor[i];
				    ctx.beginPath();
				    ctx.moveTo(x,y);
				    ctx.arc(x,y,r,lastend,lastend+(Math.PI*2*(myData[i]/myTotal)),false);
				    ctx.lineTo(x,y);
				    ctx.fill();
				    
				    // Now the pointers
				    ctx.beginPath();
				    var start = [];
				    var end = [];
				    var last = 0;
				    var flip = 0;
				    var textOffset = 0;
				    var precentage = (myData[i]/myTotal)*100;
				    end = getPoint(x,y,r+10,(lastend+(Math.PI*2*(myData[i]/myTotal))/2));
				    start = getPoint(x,y,r-30,(lastend+(Math.PI*2*(myData[i]/myTotal))/2));
				    if(start[0] <= x)
				    {
				      flip = -1;
				      textOffset = -80;
				    }
				    else
				    {
				      flip = 1;
				      textOffset = 10;
				    }
				    ctx.moveTo(start[0],start[1]);
				    ctx.lineTo(end[0],end[1]);
				    ctx.lineTo(end[0]+80*flip,end[1]); //글자 아래 라인 길이
				    ctx.strokeStyle = "#E5E5E5";
				    ctx.lineWidth = 2; //글자 아래 라인 두께
				    ctx.stroke();
				    // The labels
				    ctx.font="12px 맑은고딕";
				    ctx.fillText(myLabel[i]+" "+precentage.toFixed(2)+"%",end[0]+textOffset,end[1]-4); 
				    // Increment Loop
				    lastend += Math.PI*2*(myData[i]/myTotal);
				  }
				}
				// Find that magical point
				function getPoint(c1,c2,radius,angle) {
				  return [c1+Math.cos(angle)*radius,c2+Math.sin(angle)*radius];
				}
				// The drawing
				plotData();
			},
			beforeSend: function () {
				$("#canvas").css({"display":"none"});
				$("#loading").css({"display":"block"});
				
            },
            complete: function () {
            	$("#canvas").css({"display":"block"});
				$("#loading").css({"display":"none"});
            }
		});
	});
	
	function goHome(word){
		var goUser = $(word).attr("id");
		var goMe = '';
		<% if(loginUser != null){ %>
			goMe = '<%= loginUser.getUserId() %>';
		<% } %>
		
		if(goMe != goUser){
			location.href='<%= request.getContextPath()%>/userHome?goUser=' + goUser;
		}else{
			location.href='<%= request.getContextPath()%>/myHome';
		}
	}
</script>
</head>
<body>
	<div class="centerContent">
		<div class="reviewInfoArea">
			<div class="graphArea">
				<div class="canvasArea">
				  <img id="loading" src="/triangleView/img/main/data.gif" width="250" height="250">
				  <canvas id="canvas" width="300" height="240" display="none"></canvas>
				</div>
			</div>
			<div class="cloudTageArea"></div>
		</div>
		<% for(int i = 0; i <= searchReviewList.size()-1; i++){ %>
			<div class="viewForm">
				<div class="viewMainImage">
					<img src="/triangleView/img/test3.jpg" onclick="loadReivewForm(<%= searchReviewList.get(i).getRwNo() %>, <%= searchReviewList.get(i).getRwContentType() %>)">
				</div>
				<div class="formType">
					<% if(searchReviewList.get(i).getRwContentType() == 0){ %>
						<img src="/triangleView/img/viewList/text.png">
					<% }else if(searchReviewList.get(i).getRwContentType() == 1){ %>
						<img src="/triangleView/img/viewList/card.png">
					<% }else{ %>
						<img src="/triangleView/img/viewList/video.png">
					<% } %>
				</div>
				<div class="viewTitle">
					<p><%= searchReviewList.get(i).getRwTitle() %></p>
				</div>
				<div class="viewSearchImage">
					<img src="/triangleView/img/viewList/views.png">
					<p><%= searchReviewList.get(i).getRwCount() %></p>
				</div>
				<div class="viewLikeImage">
					<img src="/triangleView/img/viewList/like.png">
					<p><%= searchReviewList.get(i).getLikeCount() %></p>
				</div>
				<div class="reviewWriter">
					@ <p onclick="goHome(this)" id="<%= searchReviewList.get(i).getUserId() %>"><%= searchReviewList.get(i).getNick() %></p>
				</div>
			</div>
		<% } %>
	</div>
	<div id="formArea" class="formArea"></div>
	<div id="formAreaArea" class="w3-modal" onclick="formDisplayNone();"></div>
</body>
</html>