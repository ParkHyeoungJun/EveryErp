<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="../includes/clientheader.jsp"%>
<style>
.checkbox {
	width: 20px; /*Desired width*/
	height: 20px; /*Desired height*/
	cursor: pointer;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원가입</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!--<div class="panel-heading">글쓰기</div> -->
			<div class="panel-body container">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
            	<div class="form-group row">
            		<label class="control-label col-1" for="userid">아이디</label>
            		<div class="col-10">
                		<input class="form-control" id="userid" name="userid" maxlength="10" 
                		placeholder="아이디">
					</div>
					<div>
                		<input type="hidden" id="hidduseridcheck" name="hidduseridcheck" value="no">
                		<button id="useridcheck" class="form-control">중복확인</button>
            		</div>
				</div>

            	<div class="form-group row">
            		<label class="control-label col-1" for="userpw">패스워드</label>
            		<div class="col-11">
            			<input class="form-control" id="userpw" name="userpw" type="password" 
            			placeholder="패스워드">
            		</div>
				</div>
            	<div class="form-group row">
            		<label class="control-label col-1" for="userpwe">패스워드확인</label>
            		<div class="col-11">
                		<input class="form-control" id="userpwe" type="password"
                    	name='userpwe'>
            		</div>
            	</div>
            	<div class="form-group row">
            		<label class="control-label col-1" for="username">이름</label>
            		<div class="col-11">
                		<input class="form-control" id="username" name="username" maxlength="10"
                    	placeholder="성명">
            		</div>
            	</div>
            	<div class="form-group row">
            		<label class="control-label col-1" for="sex">성별</label>
            		<div class="btn-group" role="group"
                	aria-label="Basic radio toggle button group">
                		<label style="width: 25px"></label>
                		<div>
                    		<label class="form-check-label">
								<select class="form-control" id="sex" name="sex">
                        			<option value="M" selected="selected">남성</option>
                        			<option value="G">여성</option>
                				</select>
                    		</label>
                		</div>

					</div>
				</div>
				<div class="form-group row">
        			<label class="control-label col-1" for="hp">HP</label>
        			<div class="col-11">
            			<input class="form-control" id="hp" name='hp' maxlength="13">
            		</div>
				</div>
				<div class="form-group row">
        			<label class="control-label col-1" for="phone">phone</label>
        			<div class="col-11">
	            		<input class="form-control" id="phone" name='phone' maxlength="13">
    	        	</div>
        		</div>
        		<div class="form-group row">
            		<label class="control-label col-1" for="birth">birth</label>
            		<div class="col-11">
            			<input class="form-control" id="birth" name='birth' type="date">
            		</div>
        		</div>
        		<div class="form-group row">
	            	<label class="control-label col-1" for="dept">부서</label>
    	        	<div class="col-11">
        	    		<select class="form-control" id="dept" name="dept">
            				<option value="">-----</option>
            			</select>
            		</div>
        		</div>
				<div class="form-group row">
        			<label class="control-label col-1" for="job">직책</label>
            		<div class="col-11">
	            		<select class="form-control" id="job" name="job">
    	        			<option value="">-----</option>
        	    		</select>
            		</div>
        		</div>
				<div class="form-group row">
        			<label class="control-label col-1" for="email">Email</label>
        			<div class="col-11">
	            		<input class="form-control" id="email" name='email'>
    	        	</div>
        		</div>
				<div class="form-group row ">
        			<label class="control-label col-1">우편번호</label>
            		<div class="col-2">
            			<input class="form-control" id="zip" name='zip'>
					</div>

					<div class="col-2">
        				<button id="findzip" class="form-control">주소찾기</button>
        			</div>
				</div>
				<div class="form-group">
					<label class="control-label col-1">주소</label> 
					<input class="form-control" id="addr1" name='addr1'>
				</div>
				<div class="form-group">
					<label class="control-label col-1">주소상세</label> 
					<input class="form-control" id="addr2" name='addr2'>
    			</div>
    			<div class="form-group">
					<button id="save" type="submit" class="btn btn-default">회원가입</button>
					<button id="list" class="btn btn-default">메인화면으로 이동</button>
        		</div>
			</div>
		</div>
	</div>
</div>


<script>
var idcheck = /^[A-Za-z]{1}[A-Za-z0-9]{4,20}$/;
var pwcheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,20}$/;
var emailcheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var phonecheck = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
</script>

