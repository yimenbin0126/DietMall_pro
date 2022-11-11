$(function () {
    search();
});

// 검색
function search() {

    // 엔터 시 클릭
	document.querySelector('#search_bar').addEventListener('keydown',function(event){
        if(event.keyCode ==13){
        	event.preventDefault();
            document.querySelector('#search_img').click();
        }
    });
	
	// 검색 이미지 누를 시 실행
	document.querySelector('#search_img').addEventListener('click', ()=>{
		// 검색 타입
		let e_search_type = document.querySelector('#search_bar').value;
		let url = "/category/all?search_type="+e_search_type;
		location.href= url;
	});
}
