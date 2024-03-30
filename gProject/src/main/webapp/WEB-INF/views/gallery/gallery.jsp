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


 <link rel="stylesheet" href="<c:url value='./css/main.css'/>">

<!-- header  -->
<jsp:include page="../include/header.jsp" />

<style type="text/css">
	.kFont {
		font-family: "Gowun Dodum", sans-serif;
		font-weight: 400;
		font-style: normal;
	}
	
/* 파일 업로드 */	
		
	.filebox .upload-name {
	    display: inline-block;
	   	height: 35px; 
	    padding: 0 10px;
	    vertical-align: middle;
	    width: 65%;
	    font-weight: bold;
	    border: 0;
	    box-sizing: border-box;
	}
	.upload-name:focus {outline:none;}
	
	.filebox label {
	    display: inline-block;
	    padding: 8px 31px;
	    color: #000;
	    vertical-align: middle;
	    background-color: #E2F0D9;
	    border: 2px solid #B2D69A;
	    cursor: pointer;
	    margin-left: 10px;   
	}
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
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
		<div class="gallery">
		
		<!-- Filters -->
		<header>
			<h1>Gallery</h1>	
			<div id="btnContainer"></div><!-- 앨범 버튼 동적 생성 -->			    
	    </header>

		<div>
			<div id="selectContainer"></div><!-- 앨범명 동적 생성 -->	
			
			<!-- 업로드 파일  -->				
				<div class="filebox">
					<input class="upload-name" value="" placeholder="첨부파일" readonly="readonly" id="dataFileName" name="dataFileName">
					<label for="file">파일찾기</label> 
					<input type="file" id="file" name="dataFileUpload" multiple onchange="displaySelectedFiles(this)">
				</div>
			<!-- 업로드 버튼 -->											
			<input type="button" class="button active kfont" onclick="dataInsert();" value="upload">
		</div>
	    
			<div class="content photoGallery">
			
			    <div class="media all people">
			    <!--     <a href="" style="outline: 0px;">
			        	<img src="/fileUpload/trip_005/c239ccea-d6e4-44c7-83e7-d783f5920d2f_vl19.jpg" alt="" title="" width="450" height="450">
			        </a>
			<!-- 	</div>
				<div class="media all place">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/05.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all thing">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/09.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all people">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/02.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all place">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/06.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all thing">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/10.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all people">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/03.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all place">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/07.jpg" alt="" title="" width="450" height="450">
				    </a>
				</div>
				<div class="media all thing">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/11.jpg" alt="" title="">
				    </a>
				</div>
				<div class="media all people">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/04.jpg" alt="" title="">
				    </a>
				</div>
				<div class="media all place">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/08.jpg" alt="" title="">
				    </a>
				</div>
				<div class="media all thing">
				    <a href="" style="outline: 0px;">
				    	<img src="images/thumbs/12.jpg" alt="" title="">
				    </a>
				</div> -->
				
			</div>		    
		</div>
		</section>
	</section>
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
	        var selectBox = $('<select id="photoSelect"></select>');
	        
	     // "선택" 옵션 추가
	        var defaultOption = $('<option value="">선택</option>');
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

	
	$.ajax({
	    url: '/photoInsert',
	    type: 'post',
	    data: formData,
	    processData: false,
	    contentType: false,
	    success: function (result) {
	        console.log("성공>> ", result);
	        alert(result.message);
	        //location.href = "/data/dataSearch.do"; //페이지로 이동
	        
	        //사진 보여주기!
	        photoDetailPage(selectedValue);
	        
	        

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

	let jsonData = { tripNo: tripNo }; // tripNo를 객체의 속성 이름으로 사용
	console.log("jsonData >", jsonData);
	 
	//select box와 파일 input 초기화 필요
		$.ajax({
		    url:'/photoSelectList',
		    type: 'GET',
		    dataType: 'json',
		    data: jsonData,
	        success : function(result){
	            console.log("결과 리스트~~ >>", result);	            
	            var template = "";
	            
	            $.each(result, function(index, item) { //item.pl_photoFileNm
	            	template += 
	        		'<div class="media all place">'+
	        	    	'<a href="" style="outline: 0px;">'+
	        	    	'<img src="/fileUpload/' + item.pl_tripNo + '/' + item.pl_photoFileNm + '" alt="" title="" width="450" height="450">'+
	        	    	'</a>'+
	        		'</div>';     
	          });
  
	            // 템플릿을 페이지에 추가
	            $('.photoGallery').empty().append(template);
			}	
		});
	
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