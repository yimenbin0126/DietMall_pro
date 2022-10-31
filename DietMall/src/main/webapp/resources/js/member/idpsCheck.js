window.onload = function () {
    idpass();
    sub();
};

// 아이디, 비밀번호 찾기 (버튼 색 변경)
function idpass() {
    // 아이디 찾기
    document.querySelector("#findid_logo").addEventListener('click', () => {
        document.querySelector(".findid_div").style.display = "block";
        document.querySelector(".findpass_div").style.display = "none";
        document.querySelector("#findid_logo").style.backgroundColor = "gray";
        document.querySelector("#findid_logo").style.color = "white";
        document.querySelector("#findpass_logo").style.backgroundColor = "white";
        document.querySelector("#findpass_logo").style.color = "black";
    });

    // 비밀번호 찾기
    document.querySelector("#findpass_logo").addEventListener('click', () => {
        document.querySelector(".findid_div").style.display = "none";
        document.querySelector(".findpass_div").style.display = "block";
        document.querySelector("#findid_logo").style.backgroundColor = "white";
        document.querySelector("#findid_logo").style.color = "black";
        document.querySelector("#findpass_logo").style.backgroundColor = "gray";
        document.querySelector("#findpass_logo").style.color = "white";
    });
}

// 제출 버튼
function sub() {
    let idCheckform = document.forms.idCheckform;
    let psCheckform = document.forms.psCheckform;

    //유효성 검사 - 이메일, 아이디
    const email_regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    const id_regex = (/^[a-z0-9]{5,20}$/);
    const id_regex2 = (/[a-z]*[0-9]/);

    // 아이디 찾기
    document.querySelector("#idCheck_sub_btn").addEventListener('click', () => {
        if (document.querySelector("#input_id_name").value.length > 1
            && document.querySelector("#input_id_email").value.length != 0
            && email_regex.test(document.querySelector("#input_id_email").value)) {
            alert("잠시후 인증 페이지로 이동합니다.\n본인의 이메일로 전송된 인증코드를 확인해주세요.");
            idCheckform.method="post";
            idCheckform.action="/member/idpsCheck";
            idCheckform.submit();
        } else {
            alert("실명 혹은 이메일 형식이 올바르지 않습니다.");
        }

    });


    // 비밀번호 찾기
    document.querySelector("#psCheck_sub_btn").addEventListener('click', () => {
        if (id_regex.test(document.querySelector("#input_pass_id").value)
            && id_regex2.test(document.querySelector("#input_pass_id").value)) {
            alert("잠시후 비밀번호가 발송됩니다.\n본인의 이메일로 전송된 비밀번호를 확인해주세요.");
            console.log("dㅑ");
            psCheckform.method="post";
            psCheckform.action="/member/idpsCheck";
            psCheckform.submit();
        } else {
            alert("아이디 형식이 올바르지 않습니다.");
        }
    });
}