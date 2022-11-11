$(function () {
	file();
    header_file();
    middle_file();
    form();
});

function file () {
	for (const file of document.querySelector('#shi_file').files) {
	    // 파일 내용 읽기
	    var reader = new FileReader();
	    // onload = 읽기 동작이 성공적으로 완료되었을 때
	    reader.onload = function () {
	    	// 개별 파일을 저장
	        reader.readAsDataURL(file);
	    };
	}
	
	for (const file_ of document.querySelector('#middle_file').files) {
	    // 파일 내용 읽기
	    var reader_ = new FileReader();
	    // onload = 읽기 동작이 성공적으로 완료되었을 때
	    reader_.onload = function () {
	    	// 개별 파일을 저장
	        reader_.readAsDataURL(file_);
	    };
	}
}

function header_file() {
	// 선언 - input 파일, 파일 이미지 뷰, 파일이름
	var input_pro = document.querySelector('.s_header_image #shi_file');
	var e_view = document.querySelector('.s_header_image .header_img_preview');
	
	// 이미지 미리보기
	input_pro.addEventListener("change",()=>{
		// input 에 파일이 있는 경우 (첫번째 파일)
		if (input_pro.files && input_pro.files[0]) {
			// 파일 객체를 읽어줌
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      	e_view.src = e.target.result;
				e_view.style.width="400px";
				e_view.style.height="400px";
	    	};
	    	reader.readAsDataURL(input_pro.files[0]);
		  } else {
		  		e_view.style.width="0px";
				e_view.style.height="0px";
		    	e_view.src = "";
		  }	
	});
}

function middle_file() {
	// 선언 - input 파일, 파일 이미지 뷰, 파일이름
	var input_pro_ = document.querySelector('.s_middle_detail_image div #middle_file');
	var e_view_ = document.querySelector('.s_middle_detail_image div .middle_img_preview');
	
	// 이미지 미리보기
	input_pro_.addEventListener("change",()=>{
		// input 에 파일이 있는 경우 (첫번째 파일)
		if (input_pro_.files && input_pro_.files[0]) {
			// 파일 객체를 읽어줌
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      	e_view_.src = e.target.result;
				e_view_.style.width="880px";
	    	};
	    	reader.readAsDataURL(input_pro_.files[0]);
		  } else {
		  		e_view_.style.width="0px";
				e_view_.style.height="0px";
		    	e_view_.src = "";
		  }	
	});
}

function form() {
	document.querySelector('.pp_write_btn').addEventListener('click',(e)=>{
			e.preventDefault();
	        // 폼 변수 저장
    		var formData = new FormData(form_update);
            // ajax 로 폼 데이터 보내기
            $.ajax({
	            url: "/category/detail-update",
	            type: "POST",
	            cache: false,
	            dataType:'text',
	            contentType: false,
          		processData: false,
	            data: formData,
	            success: function(data){
	            	if(data=="통과"){
	            		alert('수정이 완료되었습니다.\n게시판 메인페이지로 돌아갑나디.');
		            	location.href='/category/all';
	            	} else {
	            		alert('입력되지 않은 사항이 있습니다.');
	            	}
	            }
	        }) 
	});
}