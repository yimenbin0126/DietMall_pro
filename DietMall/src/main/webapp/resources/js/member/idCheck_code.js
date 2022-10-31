window.onload = function () {
    confirm();
};

// 인증하기
function confirm() {

    let inputform = document.forms.inputform;
    
    // 인증코드 재발송
    document.querySelector("#re_btn").addEventListener('click', () => {
        $.ajax({
            url: "/member/idCheck_code",
            type: "post",
            data: JSON.stringify({
                "userEmail" : document.querySelector("#userEmail").value,
                "userName" : document.querySelector("#userName").value
            }),
            contentType: "application/json;charset=utf-8",
            dataType: 'text',
            success: function(data){
            	alert("인증코드를 발송했습니다.\n이메일을 확인해주세요.");
	            document.querySelector("#confirmcode").value = data;
            	console.log("인증코드 발송 완료");
            }
        })
    });

    // 인증완료시
    document.querySelector("#sub_btn").addEventListener('click', () => {
        if (document.querySelector("#input_code").value == document.querySelector("#confirmcode").value) {
            alert("인증이 완료되었습니다.");
            complet();
        } else {
            alert("인증번호가 틀립니다.");
        }

    });

    // 인증완료후
    function complet() {

        // 화면 전환
        document.querySelector(".input_page").style.display = "none";
        document.querySelector(".complet_page").style.display = "block";

        // 로그인하기 클릭
        document.querySelector("#btn_log").addEventListener('click', () => {
            location.href = "/member/login";
        });

        // 아이디/비밀번호 찾기 클릭
        document.querySelector("#btn_idpw").addEventListener('click', () => {
            location.href = "/member/idpsCheck";
        });
    }
}