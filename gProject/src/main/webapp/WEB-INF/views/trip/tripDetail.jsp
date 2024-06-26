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

/* 미디어 쿼리를 사용하여 화면 너비가 600px 이상인 경우에만 테이블의 너비를 600px로 설정 */
@media only screen and (min-width: 600px) {
    .tableB {
        width: 100%; /* 화면 너비의 600px를 사용 */
    }
}
    
	.kFont {
		font-family: "Gowun Dodum", sans-serif;
		font-weight: 400;
		font-style: normal;
	}
	
	.tableB {
	    border-collapse: collapse;
	    width: 1300px; /* 처음 너비를 1300px로 설정 */
	    margin: auto;
	    margin-top: 20px;	    
	} 

	.tableBth {
		font-size: 0.9rem;
		font-weight: bold;
		text-align: center;	
		height: 2.4rem;
  		padding-top: 0.5rem;  		
   		border-left: 1px black solid;
		border-right: 1px black solid;;    	
	}
	
	.tableBtd {	
		font-size: 0.9rem;
		font-weight: bold;		
    	text-align: center;
    	background-color: white;   	
    	border-left: 1px black solid;
		border-right: 1px black solid;		
	}
	
	table th:first-child,
	table td:first-child {
		border-left: 0;
	}
	
	table th:last-child,
	table td:last-child {
		border-right: 0;
	}	
	
	.firstTh{
		background-color: #E8E7D2; /* #E3E2B4 #E5C1C5 #C3E2DD #6ECEDA */	
	}
	
	.lastTh{
		background-color: #D5E1DF; /*#BFC8D7 #C3E2DD #6ECEDA */	
	}
		
	.repeat-sectionDate {
	    border-top: none; /* 맨 위 행의 상단 테두리 제거 */ 
	    	   
	}

	.date-button{
		margin: 2px;
	}
	
	.date-button.active {
    background-color: #007bff; /* 클릭된 경우의 배경색 */
    color: #ffffff; /* 클릭된 경우의 텍스트색 */
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

        <!-- Contact -->
        <section id="contact">
			<div class="" style="margin-left: 10rem; min-height: 740px;">
				<h2>planning a trip</h2>
				
				<div class="table-container"></div><!-- 공통 내용 -->
				<div class="date-container" style="margin-top: 20px;"></div><!-- 날짜별 버튼 생성 -->
				
				<form class= "newData" id="newData" name="newData" method="post" onsubmit="return false" enctype="multipart/form-data">				
					<!-- <div id="parentContainer"></div> -->
					
					<table class="tableB t1 kFont" id="parentContainer">					
					</table><!-- 테이블 동적 생성 -->

				</form>	
				<div class="btn-container"></div><!-- 버튼 생성 -->
						
<!-- 					<button style="margin: 2rem 0rem;" onclick="addSchedule();">일정등록</button>
					<button style="margin: 2rem 0rem;" onclick="updateSchedule();">일정수정</button>
					<button style="margin: 2rem 0rem;" onclick="removeSchedule();">일정삭제</button> -->
				</div>
        	</section>
	
		</section>
	</div>
        
			<div class="copyright">
				Created by: <a href="#">HEO JI HYE</a> &
				Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
			</div> 


			
<script type="text/javascript">
    const urlParams = new URL(location.href).searchParams;
    const tripNo = urlParams.get('tripNo');
    const date = urlParams.get('date');
   // console.log('tripNo Value:', tripNo);
   // console.log('date Value:', date);

  $(document).ready(function(){
    tripData(tripNo);   //여행 기본 정보 가져오기
});

/* ***************************** 기본 정보 가져오기 ************************************* */

//여행 기본 정보 가져오기
function tripData(tripNo){
	
	//console.log("tripNo >> " , tripNo);
	let jsonData = {tripNo : tripNo}; 
	
	$.ajax({
		type: 'GET',
		contentType : 'application/json; charset=utf-8',
		data : jsonData,
		url : '/tripData',
		success : function(item){
			
          //  console.log("전체 글 결과 리스트 >>", item);
            var template = ""; // 템플릿 변수 초기화

                template += 
                    '<div class="kFont" style="padding-top : 0;">'+
                    '   <div style="margin-top: 1rem;"> 나라 : '+ item.tl_country +'</div>'+
                    '   <div style="margin-top: 1rem;"> 도시 : '+ item.tl_city +'</div>'+
                    '   <div style="margin-top: 1rem;"> 여행날짜 : '+ item.tl_startDate+' ~ '+ item.tl_endDate +'</div>'+                
                    '</div>';
            
            // 템플릿을 페이지에 추가
            $('.table-container').empty().append(template);
      
            getAllDates(item.tl_startDate, item.tl_endDate)
            
		}	
	});
	
}

//사이 날짜 가져오기
function getAllDates(start, end) {
    var startDate = new Date(start);
    var endDate = new Date(end);
    var dates = [];
    var currentDate = new Date(startDate);

    while (currentDate <= endDate) {
        var year = currentDate.getFullYear();
        var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
        var day = ('0' + currentDate.getDate()).slice(-2);
        var formattedDate = year + '-' + month + '-' + day;

        dates.push(formattedDate);
        currentDate.setDate(currentDate.getDate() + 1);
    }

    // 기존의 날짜 컨테이너 내용 지우기
    $('.date-container').empty();

    // 각 날짜마다 버튼을 생성
    $.each(dates, function(index, item) {
        
        var button = $('<button class="date-button"></button>').text(item);

        // 버튼 클릭 이벤트
        button.on('click', function() {
            // 모든 버튼의 색상 초기화
            $('.date-button').removeClass('active');

            // 클릭된 버튼에 active 클래스를 추가하여 색상을 변경
            $(this).addClass('active');

            dataDetail(item);
        });

        // 버튼을 날짜 컨테이너에 추가
        $('.date-container').append(button);

		// 페이지가 처음 로드될 때 URL에 date 값이 있는 경우 해당 날짜 버튼을 클릭
        if (date) {
            $('.date-button').each(function() {
                if ($(this).text() === date) {
                    $(this).click();
                    return false; // 반복문 종료
                }
            });
        } else {
            // URL에 date 값이 없는 경우 첫 번째 버튼을 클릭
            $('.date-button').first().click();
        }
  
    });
}


/* ***************************** 기본 정보 가져오기 끝 ************************************* */

function dataDetail(clickedDate) {
  //  console.log("clickedDate >> ", clickedDate); //날짜
  //  console.log('tripNo Value:', tripNo);
    
    
	let jsonData = {tripNo : tripNo,
					tripDate : clickedDate};
	
//	console.log("jsonData >> " , jsonData)
	
	$.ajax({
		url : '/tripDetailSelect',
		type: 'GET',
        dataType: 'json',
		data : jsonData,
		success : function(result){
			
         //  console.log("전체 글 결과 리스트 >>", result);
         //  console.log("전체 글 결과 갯수! >>", result.length);
            
            if(result.length != 0){
  
            // 변환된 데이터를 저장할 빈 객체 생성
            let transformedData = {};
            let transformedData99 = {};
            
         	// "99"로 끝나는 항목은 제외
            result.forEach(function(item) {               
                if (!item.td_detailNo.endsWith("99")) {
                    // td_detailNo에서 "_"를 기준으로 분할하여 인덱스 [3]부터 [4]까지를 가져옴
                    let key = item.td_detailNo.split("_")[3] + "_" + item.td_detailNo.split("_")[4];
                    // td_detailNo를 키로 사용하여 td_detailData를 값으로 매핑
                    transformedData[key] = item.td_detailData;
                }
            });
         	
         	
         	// "99"를 포함하는 항목만 출력
            result.forEach(function(item) {
                
                if (item.td_detailNo.includes("99")) {
                    
                    let key = item.td_detailNo.split("_")[3] + "_" + item.td_detailNo.split("_")[4];
                    
                    transformedData99[key] = item.td_detailData;
                }
            });            
         //   console.log("변환된 데이터 >>", transformedData);
         //   console.log("변환된 데이터_99 >>", transformedData99);
            
            $('#parentContainer').empty();
            $('.btn-container').empty();
            
            var table = '';
            
            table += '<colgroup>'+
				        '<col width=20%>'+    
				        '<col width=10%>'+    
				        '<col width=10%>'+
				        '<col width=10%>'+    
				        '<col width=20%>'+      
				        '<col width=20%>'+        
				        '<col width=10%>'+                                   
				    '</colgroup>'+  
            
             '<tr class="repeat-sectionDate table-containerDate">' +
            '<th class="tableBth" id ="dateInput" colspan="7">' + clickedDate + '</th>' +
            '</tr>' ;
            
         	// transformedData 객체에서 특정 키워드를 포함하는 모든 키 찾기 (장소 키를 기준으로 최대 숫자 찾음)
            let locationKeys = Object.keys(transformedData).filter(key => key.startsWith('location'));     
         	// locationKeys 배열에서 끝에 있는 숫자만 추출하여 정수로 변환하고 최대값을 찾기
            let lastNum = Math.max(...locationKeys.map(key => parseInt(key.split('_').pop())));
          //  console.log(lastNum);
            
            /* 반복 구간 시작  */ 
            for (let i = 1; i <= lastNum; i++) {
            	
          //      console.log("차근차근! >> " , i)
                
                    let location2 			= 'location_' + i;
    				let startTime2 			= 'startTime_' + i;
    				let endTime2 			= 'endTime_' + i;
				    let content2 			= 'content_' + i;
				    let costContent2 		= 'costContent_' + i;
				    let amount2 			= 'amount_' + i;

                    let departureLocation2 	= 'departureLocation_' + i;
    				let arrivalLocation2 	= 'arrivalLocation_' + i;
    				let requiredTime2 		= 'requiredTime_' + i;
				    let remark2 			= 'remark_' + i;
        
                
                table += '<tr class="repeat-section">' +
	                '<th class="tableBth firstTh">장소</th>' +
	                '<th class="tableBth firstTh" colspan="2">일정 시간</th>' +
	                '<th class="tableBth firstTh" colspan="2">내용</th>' +
	                '<th class="tableBth firstTh" colspan="2">비용</th>' +
                '</tr>' +
                '<tr class="repeat-section">' +
                
	                '<td class="tableBtd">' + transformedData[location2] + '</td>' +
	                '<td class="tableBtd">' + transformedData[startTime2] + '</td>' +
	                '<td class="tableBtd">' + transformedData[endTime2] + '</td>' +
	                '<td class="tableBtd" colspan="2">' + transformedData[content2] + '</td>' +
	                '<td class="tableBtd">' + transformedData[costContent2] + '</td>' +
	                '<td class="tableBtd">' + transformedData[amount2] + '</td>' +                
                
                '</tr>'+    
            	
    	        '<tr class="repeat-section">' +
	    	        '<th class="tableBth lastTh">이동출발장소</th>' +
	    	        '<th class="tableBth lastTh" colspan="2">이동도착장소</th>' +
	    	        '<th class="tableBth lastTh">소요시간</th>' +
	    	        '<th class="tableBth lastTh" colspan="3">비고</th>' +
    	    	'</tr>'+            	
            	
                '<tr class="repeat-section">' +
                
	                '<td class="tableBtd">' + transformedData[departureLocation2] + '</td>' +
	                '<td class="tableBtd" colspan="2">' + transformedData[arrivalLocation2] + '</td>' +
	                '<td class="tableBtd">' + transformedData[requiredTime2] + '</td>' +
	                '<td class="tableBtd" colspan="3">' + transformedData[remark2] + '</td>' +                

                '</tr>';   	    	
            }           
    /* 반복 구간 끝 */ 

       //마지막 99 리스트만!
	   table +='<tr id="lastSchedule">' +
		        '<th class="tableBth firstTh">장소</th>' +
		        '<th class="tableBth firstTh" colspan="2">시간</th>' +
		        '<th class="tableBth firstTh" colspan="2">내용</th>' +
		        '<th class="tableBth firstTh" colspan="2">비용</th>' +
		    '</tr>' +
		    '<tr>' +		    
	            '<td class="tableBtd">' + transformedData99.location_99 + '</td>' +
	            '<td class="tableBtd">' + transformedData99.startTime_99 + '</td>' +
	            '<td class="tableBtd">' + transformedData99.endTime_99 + '</td>' +
	            '<td class="tableBtd" colspan="2">' + transformedData99.content_99 + '</td>' +
	            '<td class="tableBtd">' + transformedData99.costContent_99 + '</td>' +
	            '<td class="tableBtd">' + transformedData99.amount_99 + '</td>' + 		    
		    '</tr>'; 

			$('#parentContainer').append(table);
		
            // 수정하기와 삭제하기 버튼 생성
            $('.btn-container').append('<button style="margin: 2rem 1rem 2rem 0rem; background-color: #83B1C9;" onclick="updateSchedule(\'' + clickedDate + '\');">일정수정</button>');
            $('.btn-container').append('<button style="margin: 2rem 1rem 2rem 0rem; background-color: #B97687;" onclick="removeSchedule(\'' + clickedDate + '\');">일정삭제</button>');
        } else {
            // 결과 데이터의 길이가 0이면 등록하기 버튼만 생성
            $('#parentContainer').empty();
            var table = '일정을 입력해주세요!';
            $('#parentContainer').append(table);
            $('.btn-container').empty();
            $('.btn-container').append('<button style="margin: 2rem 1rem 2rem 0rem; background-color: #83B1C9;" onclick="addSchedule(\'' + clickedDate + '\');">일정등록</button>');
        }
            $('.btn-container').append('<button style="margin: 2rem 1rem 2rem 0rem; background-color: #838BB2;" onclick="movePage();">목록으로</button>');   
	}
	
});   
    
} 
/* 버튼 이동 */						

//일정 등록
 function addSchedule(clickedDate){
	//console.log("일정 등록");
	// console.log("다른 함수에서 클릭된 날짜:", clickedDate);
	location.href="/tripDetailUpload?tripNo=" + tripNo + "&date=" + clickedDate; // 등록페이지 이동!
}

//일정 수정
 function updateSchedule(clickedDate){
	// console.log("일정 수정");
	 location.href = "/tripDetailUpdate?tripNo=" + tripNo + "&date=" + clickedDate; // 상세페이지 이동!
}
 
//일정 삭제 
 function removeSchedule(clickedDate){
	 
	// console.log("일정 삭제 버튼 tripNo >> ", tripNo);
	// console.log("일정 삭제 버튼 clickedDate >> ", clickedDate);
	 
	    var confirmDelete = confirm('여행 상세 일정을 삭제하시겠습니까?');

	    if (confirmDelete) {

		        var jsonData = {
		            tripNo: tripNo,
		            tripDate : clickedDate
		        };
		        
	      //  console.log("삭제 버튼 jsonData >> ", jsonData);
	        

	        $.ajax({
	            type: 'POST',
	            contentType: 'application/json; charset=utf-8',
	            data: JSON.stringify(jsonData), // JSON 문자열로 데이터 변환
	            url: '/tripDetailDelete',
	            success: function(result) {
	            //	console.log("result >> ", result);
	            	
	                if (result.code == "ok") {
	                    alert("여행 상세 일정이 삭제되었습니다.");
	                    location.href = "/tripDetail?tripNo=" + tripNo + "&date=" + clickedDate; // 상세페이지 이동!
	                    //getList();
	                } else {
	                    alert("여행 상세 일정 삭제에 실패하였습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("여행 상세 일정 삭제 중 에러:", error);
	                alert("여행 상세 일정 삭제 중 에러가 발생했습니다.");
	            }
	        });
	        
	    }	 
	 
	 
 }
 
 // 목록이동
 function movePage(){
	 
	// console.log("페이지 이동");
	 location.href = "/tripList"
	 	 
 }
 

</script>			
			

</body>
</html>