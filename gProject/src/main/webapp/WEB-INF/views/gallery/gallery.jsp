<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">


 <!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 
<link rel="stylesheet" href="./css/main.css">
 -->
<!-- header  -->
<jsp:include page="../include/header.jsp" />

<style type="text/css">
	.kFont {
		font-family: "Gowun Dodum", sans-serif;
		font-weight: 400;
		font-style: normal;
	}
	
	.uploadMenu {
		display: grid; 
		grid-template-columns: 1fr 1.5fr 0.4fr 0.4fr;
	}
	
	#photoSelect{
		height: 2.75em;
		width: 95%;
	}
	
/* 파일 업로드 */	
		
	.filebox .upload-name {
	    display: inline-block;
	    box-sizing: border-box;
	    vertical-align: middle;
	   	height: 2.75em;
	    width: 75%;
	    font-weight: bold;
	    border: 1px solid #C5ECFF;
		margin-bottom: 2rem;
		border-radius: 5px;
		
		
	}
	/*  .upload-name:focus {outline:none;}*/

	
	.filebox label {
	    display: inline-block;
	    padding: 9.5px 31px;
	    color: #000;
	    vertical-align: middle;
	    background-color: #ddedec;
	    border: 2px solid #C5ECFF;
	    cursor: pointer;
	    margin-left: 5px;
	    margin-bottom: 2rem;
	    border-radius: 5px;

	}
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
	.photoCheckbox {
    	width: 10px; /* 원하는 너비로 설정 */
    	height: 10px; /* 원하는 높이로 설정 */
	}
	
/* 글자 애니메이션 효과 */	
		
.blink {
	  color: #f35626;
	  background-image: -webkit-linear-gradient(92deg, #f35626, #feab3a);
	  -webkit-background-clip: text;
	  -webkit-text-fill-color: transparent;
	  -webkit-animation: hue 10s infinite linear;
}

@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }
  to {
    -webkit-filter: hue-rotate(-360deg);
  }
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
        
        <!-- Gallery -->
        <section id="galleries">
        <!-- Photo Galleries -->
		<div class="gallery" style="margin-bottom: 200px;">
		
		<!-- Filters -->
		<header>
			<h1>Photo Album</h1>	
			<div id="btnContainer"></div><!-- 앨범 버튼 동적 생성 -->			    
	    </header>

		<div class="uploadMenu">  
			<div id="selectContainer"></div><!-- 앨범명 동적 생성 -->	
			
			<!-- 업로드 파일  -->				
				<div class="filebox">
					<input class="upload-name kFont" value="" placeholder=" 첨부파일" readonly="readonly" id="dataFileName" name="dataFileName">
					<label for="file">파일찾기</label> 
					<input type="file" id="file" name="dataFileUpload" multiple onchange="displaySelectedFiles(this)">
				</div>
			<!-- 업로드 버튼 -->											
			<div style="text-align: right;">
				<input type="button" class="button active kFont" style="width: 90%; height: 2.75em; background-color: #83B1C9;" onclick="dataInsert();" value="upload">
			</div>
			<div style="text-align: right;">
				<input type="button" class="button kFont imgDelete" style="width: 90%; height: 2.75em; background-color: #B97687;" value="선택삭제">
			</div>
		</div>
	    
			<div class="content photoGallery">
			
			  <!-- 사진 위치! -->
			  <span class="blink" style="font-weight: bold; "> &nbsp; <i class="fa-solid fa-camera-retro"></i> &nbsp; 보고싶은 앨범 버튼 클릭 해주세요. </span>
				
			</div>		    
		</div>
		
		</section>
	</section>
</div>
			<div class="copyright">
				Created by: <a href="#">HEO JI HYE</a> &
				Design by: <a href="https://templated.co/">TEMPLATED.CO</a>
			</div>	
			
			
<!-- 모달을 표시할 곳 -->
<div id="imageModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <img src="" id="modalImage" class="img-fluid">
      </div>
    </div>
  </div>
</div>			
				
        
<script type="text/javascript">
$(document).ready(function(){
	photoNmList();
	selectBox();
});


