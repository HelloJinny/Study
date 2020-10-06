window.onload = function() {
	document.getElementById('myForm').onsubmit=function() {
		var output = '';
		var strGender = '';
		var strHobby = '';
				
		var name = document.getElementById('name').value;
		var id = document.getElementById('id').value;
		var pwd = document.getElementById('pwd').value;
		var pwd_check = document.getElementById('pwd_check').value;
		var t0 = document.getElementById('t0').value;
		var t1 = document.getElementById('t1').value;
		var t2 = document.getElementById('t2').value;
		var t3 = document.getElementById('t3').value;
		var job = document.getElementById('job').value;
		var gender = document.getElementsByName('gender');
		var hobby = document.getElementsByName('hobby');
		var memo = document.getElementById('memo').value;

		
/* 성별 */	
		for(var i=0; i<gender.length; i++){
			if(gender[i].checked == true){
				if(gender[i].value == "M"){
					strGender = "남";
				}else{
					strGender = "여";
				}
			}
		}

		
/* 취미 */
		for(var i=0; i < hobby.length; i++){
			if(hobby[i].checked == true){
				if(hobby[i].value == "1"){
					strHobby += '바둑  ';
				}else if(hobby[i].value == "2"){
					strHobby += '게임  ';
				}else if(hobby[i].value == "3"){
					strHobby += '낚시  ';
				}else if(hobby[i].value == "4"){
					strHobby += '독서  ';
				}
			}
		}

		
/* 공백X */
			if (name == '') {
				alert('이름을 입력하세요.') ;
				return false;                    //  입력이 안되어 있으면 submit 이벤트를 중지
			}else if(id == '') {
				alert('아이디를 입력하세요.');
				return false;
			}else if(pwd == '') {
				alert('비밀번호를 입력하세요.');
				return false;
			}else if(pwd_check == '') {
				alert('비밀번호 확인을 입력하세요.')
				return false;
			}else if ( /*t1 == '' ||*/ t2 == '' || t3 == '') {
			  	alert('전화번호를 입력하세요.');
				return false;
			}
			
/* 비밀번호 확인 */			
			if(pwd == pwd_check){
				alert('회원가입성공');
			}else{
				alert('비밀번호를 확인하세요....');
				return false; // 이미 가지고 있는 이벤트 핸들러 제거됨.
			}
							 
			 output += '성명 : '+name+'\n';
			 output += '아이디 : '+id+'\n';
			 output += '비밀번호 : '+pwd+'\n';
			 output += '전화번호 : ' +t0+ ' ' +t1+  '- '+t2+ '-' +t3+ '\n';
			 output += '직업 : '+job+'\n';
			 output += '성별 : '+strGender+'\n';
			 output += '취미 : '+strHobby+'\n';
			 output += '자기 소개 : '+memo+'\n';
						 
			 alert(output);		
	};
};
	
	