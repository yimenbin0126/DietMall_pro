$(function () {
    id_check();

    id_pass();
    birthday();
    gender();
    name();
    email();
    phone();
    enjoy();
});

// 아이디 중복 체크
function id_check() {

    // input 값 변동사항 있을 때
    document.querySelector("#id").addEventListener('change', function () {
    	if(document.querySelector("#idchk_true").style.display == "block"){
	        document.querySelector("#idchk_true").style.display = "none";
	        document.querySelector("#idchk_false").style.display = "none";
    	} 
    });

    // 아이디 중복확인 버튼
    document.querySelector("#idchk").addEventListener('click', function () {
        if (document.querySelector("#id").value.length != 0 && document.querySelector('#id_confirm').style.display == "none") {
			console.log(document.querySelector("#id").value);
            $.ajax({
                url: "/member/idChk",
                type: "post",
                data: {
                	"userId": document.querySelector("#id").value
            	},
                dataType:'json', /* controller로부터 리턴받을 타입 */
                success: function (result) {
                    if (result == 1) {
                        console.log("아이디 중복됨");
                        document.querySelector("#idchk_true").style.display = "none";
                        document.querySelector("#idchk_false").style.display = "block";
                    } else {
                    	console.log(result);
                        console.log("아이디 중복없음");
                        document.querySelector("#idchk_true").style.display = "block";
                        document.querySelector("#idchk_false").style.display = "none";
                    }

                }
            })
        } else {
            alert("아이디를 제대로 입력해주세요!");
        }
    });
}