<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ready(function() {
	$("#useridcheck").on("click", function() {
		id_check();
	});

	function id_check() {
		//alert()
	 	$.ajax({
	 		type: "POST",
	 	    url: "/member/id_check",
	 	    data :{
	 			userid:$('#userid').val()
	 	    },
			beforeSend : function(xhr) {
	        	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	        },
	 	    success:function(res){
				if($.trim(res)=="ok"){
					if($('#userid').val()!=''){ 
						alert("사용가능한 아이디입니다.");
					} else {
						alert("id를 입력하여 주세요")
					}
				}else{
					if($('#userid').val()!=''){
						alert("중복된 아이디입니다.");
						$('#userid').val('');
						$('#userid').focus();
					}
				}
	 		}
		})
	}
		
	$("#userpw").blur(function() {
		if ($("#userpw").val() != "") {
			return check_passwd($("#userpw").val());			
		}	
	})

	function check_passwd(mbrPwd) {

	    var check1 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{5,20}$/.test(mbrPwd);
	    if (!check1 == true) {
			alert("비밀번호는 영문,숫자,특수문자(!@$%^&* 만 허용)를\n조합하여 5~20자로 구성하세요.");
			return true
	    }
	    if (/(\w)\1\1/.test(mbrPwd) == true) {
			alert("같은 문자를 3번 이상 사용하실 수 없습니다.");
			return true
	    }
	    else {
			return false
		}
	}
	
	$("#email").blur(function() {
		if ($("#email").val() != "") {
			return check_email($("#email").val());			
		}	
	})
	
	function check_email() {
	var emailcheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/.test($("#email").val());
		if (!emailcheck) {
			alert("email 형식을 확인하여 주세요")
			return;
		}
	}

	$("#findzip").on("click", function() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

			document.getElementById('zip').value = data.zonecode;
			document.getElementById("addr1").value = addr;
			document.getElementById("addr2").focus();
			}
		}).open();
	});

	$("#dept").one("click", function() {
		Dept();
	});

	function Dept() {
		$.ajax({
			type : "POST", // HTTP method type(GET, POST) 형식이다.
			url : "/member/dept", // 컨트롤러에서 대기중인 URL 주소이다.
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);

/* 				$('#load').show();
				// 화면의 중앙에 위치하도록 top, left 조정 (화면에 따라 조정 필요)
				$("#hiddenDivLoading").show()//로딩바를 보여주는 부분
				.css({
					top : $(document).scrollTop()
					+ ($(window).height())
					/ 2.6 + 'px',
					left : ($(window).width()) / 2.6
					+ 'px'
				});
				$("#hiddenDivLoading").show(); */
			},
			//data : params, // Json 형식의 데이터이다.
			success : function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				// 응답코드 > 0000
				//alert(res);
				
				$.each(res, function(i, item) {
					$('#dept').append($('<option>', {
						value : item.code,
						text : item.name
					}));
				});
			},
	        error : function(XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	        	alert("통신 실패.")
	        }
	     });
	}

	$("#job").one("click", function() {
		Job();
	});

	function Job() {
		$.ajax({
			type : "POST", // HTTP method type(GET, POST) 형식이다.
			url : "/member/job", // 컨트롤러에서 대기중인 URL 주소이다.
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);

/* 				$('#load').show();
				// 화면의 중앙에 위치하도록 top, left 조정 (화면에 따라 조정 필요)
				$("#hiddenDivLoading").show()//로딩바를 보여주는 부분
				.css({
					top : $(document).scrollTop()
					+ ($(window).height())
					/ 2.6 + 'px',
					left : ($(window).width()) / 2.6
					+ 'px'
				});
				$("#hiddenDivLoading").show(); */
			},
			//data : params, // Json 형식의 데이터이다.
			success : function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
				// 응답코드 > 0000
				//alert(res);
				
				$.each(res, function(i, item) {
					$('#job').append($('<option>', {
						value : item.code,
						text : item.name
					}));
				});
			},
	        error : function(XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	        	alert("통신 실패.")
	        }
		});
	}
	
	$("#save").on("click", function(e) {
    	e.preventDefault();
    	
         if ($("#userid").val() == "") {
        	alert("id을 입력하여 주세요");
            $("#userid").focus();
            return;
        }
        if ($("#userpw").val() == "") {
            alert("비밀번호를 입력하여 주세요");
            $("#userpw").focus();
            return;
        }
        if ($("#userpw").val() != "") {
   			return check_passwd($("#userpw").val());
        }
        if ($("#userpwe").val() == "") {
            alert("비밀번호를 확인하여 주세요");
            $("#userpwe").focus();
            return;
        }
        if ($("#userpw").val() != $("#userpwe").val()) {
        	alert("비밀번호가 일치하지 않습니다");
        	$("#userpw").focus();
        	return;
        }
        if ($("#username").val() == "") {
            alert("성명을 입력하여 주세요");
            $("#username").focus();
            return;
        }
        if ($("#hp").val() == "") {
            alert("hp를 입력하여 주세요");
            $("#hp").focus();
            return;
        }
        if ($("#phone").val() == "") {
            alert("휴대전화 번호를 입력하여 주세요");
            $("#phone").focus();
            return;
        }
        if ($("#birth").val() == "") {
            alert("생년월일을 입력하여 주세요");
            $("#birth").focus();
            return;
        }
        if ($("#dept").val() == "") {
            alert("부서를 입력하여 주세요");
            $("#dept").focus();
            return;
        }
        if ($("#job").val() == "") {
            alert("직책을 입력하여 주세요");
            $("#job").focus();
            return;
        }
        if ($("#email").val() == "") {
            alert("email을 입력하여 주세요");
            $("#email").focus();
            return;
        }
		if ($("#email").val() != "") {
    		return check_email($("#email").val());			
    	}
        if ($("#zip").val() == "") {
            alert("우편번호을 입력하여 주세요");
            $("#zip").focus();
            return;
        }
        if ($("#addr1").val() == "") {
            alert("주소를 입력하여 주세요");
            $("#addr1").focus();
            return;
        }
        if ($("#addr2").val() == "") {
            alert("상세주소를 입력하여 주세요");
            $("#addr2").focus();
            return;
        }  

 		var params = {
			userid : $("#userid").val(),
        	userpw : $("#userpw").val(),
        	username : $("#username").val(),
        	sex : $("#sex").val(),
        	birth : $("#birth").val(),
        	email : $("#email").val(),
        	zip : $("#zip").val(),
        	addr1 : $("#addr1").val(),
        	addr2 : $("#addr2").val(),
        	phone : $("#phone").val(),
        	hp : $("#hp").val(),
        	dept : $("#dept").val(),
        	job : $("#job").val()
		} 
        
        $.ajax({
        	type : "POST", // HTTP method type(GET, POST) 형식이다.
        	url : "/member/register", // 컨트롤러에서 대기중인 URL 주소이다.
        	beforeSend : function(xhr) {
            	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
        	},
        	data : params, // Json 형식의 데이터이다.
        	success : function(res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
            	// 응답코드 > 0000
            	// 
            	alert("저장 되었습니다");
            	//$("#code").val("0");//저장된 객체와 별도로 초기화
            	//Controller 쪽과도 연관
            	//$("#modal").modal("hide"); // 닫기

		},
			error : function(XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
				alert("통신 실패.")
			}
        });
	});//저장
	
	$("#list").on("click", function() {
		
	});
});

</script>

<%@ include file="../includes/clientfooter.jsp"%>