//여행리스트에서 포토명 가져와서 버튼 생성
function photoNmList(){

	    $.ajax({
	        url:'/photoList',
	        type: 'GET',
	        dataType: 'json', 
	        //data : data,        
	        success : function(result){
	            console.log("결과 리스트 >>", result);	            
	            var template = '<ul class="tabs">'; // 템플릿 변수 초기화
	            
	            $.each(result, function(index, item) {
	                // 각 행 추가
	                template += 
			        '<li>'+
			        	'<input type="button" class="button kFont" onclick="photoDetailPage(\'' + item.tl_tripNo + '\')" value="'+item.tl_photoMenuNm+'">'+
			        '</li>';
	            });
	            
	            template += 
			    '</ul>';     	
	
	            // 템플릿을 페이지에 추가
	            $('#btnContainer').empty().append(template);
	        }
	    });
	};
	
//select box 동적 생성
function selectBox(){
	
	$.ajax({
	    url:'/photoList',
	    type: 'GET',
	    dataType: 'json', 
	    success : function(result) {
	        console.log("결과 리스트 >>", result);

	        // select box 요소 선택
	        var selectBox = $('<select class="kFont" id="photoSelect"></select>');
	        
	     // "선택" 옵션 추가
	        var defaultOption = $('<option value="">앨범명 선택</option>');
	        selectBox.append(defaultOption);

	        // 받은 JSON 데이터를 반복하여 select box에 옵션 추가
	        $.each(result, function(index, item) {
	            var option = $('<option></option>');
	            option.val(item.tl_tripNo).text(item.tl_photoMenuNm);
	            selectBox.append(option);
	        });

	        // 생성된 select box를 원하는 곳에 추가
	        $('#selectContainer').append(selectBox);
	    }
	});
	
}

//내용 및 이미지 등록
 function dataInsert(){
	
	 var formData = new FormData();
	 
	 // 여행번호 (선택된 값 가져오기)
	 var selectedValue = $('#photoSelect').val();
	 console.log("선택된 값:", selectedValue);
	 formData.append('tripNo', selectedValue);

	 // 첨부파일명 (여러 파일을 선택한 경우에 대한 처리)
	 var files = $('#file')[0].files;

	 console.log("files>>>", files);

	 for (var i = 0; i < files.length; i++) {
	     formData.append('dataFileUpload', files[i]); // 파일들을 'dataFileUpload'이라는 이름으로 FormData에 추가
	 }

	 console.log("formData>>>", formData);
	 
	 //데이터 여부 확인
	 if(selectedValue == null || selectedValue == ""){
		 alert("등록할 앨범명을 선택해주세요.");
		 return
	 } 
	 
	 if(files.length == 0){
		 alert("업로드할 사진을 입력해주세요.");
		 return		 		 
	 }
	 
	 
	 //console.log("통과!");
	 

	
	$.ajax({
	    url: '/photoInsert',
	    type: 'post',
	    data: formData,
	    processData: false,
	    contentType: false,
	    success: function (result) {
	        console.log("성공>> ", result);
	        alert(result.message);
	        location.href = "gallery?tripNo="+result.tripNo; //페이지로 이동
	        
	        //사진 보여주기!
	        //photoDetailPage(selectedValue);	        
	      
	    },
	    error: function (request, status, error) {
	        alert("실패");
	    }
	});
	
}
 
 
 
	
	
	
//파일명 입력
    function displaySelectedFiles(input) {
        var files = input.files;
        var fileNameList = [];
        for (var i = 0; i < files.length; i++) {
            fileNameList.push(files[i].name);
        }
        document.getElementById('dataFileName').value = fileNameList.join(', ');
    }


