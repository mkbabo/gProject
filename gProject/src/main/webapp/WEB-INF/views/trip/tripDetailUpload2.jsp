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
			<div class="" style="margin: auto;">
				<h2>planning a trip</h2>
				
				<div class="table-container"></div><!-- 공통 내용 -->
				
				<form class= "newData" id="newData" name="newData" method="post" onsubmit="return false" enctype="multipart/form-data">				
					<div id="parentContainer"></div><!-- 테이블 동적 생성 -->
				</form>									
<%-- 					<table class="tableB t1 kFont" id="sTable">
					    <colgroup>
					        <col width=20%>    
					        <col width=10%>    
					        <col width=10%>
					        <col width=10%>    
					        <col width=20%>      
					        <col width=20%>        
					        <col width=10%>                                   
					    </colgroup>    
					
					    <tr class="repeat-sectionDate table-containerDate">
					        <!-- <th class="tableBth" colspan="7">날짜</th> -->
					    </tr>					
					    <!-- 반복 부분 시작 -->
					    <tr class="repeat-section">
					        <th class="tableBth">장소</th>
					        <th class="tableBth" colspan="2">일정 시간</th>
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
					<button style="margin: 2rem 0rem;" onclick="removeLastSchedule();">일정 삭제</button>	 --%>	
					
					<button style="margin: 2rem 0rem;" onclick="tripDataInsert();">작성완료</button>
				</div>
        	</section>
	
		</section>
	</div>
        
		<!-- 	<div class="copyright">
				Created by: <a href="#">HEO JI HYE</a> &
				Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
			</div> -->


			
<script type="text/javascript">
    const urlParams = new URL(location.href).searchParams;
    const tripNo = urlParams.get('tripNo');
    console.log('tripNo Value:', tripNo);

  $(document).ready(function(){
    tripData(tripNo);   
});

/* ***************************** 기본 정보 가져오기 ************************************* */

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
	
	console.log("startDate >>" , startDate)
	console.log("endDate >>" , endDate)
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
	
    console.log("dates >>" , dates)
    addDatesToTable(dates); // 생성된 날짜를 테이블에 추가
    //return dates;
}

/* ***************************** 기본 정보 가져오기 끝 ************************************* */

