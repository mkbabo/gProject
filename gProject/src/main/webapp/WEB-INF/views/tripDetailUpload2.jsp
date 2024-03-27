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
 <!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet"> 
 
<title>Travel Memories Album</title>

<style type="text/css">
	.kFont {
		font-family: "Gowun Dodum", sans-serif;
		font-weight: 400;
		font-style: normal;
	}
	
		.tableB {
	 	border-collapse : collapse;
	 	width: 100%;
	 	margin : auto;
	 	margin-top : 20px;
	} 	
	
	.tableBth {
		/* background-color: #0dcaf0; */
		font-size: 0.9rem;
		font-weight: bold;
		text-align: center;	
		height: 2.4rem;
		padding-top: 0.5rem;
		
	}
	
	.tableBtd {	
		font-size: 0.9rem;
		font-weight: bold;
		
		/* height: 2.4rem; */
		
	}
 
	.tInput{
		font-size: 0.9rem;	
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

        <!-- Contact -->
        <section id="contact">
			<div class="" style="margin: auto;">
				<h2>planning a trip</h2>
				
				<div class="table-container"></div>
													
					<table class="tableB t1 kFont" id="sTable">
					    <colgroup>
					        <col width=20%>    
					        <col width=10%>    
					        <col width=10%>
					        <col width=10%>    
					        <col width=20%>      
					        <col width=20%>        
					        <col width=10%>                                   
					    </colgroup>    
					
					    <!-- 반복 부분 시작 -->
					    <tr class="repeat-section">
					        <th class="tableBth">장소</th>
					        <th class="tableBth" colspan="2">시간</th>
					        <th class="tableBth" colspan="2">내용</th>
					        <th class="tableBth" colspan="2">비용</th>
					    </tr>
					    <tr class="repeat-section">
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="장소" value="" ></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="일정시작시간" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="일정끝시간" value=""></td>
					        <td class="tableBtd" colspan="2"><input class="tInput" type="text" placeholder="일정 관련 내용" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="비용 관련 내용" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="금액" value=""></td>
					    </tr>   
					    <tr class="repeat-section">
					        <th class="tableBth">이동출발장소</th>
					        <th class="tableBth" colspan="2">이동도착장소</th>
					        <th class="tableBth">소요시간</th>
					        <th class="tableBth" colspan="3">비고</th>
					    </tr>
					    <tr class="repeat-section">
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="장소" value=""></td>
					        <td class="tableBtd" colspan="2"><input class="tInput" type="text" placeholder="장소" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" style="text-align: center;" placeholder="예) 10분" value=""></td>
					        <td class="tableBtd" colspan="3"><input class="tInput" type="text" placeholder="이동 관련 비고 사항" value=""></td>
					    </tr>
					    <!-- 반복 부분 끝 -->
					
					    <!-- 마지막 일정 -->
					    <tr id="lastSchedule">
					        <th class="tableBth">장소</th>
					        <th class="tableBth" colspan="2">시간</th>
					        <th class="tableBth" colspan="2">내용</th>
					        <th class="tableBth" colspan="2">비용</th>
					    </tr>
					    <tr>
					       	<td class="tableBtd"><input class="tInput" type="text" placeholder="장소" value="" ></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="일정시작시간" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="일정끝시간" value=""></td>
					        <td class="tableBtd" colspan="2"><input class="tInput" type="text" placeholder="일정 관련 내용" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="비용 관련 내용" value=""></td>
					        <td class="tableBtd"><input class="tInput" type="text" placeholder="금액" value=""></td>
					    </tr>   
					</table>
					
					<button style="margin: 2rem 0rem;" onclick="addSchedule();">일정 추가</button>	
					<button style="margin: 2rem 0rem;" onclick="removeLastSchedule();">일정 삭제</button>		
				</div>
        	</section>
	
		</section>
	</div>
        
		<!-- 	<div class="copyright">
				Created by: <a href="#">HEO JI HYE</a> &
				Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
			</div> -->


			
<script type="text/javascript">

$(document).ready(function(){
    const urlParams = new URL(location.href).searchParams;
    const tripNo = urlParams.get('tripNo');

    console.log('tripNo Value:', tripNo);
    tripData(tripNo);
    
});


//일정 추가
function addSchedule() {
    const repeatSection = $('.repeat-section');
    const lastSchedule = $('#lastSchedule');

    repeatSection.each(function(index) {
        const newRow = $('<tr></tr>').html($(this).html()).attr('data-id', index);
        newRow.insertBefore(lastSchedule);
    });
}


//일정 삭제
function removeLastSchedule() {
    const lastAddedRows = $('#sTable tr[data-id]').slice(-4);
    if (lastAddedRows.length) {
        lastAddedRows.remove();
    } else {
        alert('삭제할 행이 없습니다.');
    }
}




//여행 기본 정보 가져오기
function tripData(tripNo){
	
	console.log("tripNo >> " , tripNo);
	let jsonData = {tripNo : tripNo}; 
	
	$.ajax({
		type: 'GET',
		contentType : 'application/json; charset=utf-8',
		data : jsonData,
		url : '/tripData',
		success : function(item){
			
            console.log("전체 글 결과 리스트 >>", item);
            var template = ""; // 템플릿 변수 초기화

                template += 
                    '<div class="" style="padding-top : 0;">'+
                    '   <div style="margin-top: 1rem;"> 나라 : '+ item.tl_country +'</div>'+
                    '   <div style="margin-top: 1rem;"> 도시 : '+ item.tl_city +'</div>'+
                    '   <div style="margin-top: 1rem;"> 여행날짜 : '+ item.tl_startDate+' ~ '+ item.tl_endDate +'</div>'+                
                    '</div>';
            
            // 템플릿을 페이지에 추가
            $('.table-container').empty().append(template);
		}	
	});
	
	
}


//여행 등록
function tripDataInsert(){
	
	console.log("버튼클릭! ");
	var formSerializeObject = $('#newData').serializeObject(); //serializeObject 아래 함수 확인!

	var jsonMemberData = JSON.stringify(formSerializeObject);
	
	$.ajax({
		type: 'POST',
		contentType : 'application/json; charset=utf-8',
		data : jsonMemberData,
		url : '/tripInsert',
		success : function(result){
			
			if(result.code == "ok"){
				alert("새로운 여행이 추가되었습니다.");
				location.href="/tripList"; // 로그인 성공 페이지로 이동
			}else {
				alert("여행 등록에 실패하였습니다.");
				return false;
			}
		}	
	});
	
	
}





//form 데이터를 Object 형태로 변환 (serializeObject)
jQuery.fn.serializeObject = function() { 
	var obj = null; 
	try { 
		if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
			var arr = this.serializeArray(); 
	        if(arr){ obj = {}; 
	        jQuery.each(arr, function() { 
	        	obj[this.name] = this.value; }); 
	        } 
	    } 
	}catch(e) { 
	    alert(e.message); 
	}finally {} 
	return obj; 
}
</script>			
			

</body>
</html>