// 아이디, 패스워드 관리
function id_pass() {



    // 포커스 시 경고
    var contents = [$('#id'), $('#password'), $('#password_more')];
    var confirms = [$('#id_confirm'), $('#psw_confirm'), $('#psw_confirm_more')]

    // 아이디, 비밀번호 입력 확인 (1) - 가능한 단어, 순서상관X, 총 갯수
    const regex = [(/^[a-z0-9]{5,20}$/), (/^[a-zA-Z0-9!@#*]{7,20}$/)]
    // 아이디, 비밀번호 입력 확인 (2) - 필수 단어, 비밀번호 특수문자 포함여부
    const regex2 = [(/[a-z]*[0-9]/), (/[a-z]*[A-Z]*[0-9]*[@!#*]/)]

    //쓰면 안되는 문자
    for (let i = 0; i < contents.length; i++) {
        contents[i].on('focus', function () {
            contents[i].on('keyup', function () {
                // 각각 옵션 넣어주기
                if (i == 0) {
                    if (regex[i].test(contents[i].val()) && regex2[i].test(contents[i].val())) {
                        confirms[i].css('display', 'none');
                    } else {
                        confirms[i].css('display', 'block');
                    }
                } else if (i == 1) {
                    if (regex[i].test(contents[i].val()) && regex2[i].test(contents[i].val())) {
                        confirms[i].css('display', 'none');
                    } else {
                        confirms[i].css('display', 'block');
                    }
                } else {
                    if (contents[i].val() == contents[1].val()) {
                        confirms[i].css('display', 'none');
                    } else {
                        confirms[i].css('display', 'block');
                    }

                }
            });
        }
        )
    };

    // 비밀번호 확인
    $('#content #password_more').on('keydown', function () {
        if ($('#content #password_more').val() != $('#content #password').val()) {
            $('#content #psw_confirm_more').css('display', 'block');
        } else {
            $('#content #psw_confirm_more').css('display', 'none');
        }
    });

}

// 이름 확인
function name() {
    $('#name').on('keydown', function () {
        if ($('#name').val().length == 0) {
            $('#name_confirm').css('display', 'block');
        } else {
            $('#name_confirm').css('display', 'none');
        }
    });
}


// 생년월일 관리
function birthday() {

    // 월 선택지 추가
    for (let i = 1; i <= 12; i++) {
        let j = i
        if (i < 10) {
            j = '0' + i
        }
        let text = '<option value="' + i + '">' + j + '</option>'
        $('#bir_mm select').append(text)
    }

    // 일 선택지 추가
    $("#bir_dd select").append('<option>일</option>')
    $("#bir_mm select").on('click', function () {
        $("#bir_dd select").html('')
        $("#bir_dd select").append('<option>일</option>')

        switch ($("#bir_mm select option:selected").val()) {
            case "1": case "3": case "5": case "7": case "8":
            case "10": case "12": //31일
                for (let a = 1; a <= 31; a++) {
                    let b = a
                    if (a < 10) {
                        b = '0' + a
                    }
                    let text = '<option value="' + a + '">' + b + '</option>'
                    $('#bir_dd select').append(text)
                }
                break
            case "4": case "6": case "9": case "11": //30일
                for (let a = 1; a <= 30; a++) {
                    let b = a
                    if (a < 10) {
                        b = '0' + a
                    }
                    let text = '<option value="' + a + '">' + b + '</option>'
                    $('#bir_dd select').append(text)
                }
                break
            case "2": //28일
                for (let a = 1; a <= 28; a++) {
                    let b = a
                    if (a < 10) {
                        b = '0' + a
                    }
                    let text = '<option value="' + a + '">' + b + '</option>'
                    $('#bir_dd select').append(text)
                }
                break
        }
    }
    )

    // 생년월일 입력 확인

    //연도
    const regex = /^[0-9]/


    $('#bir_yy input').on('keyup', b_init);
    $('#bir_mm select').on('click', b_init);
    $('#bir_dd select').on('click', b_init);


    function b_init() {
        if ($('#bir_yy input').val().length == 4 && regex.test($('#bir_yy input').val()) == true
            && $('#bir_mm select option:selected').val() != "월"
            && $('#bir_dd select option:selected').val() != "일") {
            $('#bir_confirm').css('display', 'none');
        } else {
            $('#bir_confirm').css('display', 'block');
        }
    }
}

// 성별
function gender() {

    $('#gender select').on('click', () => {
        if ($('#gender select').val() == '선택') {
            $('#gender_confirm').css('display', 'block');
        } else {
            $('#gender_confirm').css('display', 'none');
        }
    })
}


// 이메일
function email() {

    // 이메일 형식 확인 - 알파벳+숫자@알파벳+숫자.알파벳+숫자
    const regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

    $('#email input').on('keyup', function () {
        if (regex.test($('#email input').val()) === false) {
            $('#email_confirm').css('display', 'block');
        } else {
            $('#email_confirm').css('display', 'none');
        }
    });
}

// 휴대전화
function phone() {

    // 휴대전화 형식 확인 - 01012345678
    const regex = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

    $('#phone input').on('keyup', function () {
        if (regex.test($('#phone input').val()) === false) {
            $('#phone_confirm').css('display', 'block');
        } else {
            $('#phone_confirm').css('display', 'none');
        }
    });
}

// 가입하기
function enjoy() {

    $('#sub #userjoin').on('click', () => {

        // 초기화
        let id_check = 'N';
        let pass_check = 'N';
        let pass_confirm_check = 'N';
        let birth_check = 'N';
        let gender_check = 'N';
        let email_check = 'N';
        let phone_check = 'N';

        // 아이디
        if (($('#id_confirm').css('display') == 'block' || $('#id').val().length == 0)
        && document.querySelector("#idchk_true").style.display == "none") {
            alert('아이디를 제대로 입력해주세요.');
            document.querySelector('#id').focus();
        } else {
            id_check = 'Y';
            p_check();
        }

        // 비밀번호
        function p_check() {
            if ($('#psw_confirm').css('display') == 'block' || $('#password').val().length == 0) {
                alert('비밀번호를 제대로 입력해주세요.');
                document.querySelector('#password').focus();
            } else {
                console.log("통과")
                pass_check = 'Y';
                p_more_check();
            }
        }


        // 비밀번호 확인
        function p_more_check() {
            if ($('#psw_confirm_more').css('display') == 'block' || $('#password_more').val().length == 0) {
                alert('입력한 비밀번호가 맞지 않습니다.');
                document.querySelector('#password_more').focus();
            } else {
                pass_confirm_check = 'Y';
                b_check();
            }
        }

        // 생년월일
        function b_check() {
            if ($('#bir_confirm').css('display') == 'block' || $('#bir_yy input').val().length == 0) {
                alert('생년월일을 입력해주세요.');
                document.querySelector('#bir_yy input').focus();
            } else {
                birth_check = 'Y';
                g_check();
            }
        }

        // 성별
        function g_check() {
            if ($('#psw_confirm_more').css('display') == 'block' || $('#gender select').val() == '선택') {
                alert('성별을 선택해주세요.');
                document.querySelector('#gender select').focus();
            } else {
                gender_check = 'Y';
                e_check();
            }
        }

        // 이메일
        function e_check() {
            const regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

            if ($('#email_confirm').css('display') == 'block' || regex.test($('#email input').val()) === false) {
                alert('이메일을 제대로 입력해주세요.');
                document.querySelector('#email input').focus();
            } else {
                email_check = 'Y';
                t_check();
            }
        }

        // 휴대전화
        function t_check() {
            const regex = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

            if ($('#phone_confirm').css('display') == 'block' || regex.test($('#phone input').val()) === false) {
                alert('전화번호를 제대로 입력해주세요.');
                document.querySelector('#phone input').focus();
            } else {
                phone_check = 'Y';

            }
        }


        // 가입 완료



    });


}