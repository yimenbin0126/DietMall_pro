window.Kakao.init("f41bc8f34ae9bba56964a08b03be4942");

// 카카오 로그인
 function kakaoLogin() {
     window.Kakao.Auth.login({
         scope: 'profile_nickname, profile_image, account_email, gender',
		// 프로필 가져오기 성공
         success: function (authObj) {
             window.Kakao.API.request({
                 url: '/v2/user/me',
                 success: res => {
                 	 var accessToken = Kakao.Auth.getAccessToken(); // 액세스 토큰 할당
            	 	 Kakao.Auth.setAccessToken(accessToken); // 액세스 토큰 사용하게 등록
                     const kakao_account = res.kakao_account;
                     console.log(kakao_account)
                     
                     const url = new URL(window.location.href).searchParams.get('code');
                     console.log(url);
                 }
             });
         }
     });
 }
 
 // 백엔드에 로그인 정보 전달
 function kakaoLogin(input){
	var data = {
		kakaoId: input.id,
		userName: input.kakao_account.name,
		userEmail: input.kakao_account.email,
		userGender: input.kakao_account.gender
		}
	$.ajax({
		type : 'POST',
		data : JSON.stringify(data), //데이터 전송
		url : '/member/join-detail-kakao',
		success : function(data){
			console.log(data)
			if(data.result == "pass"){
				alert("이미 가입된 카카오 계정입니다. \n로그인 해주세요.");
				location.href = '/member/login'
			}else if(data.result == "join"){
				// 회원가입
				document.querySelector("#kakaoId").value = input.id;
				document.querySelector("#kakaoEmail").value = input.kakao_account.email;
				document.querySelector("#kakaoGender").value = input.kakao_account.gender;
				document.querySelector("#kakaoJoinForm").submit();
			}else{
				alert("로그인에 실패했습니다");
			}
			
		},
		error: function(xhr, status, error){
			alert("로그인에 실패했습니다."+error);
		}
	})
};