<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="<c:url value='/css/main.css'/>">
 <!-- jquery -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet"> 
 
<title>Travel Memories Album</title>

<style type="text/css">

.tripList {
	margin-bottom: 5rem;
	padding : 1rem;
	border: 2px solid #868e96;
	border-radius: 3px;

	font-family: "Gowun Dodum", sans-serif;
	font-weight: 400;
	font-style: normal;

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
        
        <!-- Header -->
        <header id="header">
	        <div>Travel Memories Album</div>
        </header>
        
		<!-- Section -->
	    <section>
	     	<div class="inner" style="background-color: white;">
		        <header>
		        	<p>
		        		<span style="font-size: 2em; font-weight: bold; ">Travel Plan List</span> 
		        		<a href="#" class="button active" style="margin-left: 79%" onclick="location.href='tripUpload'">upload</a>
		        	</p>
		        </header>
		        
	         		<section class="columns double table-container">
		             	<!-- 본문 반복! -->
		             		<!--  
		             		<div class="column tripList">
			                 <span class="image left">
			                 	<i class="fa-solid fa-plane"></i>
			                 </span>
			                 <div style="font-size: 1.5rem; font-weight: bold;" onclick="detailPage('')">비오는 날의 대만 타이베이 여행</div>
			                 <div style="margin-top: 1.5rem;">나라 : </div>
			                 <div style="margin-top: 1.5rem;">도시 : </div>
			                 <div style="margin-top: 1.5rem;">여행날짜 : </div>
			                 <div style="margin-top: 1.5rem;"><a href="#" data-tag="people" class="button">photo</a></div>
		             	</div>
		         		<div class="column tripList">
			                 <span class="image left">
			                 	<i class="fa-solid fa-plane"></i>
			                 </span>
			                 <h3>러시아 블라디보스토크 여행!</h3>
			                 <p>나라 : </p>
			                 <p>여행날짜 : </p>
			                 <a href="#" data-tag="people" class="button">photo</a>
		             	</div>
		         		<div class="column tripList">
			                 <span class="image left">
			                 	<i class="fa-solid fa-plane"></i>
			                 </span>
			                 <h3>일본 오사카 여행!</h3>
			                 <p>나라 : </p>
			                 <p>여행날짜 : </p>
			                 <a href="#" data-tag="people" class="button">photo</a>
		             	</div>
		             	-->
		             	
	         	</section>
			</div>
		</section>

	
		</section>
	</div>
        
	<div class="copyright">
		Created by: <a href="#">HEO JI HYE</a> &
		Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
	</div>

<!-- Scripts -->
<script type="text/javascript">
$(document).ready(function(){
	getList();
});

/* 리스트 가져오기 */
function getList(){
    $.ajax({
        url:'/getList',
        type: 'GET',
        dataType: 'json', 
        //data : data,        
        success : function(result){
            console.log("전체 글 결과 리스트 >>", result);
            var template = ""; // 템플릿 변수 초기화
            $.each(result, function(index, item) {
                // 각 행 추가
                template += 
                    '<div class="column tripList">'+
                    '   <span class="image left">'+
                    '       <i class="fa-solid fa-plane"></i>'+
                    '   </span>'+
                    '   <div style="cursor: pointer; font-size: 1.5rem; font-weight: bold;" onclick="detailPage(\'' + item.tl_tripNo + '\')">'+ item.tl_tripTitle +'</div>'+
                    '   <div style="margin-top: 1rem;"> 나라 : '+ item.tl_country +'</div>'+
                    '   <div style="margin-top: 1rem;"> 도시 : '+ item.tl_city +'</div>'+
                    '   <div style="margin-top: 1rem;"> 여행날짜 : '+ item.tl_startDate+' ~ '+ item.tl_endDate +'</div>'+
                    '   <div style="margin-top: 1rem;"> 여행 앨범명 : '+ item.tl_photoMenuNm +'</div>'+                    
                    '   <div style="margin-top: 1.5rem;">'+
                    '		<a href="#" data-tag="people" class="button" id="'+ item.tl_tripNo +'">photo</a>'+
                    '		<a href="#" data-tag="people" class="button kFont active" onclick="tripAddBtn(\'' + item.tl_tripNo + '\')" id="">일정추가</a></div>'+
                    '</div>';
            });
            // 템플릿을 페이지에 추가
            $('.table-container').empty().append(template);
        }
    });
}


function detailPage(tripNo){
	
	console.log("tripNo >> " , tripNo)
}


function tripAddBtn(tripNo){
	
	console.log("tripNo >> " , tripNo)
	location.href="/tripDetailUpload?tripNo="+tripNo;
	
	
}


</script>




<!-- 

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/jquery.scrolly.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/util.js"></script>
<script src="js/main.js"></script>
-->
</body>
</html>