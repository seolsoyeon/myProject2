$(document).ready(function() {
	
	$('#userId').keyup(function() {
	      
	      var id = $("#userId").val();
	      var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
	      if(id.length<6 || id.length>40){
	         $('#chId').html("6글자 이상 입력");
	         document.getElementById("chId").style.color="red";
	      }else if(regex.test(id) == false) {
	    	  $('#chId').html("잘못된 이메일 형식입니다.");
	      }else {
	       var url = "/myProject2/checkDuplication.do";   //Controller 호출
	       var postString = "";       // post방식으로 처리하기 위한 파라미터들
	       postString   = "userId=" + id;

	   
	    // 이부분부터 비동기통신을 하게 된다. 위에서 설정한 값들을 입력후
	       $.ajax({                          
	           type: "POST",
	           url: url,
	           data: postString,
	           dataType: "html",
	           error:function(xhr,status,e){
	                alert('Error');
	                $('#chId').html("xhr : "+xhr+" / status : "+status+" / e : "+e);
	           },
	           success: function(data) {  //성공시 이 함수를 호출한다.
//	              $('#result').html(data);
	        	   console.log('success data : '+data); //여기까지는 true가 잘 리턴됨,,, 근데 아래 if문을 안먹는다...왜일까......
	              if (jQuery.trim(data) == '"true"') {
	            	  $('#chId').html("사용 가능한 아이디");
	               document.getElementById("chId").style.color="blue";
	            } else if(jQuery.trim(data) == '"false"') {
	               $('#chId').html("사용 불가능한 아이디");
	               document.getElementById("chId").style.color="red";
	            }
	          }
	       
	       });
	      }
	   });
	
	// ========================================= password 글자수 실시간 확인 ... =========================================
	$('#pass').keyup(function() {
		
		var pw = $('#pass').val();
		
		if(pw.length<4 || pw.length>18){
			$('#chPwd').html("4~18 사이로 입력");
			document.getElementById("chPwd").style.color="red";
		} else {
			$('#chPwd').html("");
		}
	});
	
	$('#pass2').keyup(function() {
		
		var pw = $('#pass').val();
		var pw_confirm = $('#pass2').val();
		
		
		if (pw != pw_confirm) {
			$('#chPwd2').html("비밀번호 불일치");
			document.getElementById("chPwd2").style.color="red";
		} else if (pw == pw_confirm) {
			$('#chPwd2').html("비밀번호 일치");
			document.getElementById("chPwd2").style.color="blue";
		} 
		// 아무것도 없을 시 아무글씨 안쓰이게끔 바꿔야하는ㄷ ㅔ ....
//		else if(pw_confirm=="") {
//			var parentNd = $('#user').val();
//			var delNd = parentNd.removeChild($('#pass2'));
//		}
	});
});