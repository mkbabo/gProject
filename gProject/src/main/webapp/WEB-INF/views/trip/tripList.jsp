<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="<c:url value='/css/main.css'/>">


<!-- header  -->
<jsp:include page="../include/header.jsp" />

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

	.kFont {
		font-family: "Gowun Dodum", sans-serif;
		font-weight: 400;
		font-style: normal;
	}

</style>

</head>
<body>

	<div class="page-wrap">
	
	<!-- Nav  -->
	<jsp:include page="../include/nav.jsp" />

       
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
			                 <span class="image right">
			                 	<i class="fa-solid fa-xmark"></i>
			                 </span>
			                 <span class="image left">
			                 	<i class="fa-solid fa-plane"></i>
			                 </span>
			                 <div style="font-size: 1.5rem; font-weight: bold;" onclick="detailPage('')">비오는 날의 대만 타이베이 여행
			                 </div>
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
                    '   <span class="image right" onclick="tripDelBtn(\'' + item.tl_tripNo + '\')" >'+
                 			'<i class="fa-solid fa-xmark"></i>'+
                 	'   </span>'+                  
                    '   <span class="image left">'+
                    '       <i class="fa-solid fa-plane"></i>'+
                    '   </span>'+
                    '   <div style="cursor: pointer; font-size: 1.5rem; font-weight: bold;" onclick="detailPage(\'' + item.tl_tripNo + '\')">'+ item.tl_tripTitle +'</div>'+
                    '   <div style="margin-top: 1rem;"> 나라 : '+ item.tl_country +'</div>'+
                    '   <div style="margin-top: 1rem;"> 도시 : '+ item.tl_city +'</div>'+
                    '   <div style="margin-top: 1rem;"> 여행날짜 : '+ item.tl_startDate+' ~ '+ item.tl_endDate +'</div>'+
                    '   <div style="margin-top: 1rem;"> 여행 앨범명 : '+ item.tl_photoMenuNm +'</div>'+                    
                    '   <div style="margin-top: 1.5rem;">'+
                    '	<input type="button" class="button kFont" onclick="photoBtn(\'' + item.tl_tripNo + '\')" value="Gallery">'+
                    '	<input type="button" class="button active kFont" onclick="tripAddBtn(\'' + item.tl_tripNo + '\')" value="일정추가">'+ 
                    '</div>'+
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

function photoBtn(tripNo){
	
	console.log("tripNo >> " , tripNo)
	location.href="/gallery?tripNo="+tripNo;
	
	
}


function tripDelBtn(tripNo) {
    var confirmDelete = confirm('여행 일정을 삭제하시겠습니까?');

    if (confirmDelete) {
        console.log("삭제 버튼 >> ", tripNo);

        var jsonData = {
            tripNo: tripNo
        };

        $.ajax({
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(jsonData), // JSON 문자열로 데이터 변환
            url: '/tripDelete',
            success: function(result) {
                if (result.code == "ok") {
                    alert("여행 일정이 삭제되었습니다.");
                    //location.href = "/tripList"; // 여행 목록 페이지로 이동
                    getList();
                } else {
                    alert("여행 일정 삭제에 실패하였습니다.");
                }
            },
            error: function(xhr, status, error) {
                console.error("여행 일정 삭제 중 에러:", error);
                alert("여행 일정 삭제 중 에러가 발생했습니다.");
            }
        });
    }
}



</script>

</body>
</html>