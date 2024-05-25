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
	
	.dateInput {
		height: 2.75em;
	 	appearance: none; 
	    border-radius: 4px;
	    border: solid 1px rgba(25, 181, 254, 0.25);
	    color: #C3C3C3;
	    display: block;
	    outline: 0;
	    padding: 0 1em;
	    text-decoration: none;
	    width: 100%;
	}
	
	input::placeholder {color:#C3C3C3;}
	input::-webkit-input-placeholder {color:#C3C3C3;}
	input:-ms-input-placeholder {color:#C3C3C3;} 
	/* textarea::placeholder {color:#ccc;} */
	/* textarea::-webkit-input-placeholder {color:#ccc;} */
	/* textarea:-ms-input-placeholder {color:#ccc;} */

	
	
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
			<!-- Form -->
			<div class="column" style="margin: auto; margin-bottom: 42px;">
				<h2>planning a trip</h2>
				<form class= "newData" id="newData" name="newData" method="post" onsubmit="return false" enctype="multipart/form-data">
					<div class="field half first kFont">
						<label for="country">나라</label>
						<input class="kFont" name="country" id="country" type="text" placeholder="나라">
					</div>
					<div class="field half kFont">
						<label for="city">도시</label>
						<input class="kFont" name="city" id="city" type="text" placeholder="도시">
					</div>
					<div class="field kFont">
						<label for="title">제목</label>
						<input class="kFont" name="tripTitle" id="tripTitle" type="text" placeholder="제목">
					</div>					
					<div class="field half first kFont">
						<label for="startDate">여행 시작날짜</label>
						<input class="kFont dateInput" name="startDate" id="startDate" type="date" placeholder="YYYY-MM-DD">
					</div>
					<div class="field half kFont">
						<label for="endDate">여행 마지막날짜</label>
						<input class="kFont dateInput" name="endDate" id="endDate" type="date" placeholder="YYYY-MM-DD">
					</div>	
					<div class="field kFont">
						<label for="photoMenuNm">여행 앨범명</label>
						<input class="kFont" name="photoMenuNm" id="photoMenuNm" type="text" placeholder="여행앨범이름">
					</div>	
					<div class="field half first kFont">
						<input class="button kFont" value="취소하기" type="button" style="background-color: #B97687;" onclick="location.href='/tripList'">
					</div>						
					<div class="field half kFont" style="text-align: right;">
						<input class="button kFont" value="등록하기" type="button" style="background-color: #83B1C9;" onclick="tripWrite();">
					</div>											
				</form>
			</div>

        </section>
	
		</section>
	</div>
        
			<div class="copyright">
				Created by: <a href="#">HEO JI HYE</a> &
				Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
			</div>

			<!-- Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.poptrox.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>
			
<script type="text/javascript">

//유효성 테스트
function validation(){
	
	var country = $('#country').val();
	var city = $('#city').val();
	var tripTitle = $('#tripTitle').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var photoMenuNm = $('#photoMenuNm').val();
	
	if(country == null || country == ""){
		 alert("나라를 입력해주세요.");
		 $('#country').focus();
		 return false;
	} 
	 
	if(city == null || city == ""){
		 alert("도시를 입력해주세요.");
		 $('#city').focus();
		 return false;
	} 
	if(tripTitle == null || tripTitle == ""){
		 alert("제목을 입력해주세요.");
		 $('#tripTitle').focus();
		 return false;
	} 
	
	if(startDate == null || startDate == ""){
		alert("여행 시작 날짜를 입력해주세요.");
		$('#startDate').focus();
		return false;
	} 
	
	if(endDate == null || endDate == ""){
		 alert("여행 마지막 날짜를 입력해주세요.");
		 $('#endDate').focus();
		 return false;
	} 
	
	if(photoMenuNm == null || photoMenuNm == ""){
		alert("여행앨범명을 입력해주세요.");
		$('#photoMenuNm').focus();
		return false;
	} 
	
	return true; // 모든 조건 통과
}


function tripWrite(){       
	
    // 데이터 여부 확인
    if (!validation()) {        
        return false; // 이벤트 중지
    }
	//console.log("버튼클릭! ");
	
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