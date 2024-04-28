<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="<c:url value='/css/main.css'/>">
<title>Travel Memories Album</title>

<style type="text/css">

.img-container {
    width: 400px; /* 원하는 너비 */
    height: 250px; /* 원하는 높이 */
}

.img-container img {
    width: 100%;
    height: 100%;
}

</style>

</head>
<body>

	<div class="page-wrap">
	
		<!-- Nav -->
		<nav id="nav">
			<ul>
				<li>
					<a href="/" class="active">
						<span class="icon fa-home"></span>
					</a>
				</li>
				<li>
					<a href="gallery">
						<span class="icon fa-camera-retro"></span>
					</a>
				</li>
				<li>
					<a href="tripList">
						<span class="icon fa-file-text-o"></span>
					</a>
				</li>
			</ul>		
		</nav>
		
		<!-- Main -->
		<section id="main">
		
			<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<h1>Travel Memories Album</h1>
					<p>This is a site to share travel memories with family or friends.</p>
					<ul class="actions">
						<li>
							<a href="tripList" class="button alt scrolly big">Go on a trip</a>
						</li>
					</ul>
				</div>
			</section>
			
			<!-- Gallery -->
			<section id="galleries">
		
			<!-- Photo Galleries -->
			<div class="gallery">
			<!-- 	<header class="special">
					<h2>What's New</h2>
				</header> -->
				<div class="content">

					<div class="media img-container">					
						<img src="images/thumbs/korea05.jpg" alt="">			
					</div>
					<div class="media img-container">					
						<img src="images/thumbs/korea06.jpg" alt="" >			
					</div>
					<div class="media img-container">					
						<img src="images/thumbs/korea07.jpg" alt="">			
					</div>
					<div class="media img-container">					
						<img src="images/thumbs/korea08.jpg" alt="">			
					</div>
					<div class="media img-container">					
						<img src="images/thumbs/korea01.jpg" alt="">			
					</div>
					<div class="media img-container">					
						<img src="images/thumbs/korea02.jpg" alt="">			
					</div>
					<div class="media img-container">					
						<img src="images/thumbs/korea04.jpg" alt="">			
					</div>				
					<div class="media img-container">					
						<img src="images/thumbs/korea03.jpg" alt="">			
					</div>
				</div>
				
				
		<!-- 	<footer>
				<a href="/gallery" class="button big">gallery</a>
			</footer> -->
		</div>
	</section>
	

		
		</section>
	</div>

	<div class="copyright">
		Created by: <a href="#">HEO JI HYE</a> &
		Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
	</div>
	
<script type="text/javascript">


</script>	
	
	
		<!-- Scripts -->
<!-- 	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.poptrox.min.js"></script>
	<script src="js/jquery.scrolly.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<script src="js/main.js"></script> -->

</body>
</html>