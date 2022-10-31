$(function () {
    header_file();
    middle_file();
    form();
});

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
	var input_pro = document.querySelector('.s_middle_detail_image div #middle_file');
	var e_view = document.querySelector('.s_middle_detail_image div .middle_img_preview');
	
	// 이미지 미리보기
	input_pro.addEventListener("change",()=>{
		// input 에 파일이 있는 경우 (첫번째 파일)
		if (input_pro.files && input_pro.files[0]) {
			// 파일 객체를 읽어줌
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      	e_view.src = e.target.result;
				e_view.style.width="880px";
	    	};
	    	reader.readAsDataURL(input_pro.files[0]);
		  } else {
		  		e_view.style.width="0px";
				e_view.style.height="0px";
		    	e_view.src = "";
		  }	
	});
}

function form() {
	document.querySelector('.pp_write_btn').addEventListener('click',(e)=>{
			e.preventDefault();
	        // 폼 변수 저장
    		var formData = new FormData(form_insert);
            // ajax 로 폼 데이터 보내기
            $.ajax({
	            url: "/category/insert",
	            type: "POST",
	            cache: false,
	            dataType:'text',
	            contentType: false,
          		processData: false,
	            data: formData,
	            success: function(data){
	            	if(data=="통과"){
	            		alert('게시물 작성이 완료되었습니다.\n게시판 메인페이지로 돌아갑나디.');
		            	location.href='/category/all';
	            	} else {
	            		alert('입력되지 않은 사항이 있습니다.');
	            	}
	            }
	        }) 
	});
}