//테이블 생성
function addDatesToTable(dates) {
	
	console.log("테이블 생성 tripNo >> " , tripNo)
	
    $.each(dates, function(index, date) {
    	console.log("테이블 생성 index?? >> " , index)
    	
    	var table =`
		<table class="tableB t1 kFont" id="sTable_${'${index}'}">
	    <colgroup>
	        <col width=20%>    
	        <col width=10%>    
	        <col width=10%>
	        <col width=10%>    
	        <col width=20%>      
	        <col width=20%>        
	        <col width=10%>                                   
	    </colgroup>    
	
	    <tr class="repeat-sectionDate table-containerDate" data-date="${'${date}'}">
        	<th class="tableBth" colspan="7">${'${date}'}</th>
    	</tr>					
	    <!-- 반복 부분 시작 -->
	<tr class="repeat-section_${'${index}'}">
        <th class="tableBth">장소</th>
        <th class="tableBth" colspan="2">일정 시간</th>
        <th class="tableBth" colspan="2">내용</th>
        <th class="tableBth" colspan="2">비용</th>
    </tr>
    <tr class="repeat-section_${'${index}'}">
        <td class="tableBtd"><input class="tInput" type="text" placeholder="장소" value="" 						
        		id="${'${tripNo}'}_${'${date}'}_1_0_000000000000" name="${'${tripNo}'}_${'${date}'}_1_0_000000000000" data-id="${'${tripNo}'}_${'${date}'}_${'${index}'}"></td>
        <td class="tableBtd"><input class="tInput" type="text" placeholder="일정시작시간" value="" 					
        		id="${'${tripNo}'}_${'${date}'}_1_1_000000000000" name="${'${tripNo}'}_${'${date}'}_1_1_000000000000" data-id="${'${tripNo}'}_${'${date}'}_${'${index}'}"></td>
        <td class="tableBtd"><input class="tInput" type="text" placeholder="일정끝시간" value="" 					
        		id="${'${tripNo}'}_${'${date}'}_1_2_000000000000" name="${'${tripNo}'}_${'${date}'}_1_2_000000000000" data-id="${'${tripNo}'}_${'${date}'}_${'${index}'}"></td>
        <td class="tableBtd" colspan="2"><input class="tInput" type="text" placeholder="일정 관련 내용" value="" 	
        		id="${'${tripNo}'}_${'${date}'}_1_3_000000000000" name="${'${tripNo}'}_${'${date}'}_1_3_000000000000" data-id="${'${tripNo}'}_${'${date}'}_${'${index}'}"></td>
        <td class="tableBtd"><input class="tInput" type="text" placeholder="비용 관련 내용" value="" 				
        		id="${'${tripNo}'}_${'${date}'}_1_4_000000000000" name="${'${tripNo}'}_${'${date}'}_1_4_000000000000" data-id="${'${tripNo}'}_${'${date}'}_${'${index}'}"></td>
        <td class="tableBtd"><input class="tInput" type="text" placeholder="금액" value="" 						
        		id="${'${tripNo}'}_${'${date}'}_1_5_000000000000" name="${'${tripNo}'}_${'${date}'}_1_5_000000000000" data-id="${'${tripNo}'}_${'${date}'}_${'${index}'}"></td>
    </tr>   
    <tr class="repeat-section_${'${index}'}">
        <th class="tableBth">이동출발장소</th>
        <th class="tableBth" colspan="2">이동도착장소</th>
        <th class="tableBth">소요시간</th>
        <th class="tableBth" colspan="3">비고</th>
    </tr>
    <tr class="repeat-section_${'${index}'}">
        <td class="tableBtd"><input class="tInput" type="text" placeholder="장소" value="" 									
        		id="${'${tripNo}'}_${'${date}'}_3_0_000000000000" name="${'${tripNo}'}_${'${date}'}_3_0_000000000000" data-id="${'${tripNo}'}_${'${date}'}_3_0_000000000000"></td>
        <td class="tableBtd" colspan="2"><input class="tInput" type="text" placeholder="장소" value="" 						
        		id="${'${tripNo}'}_${'${date}'}_3_1_000000000000" name="${'${tripNo}'}_${'${date}'}_3_1_000000000000" data-id="${'${tripNo}'}_${'${date}'}_3_1_000000000000"></td>
        <td class="tableBtd"><input class="tInput" type="text" style="text-align: center;" placeholder="예) 10분" value="" 	
        		id="${'${tripNo}'}_${'${date}'}_3_2_000000000000" name="${'${tripNo}'}_${'${date}'}_3_2_000000000000" data-id="${'${tripNo}'}_${'${date}'}_3_2_000000000000"></td>
        <td class="tableBtd" colspan="3"><input class="tInput" type="text" placeholder="이동 관련 비고 사항" value="" 			
        		id="${'${tripNo}'}_${'${date}'}_3_3_000000000000" name="${'${tripNo}'}_${'${date}'}_3_3_000000000000" data-id="${'${tripNo}'}_${'${date}'}_3_3_000000000000"></td>
    </tr>
    <!-- 반복 부분 끝 -->

	    <!-- 반복 부분 끝 -->
	
	    <!-- 마지막 일정 -->
	    <tr id="lastSchedule_${'${index}'}">
	        <th class="tableBth">장소</th>
	        <th class="tableBth" colspan="2">시간</th>
	        <th class="tableBth" colspan="2">내용</th>
	        <th class="tableBth" colspan="2">비용</th>
	    </tr>
	    <tr>
	       	<td class="tableBtd"><input class="tInput" type="text" name="${'${tripNo}'}_${'${date}'}_1_0_999999999999" 	placeholder="장소" value="" ></td>
	        <td class="tableBtd"><input class="tInput" type="text" name="${'${tripNo}'}_${'${date}'}_1_1_999999999999" 	placeholder="일정시작시간" value=""></td>
	        <td class="tableBtd"><input class="tInput" type="text" name="${'${tripNo}'}_${'${date}'}_1_2_999999999999" 	placeholder="일정끝시간" value=""></td>
	        <td class="tableBtd" colspan="2"><input class="tInput" name="${'${tripNo}'}_${'${date}'}_1_3_999999999999" 	type="text" placeholder="일정 관련 내용" value=""></td>
	        <td class="tableBtd"><input class="tInput" type="text" name="${'${tripNo}'}_${'${date}'}_1_4_999999999999" 	placeholder="비용 관련 내용" value=""></td>
	        <td class="tableBtd"><input class="tInput" type="text" name="${'${tripNo}'}_${'${date}'}_1_5_999999999999" 	placeholder="금액" value=""></td>
	    </tr>   
	</table>
	<button class="kFont" style="margin: 2rem 0rem;" onclick="addSchedule('${'${index}'}', '${'${date}'}');">일정 추가</button>	
	<button class="active kFont" style="margin: 2rem 0rem;" onclick="removeLastSchedule('${'${index}'}');">일정 삭제</button>

    `;
    	
    // 생성된 테이블을 삽입할 부모 요소를 선택하여 테이블을 추가합
    $('#parentContainer').append(table);
    	
    });
    
    
}


