<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	<title>miniPaint - image editor</title>
	<meta name="description" content="miniPaint is free online image editor using HTML5. Edit, adjust your images, add effects online in your browser, without installing anything..." />
	<meta name="keywords" content="photo, image, picture, transparent, layers, free, edit, html5, canvas, javascript, online, photoshop, gimp, effects, sharpen, blur, magic wand tool, clone tool, rotate, resize, photoshop online, online tools, tilt shift, sprites, keypoints" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="shortcut icon" href="images/favicon.png?v2" />
	<!-- Google -->
	<meta itemprop="name" content="miniPaint"/>
	<meta itemprop="description" content="miniPaint is free online image editor using HTML5. Edit, adjust your images, add effects online in your browser, without installing anything..." />
	<meta itemprop="image" content="https://viliusle.github.io/miniPaint/images/preview.jpg" />
	<!-- Twitter -->
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content="miniPaint" />
	<meta name="twitter:description" content="miniPaint is free online image editor using HTML5. Edit, adjust your images, add effects online in your browser, without installing anything..." />
	<meta name="twitter:image" content="https://viliusle.github.io/miniPaint/images/preview.jpg" />
	<meta name="twitter:image:alt" content="miniPaint is free online image editor using HTML5. Edit, adjust your images, add effects online in your browser, without installing anything..." />
	<!-- Facebook, Pinterest -->
	<meta property="og:title" content="miniPaint" />
	<meta property="og:type" content="article" />
	<meta property="og:url" content="https://viliusle.github.io/miniPaint/" />
	<meta property="og:image" content="https://viliusle.github.io/miniPaint/images/preview.jpg" />
	<meta property="og:description" content="miniPaint is free online image editor using HTML5. Edit, adjust your images, add effects online in your browser, without installing anything..." />
	<meta property="og:site_name" content="miniPaint" />
	
	<script src="/triangleView/views/writeForm/forWrite1/dist/bundle.js"></script>
	<script src="/triangleView/js/jquery-3.3.1.min.js"></script>
 	<script>
		$(function(){
			$('.canvas_minipaint').drawImage('logo.png');
		});
	</script> 
	<style>
	#changePage{
	    background-color: #f8585b;
    	border: 1px solid black;
        margin-left: 15px;
        margin-right:auto; 
        width:90px; 
        height:40px; 
        text-align:center;
	}
	
	
	</style>
</head>
<body>
	<div class="wrapper">
		
      <div class="submenu">
         <button id="changePage">돌아가기</button>
         <script>
         	$("#changePage").click(function(){
         		location.href="../write1.jsp";
         	});
         </script>
         <div class="block attributes" id="action_attributes">
         </div>
         <div class="clear"></div>
      </div>
		
		<div class="sidebar_left" id="tools_container"></div>
		
		<div class="main_wrapper" id="main_wrapper">
			<div class="canvas_wrapper" id="canvas_wrapper">
				<div id="mouse"></div>
				<div class="transparent-grid" id="canvas_minipaint_background"></div>
				
				
				<canvas id="canvas_minipaint">
					<canvas class="canvas_minipaint">
						<div class="trn error">
							Your browser does not support canvas or JavaScript is not enabled.
						</div>
					</canvas>
					<div class="trn error">
						Your browser does not support canvas or JavaScript is not enabled.
					</div>
				</canvas>
				
			</div>
		</div>

		<div class="sidebar_right">
			<div class="preview block">
				<h2 class="trn toggle" data-target="toggle_preview">Preview</h2>
				<div id="toggle_preview"></div>
			</div>
			
			<div class="colors block">
				<h2 class="trn toggle" data-target="toggle_colors">Colors</h2>
				<input
					title="Click to change color" 
					type="color" 
					class="color_area" 
					id="main_color" 
					value="#0000ff"	/>
				<div class="content" id="toggle_colors"></div>
			</div>
			
			<div class="block" id="info_base">
				<h2 class="trn toggle toggle-full" data-target="toggle_info">Information</h2>
				<div class="content" id="toggle_info"></div>
			</div>
			
			<div class="details block" id="details_base">
				<h2 class="trn toggle toggle-full" data-target="toggle_details">Layer details</h2>
				<div class="content" id="toggle_details"></div>
			</div>
			
			<div class="layers block">
				<h2 class="trn">Layers</h2>
				<div class="content" id="layers_base"></div>
			</div>
		</div>
	</div>
	<div class="mobile_menu">
		<button class="right_mobile_menu" id="mobile_menu_button" type="button"></button>
	</div>
	<!-- <div class="ddsmoothmenu" id="main_menu"></div>  -->
	<div class="ddsmoothmenu" id="main_menu"></div>
	<div class="hidden" id="tmp"></div>
	<div id="popup"></div>
</body>
</html>