//각 버튼 해당 이미지 보여주기	
function photoDetailPage(tripNo) {
    console.log("번호 오니??? >", tripNo);

    let jsonData = { tripNo: tripNo };
    console.log("jsonData >", jsonData);

    //select box와 파일 input 초기화 필요
    $(document).ready(function() {
        $.ajax({
            url: '/photoSelectList',
            type: 'GET',
            dataType: 'json',
            data: jsonData,
            success: function(result) {
                console.log("결과 리스트~~ >>", result);
                var template = "";

                $.each(result, function(index, item) {
                    template +=
                        '<div class=" ">' +
                            '<div class="image-container">' + // 이미지와 체크박스를 포함하는 부모 요소
                                '<input type="checkbox" id="mycheckbox' + index + '" class="photoCheckbox"' +
                                'data-tripno="' + item.pl_tripNo + '" data-photono="' + item.pl_photoNo + '"data-filename="' + item.pl_photoFileNm + '" >' +
                                '<label for="mycheckbox' + index + '">' + // 체크박스에 대응하는 레이블
                                    '<div class="imageLink" data-toggle="modal" data-target="#imageModal" data-image="/fileUpload/' + item.pl_tripNo + '/' + item.pl_photoFileNm + '">' +
                                        '<img src="/fileUpload/' + item.pl_tripNo + '/' + item.pl_photoFileNm + '" alt="" title="" width="321" height="320">' +
                                    '</div>' +
                                '</label>' +
                            '</div>' +
                        '</div>';
                });

                // 템플릿을 페이지에 추가
                $('.photoGallery').empty().append(template);
            }
        });

        // 이미지를 클릭하여 모달 창이 표시될 때에는 체크박스가 선택되지 않도록 처리
        $(document).on('click', '.imageLink', function(e) {
            e.preventDefault(); // 기본 동작 중지
            e.stopPropagation(); // 이벤트 버블링 중지
            // 모달 창 표시 코드 작성
            var imageUrl = $(this).data('image');
            $('#modalImage').attr('src', imageUrl);
            $('#imageModal').modal('show'); // 모달 창 표시
        });

        // 체크박스를 클릭하여 선택되도록 처리
        $(document).on('click', '.photoCheckbox', function(e) {
            e.stopPropagation(); // 이벤트 버블링 중지
        });
    });
}


// 삭제 버튼 클릭 시 선택된 이미지 삭제
$('.imgDelete').click(function() {
    console.log("확인!");
    
    // Array to hold selected data
    var selectedData = [];
    
    $('.photoCheckbox:checked').each(function() {
        var tripNo = $(this).data('tripno');
        var photoNo = $(this).data('photono');
        var filename = $(this).data('filename');
        
        // Add selected data to the array
        selectedData.push({ tripNo: tripNo, photoNo: photoNo, filename: filename });
        
        // Log selected data
        console.log("선택된 이미지 삭제:", tripNo, photoNo, filename);
    });
    
    let reTripNo = selectedData[0].tripNo;
    console.log("tripNo 삭제:", reTripNo);
    
    // Send selected data to server
     $.ajax({
        url: '/photoDelete',
        type: 'POST',
        contentType: 'application/json', // Set content type to JSON
        data: JSON.stringify(selectedData), // Convert selectedData to JSON string
        success: function(result) {
            console.log("결과 리스트~~ >>", result); 
            alert(result.message);
            location.href="/gallery?tripNo="+reTripNo;
            
        }
    }); 
});




/* $('.imgDelete').click(function() {
	console.log("확인!");
    $('.photoCheckbox:checked').each(function() {
        var tripNo = $(this).data('tripno');
        var filename = $(this).data('filename');
        
        
        
        // 여기에 선택된 이미지 삭제하는 코드 추가
        // 예: 서버로 삭제 요청 보내기 또는 UI에서 해당 이미지 제거
        console.log("선택된 이미지 삭제:", tripNo, filename);
  
    });
    
    $.ajax({
        url: '/photoDelete',
        type: 'POST',
        dataType: 'json',
        data: jsonData,
        success: function(result) {
            console.log("결과 리스트~~ >>", result);
           
        }
    });
    
    
    
    
}); */






// 현재 URL 가져오기 (trip List에서 Gallery 버튼 클릭하여 들어온 url)
var currentUrl = window.location.href;

// URL을 파싱하여 tripNo 값을 가져오기
var url = new URL(currentUrl);
var tripNo = url.searchParams.get("tripNo");
if (tripNo) {
    console.log("tripNo 값: " + tripNo);
    photoDetailPage(tripNo);
    
}






</script>



			<!-- Scripts -->
<!-- 			<script src="js/jquery.min.js"></script>
			<script src="js/jquery.poptrox.min.js"></script>
			<script src="js/jquery.scrolly.min.js"></script>
			<script src="js/skel.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script> -->
			




			
</body>
</html>