//일정 추가 버튼 실행 함수
function addSchedule(num, date) {
	
	console.log("tripNo >> " , tripNo)
	console.log("index >> " , num)
	console.log("date >> " , date)
	
   const repeatSection = $('.repeat-section_'+num);
   const lastSchedule = $('#lastSchedule_'+num);

   
   repeatSection.each(function (index) {
       //const currentTime = new Date().getTime(); // 현재 시간을 밀리초로 얻기

const currentDate = new Date(); // 현재 날짜와 시간 객체 생성

const currentYear = currentDate.getFullYear(); // 현재 년도 가져오기 (예: 2024)
const currentMonth = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 현재 월 가져오기 (01-12)
const currentDay = ('0' + currentDate.getDate()).slice(-2); // 현재 일 가져오기 (01-31)
const currentHour = ('0' + currentDate.getHours()).slice(-2); // 현재 시간 가져오기 (00-23)
const currentMinute = ('0' + currentDate.getMinutes()).slice(-2); // 현재 분 가져오기 (00-59)
const currentSecond = ('0' + currentDate.getSeconds()).slice(-2); // 현재 초 가져오기 (00-59)

// 현재 날짜와 시간을 24년 4월 27일 11시 13분 5초 형식으로 출력
const currentDateTime = currentYear.toString().slice(-2) +
                        currentMonth +
                        currentDay +
                        currentHour +
                        currentMinute +
                        currentSecond;

console.log(currentDateTime);
 
       // 각각의 input 요소에 대해 고유한 id 값을 생성하여 부여
       $(this).find('input').each(function (inputIndex) {
    	   
    	   console.log("inputIndex >> " , inputIndex)
           const uniqueId = tripNo + '_' + date + '_' + index + '_' + inputIndex + '_' + currentDateTime; // 고유한 id 생성
           $(this).attr('id', uniqueId); // 고유한 id를 input 요소에 부여
           $(this).attr('name',uniqueId); // 고유한 name를 input 요소에 부여
       });

/*        const newRow = $('<tr class=newDiv ' + index + '></tr>').html($(this).html()).attr('data-id', index + currentDateTime);
       console.log("data-id:", newRow.attr('data-id'));
       console.log("$(this).html():", $(this).html());
       newRow.insertBefore(lastSchedule); */
       
       const newRow = $(' <tr class="repeat-section_${'${index}'}">').html($(this).html()).attr('data-id', tripNo + '_' + date + '_' + index + '_' + currentDateTime);
       console.log("$(this).html():", $(this).html());
       newRow.insertBefore(lastSchedule);
       
   });   
   
   
}




// //일정 추가 버튼 실행 함수
//  function addSchedule(num) {
	
// 	console.log("index >> " , num)
	
//     const repeatSection = $('.repeat-section_'+num);
//     const lastSchedule = $('#lastSchedule_'+num);

//     repeatSection.each(function(index) {
//     	const currentTime = new Date().getTime(); // 현재 시간을 밀리초로 얻기
//     	//console.log("ㅜㅜㅜㅜ >> " , index, $(this).html())
//         const newRow = $('<tr class=newDiv '+index+'></tr>').html($(this).html()).attr('data-id', index+currentTime);
//         console.log("data-id:", newRow.attr('data-id'));
//         console.log("$(this).html():", $(this).html());
//         newRow.insertBefore(lastSchedule);
//     });
// }







//일정 삭제
function removeLastSchedule(num) {
	
	//console.log("??? >> ", num)
	
    const lastAddedRows = $('#sTable_'+num+' tr[data-id]').slice(-4);
    if (lastAddedRows.length) {
        lastAddedRows.remove();
    } else {
        alert('삭제할 행이 없습니다.');
    }
}








/* 	<button style="margin: 2rem 0rem;" onclick="addSchedule('${'${index}'} , ${'${date}'}');">일정 추가</button>	
<button class="active" style="margin: 2rem 0rem;" onclick="removeLastSchedule('${'${index}'} , ${'${date}'}');">일정 삭제</button>	 */


//여행 등록
function tripDataInsert(){
	
	console.log("버튼클릭! ");
	
/* 	var inputs = document.querySelectorAll('.newDiv');
	inputs.forEach(function(input) {
	    var date = input.getAttribute('data-id');
	    console.log("여행 등록>> " ,date);
	}); 





	
//	var formSerializeObject = $('#newData').serializeObject(); //serializeObject 아래 함수 확인!
//	var jsonMemberData = JSON.stringify(formSerializeObject);	
//	console.log("jsonMemberData! >>", jsonMemberData);
	
	
	/*
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
	*/
	
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