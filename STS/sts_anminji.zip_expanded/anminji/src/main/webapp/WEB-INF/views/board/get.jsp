<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 읽기</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">

				<div class="form-group">
					<label>게시물번호</label><input class="form-control" name="bno"
						value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					제목<input class="form-control" name='title'
						value="<c:out value='${board.title}'/>" readonly="readonly">
				</div>
				<div class="form-group">
					내용
					<textarea class="form-control" rows='3' name="content"
						readonly="readonly"><c:out value="${board.content}" /></textarea>
				</div>
				<div class="form-group">
					작성자<input class="form-control" name='writer'
						value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>
				<sec:authentication property="principal" var="pinfo"/>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq board.writer}">
						<button data-oper="modify" class="btn btn-warning" id="boardModBtn">수정</button>
					</c:if>
				</sec:authorize>
				
				<button data-oper="list" class="btn btn-info" id="boardListBtn">목록</button>

				<form action="/board/modify" method="get" id="operForm">
					<input type='hidden' id="bno" name="bno" value="${board.bno}" /> <input
						type="hidden" name="pageNum" value="${cri.pageNum}" /> <input
						type="hidden" name="amount" value="${cri.amount}" /> <input
						type="hidden" name="type" value="${cri.type}"> <input
						type="hidden" name="keyword" value="${cri.keyword}">
				</form>
			</div>
		</div>
	</div>
</div>

<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">첨부파일</div>
			<div class="panel-body">
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 댓글 부분 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<br /> <i class="fa fa-comments fa-fw"></i>댓글
				<sec:authorize access="isAuthenticated()">
					<button id="addReplyBtn" class="btn btn-primary btn-xs float-right">새
						댓글</button>
				</sec:authorize>
			</div>
			<br /> <br />
			<div class="panel-body">
				<ul class="chat">
					<li>댓글 예시</li>
				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>

<!-- 댓글 모달창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				&times;
				<h4 class="modal-title" id="myModalLabel">댓글 창</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글</label><input class="form-control" name="reply"
						value="새 댓글">
				</div>
				<div class="form-group">
					<label>작성자</label><input class="form-control" name="replyer"
						value="replyer">
				</div>
				<div class="form-group">
					<label>댓글 작성일</label><input class="form-control" name="replyDate"
						value="">
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btnwarning" type="button" id="modalModBtn">수정</button>
				<button class="btn btndanger" type="button" id="modalRemoveBtn">삭제</button>
				<button class="btn btnprimary" type="button" id="modalRegisterBtn">등록</button>
				<button class="btn btndefault" type="button" id="modalCloseBtn">닫기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
	$(document).ready(function() {
		var formObj = $("form");

		//댓글작성자와 계정을 일치시키기
		var replyer=null;
		<sec:authorize access="isAuthenticated()">
			replyer="${pinfo.username}";
		</sec:authorize>
		
		var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue="${_csrf.token}";
		
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		$('#boardModBtn').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log(operation);

			if (operation === 'modify') {
				formObj.attr("action", "/board/modify");
			}
			formObj.submit();

		});
		
		$('#boardListBtn').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log(operation);

			if (operation === 'list') {
				formObj.attr("action", "/board/list");
				formObj.find("#bno").remove();
			}
			formObj.submit();

		});
		
		//댓글(게시글 읽으면 자동 댓글 등록)
		var bnoValue = '<c:out value="${board.bno}"/>';

//		replyService.add({
//			reply : "js test",
//			replyer : "tester",
//			bno : bnoValue
//		}, function(result) {
//			alert("result: " + result);
//		});

		//댓글 모달
		var modal=$("#myModal");
		var modalInputReplyDate= modal.find("input[name='replyDate']");
		var modalRegisterBtn=$("#modalRegisterBtn");
		var modalInputReply=modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		
		//모달창 표시
		$("#addReplyBtn").on("click",function(e){
			e.preventDefault();
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			modal.find("input[name='replyer']").val(replyer);
			modal.find("input[name='replyer']").attr("readonly","readonly");
			
			modalRegisterBtn.show();
			$("#myModal").modal("show");
			
		});
		
		//모달창 닫기
		$("#modalCloseBtn").on("click",function(e){
			modal.modal("hide");
		})
		
		//모달창 등록
		modalRegisterBtn.on("click",function(e){
			var reply={
					reply:modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					bno : bnoValue
			};
			console.log(reply)
			
			replyService.add(reply,function(result){//reply.js의 메소드
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(-1);
			});
		});
		
		//댓글 리스트
//		replyService.getList({
//			bno:bnoValue,
//			page:1
//		},function(list){
//			for(var i=0,len=list.length||0;i<len;i++){
//				console.log(list[i]);
//			}
//		});		
		var replyUL = $(".chat");
		
		function showList(page){
			replyService.getList({
				bno:bnoValue,
				page:page||1
			},function(replyTotalCnt,list){
				console.log("replyCnt: "+replyTotalCnt);
				
				if(page==-1){
					pageNum=Math.ceil(replyTotalCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str="";
				if(list==null||list.length==0){
					replyUL.html("");
					return;
				}
				for(var i=0,len=list.length||0;i<len;i++){
					str+="<li class='left ";
					str+="clearfix' data-rno='";
					str+=list[i].rno+"'>";
					str += "<div><div class='header' ";
					str+="><strong class='";
					str+="primary-font'>";
					str += list[i].replyer + "</strong>";
					str += "<small class='float-sm-right '>";
					str += replyService.displayTime(list[i].replydate) + "</small></div>";
					str += "<p>" + list[i].reply;
					str += "</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(replyTotalCnt);
			});
		}
		showList(-1);
		
		//showReplyPage메소드
		var pageNum=1;
		var replyPageFooter=$(".panel-footer");
		
		function showReplyPage(replyCnt){
			var endNum=Math.ceil(pageNum/10.0)*10;
			var startNum=endNum-9;
			var prev=startNum!=1;
			var next=false;
			
			if(endNum*10>=replyCnt){
				endNum=Math.ceil(replyCnt/10.0);
			}
			if(endNum*10<replyCnt){
				next=true;
			}
			var str="<ul class='pagination";
			str+=" justify-content-center'>";
			if(prev){
				str+="<li class='page-item'><a ";
				str+="class='page-link' href='";
				str+=(startNum-1);
				str+="'>이전</a></li>";
			}
			for(var i = startNum; i<= endNum;i++){
				var active= pageNum == i ? "active" : "";
				str+="<li class='page-item "+active+"'><a class='page-link' ";
				str+="href='"+i+"'>"+i+"</a></li>";
			}
			if(next){
				str+="<li class='page-item'>";
				str+="<a class='page-link' href='";
				str+= (endNum+1)+"'>다음</a></li>";
			}
			str+="</ul>";
			console.log(str);
			replyPageFooter.html(str);
		}
		
		//페이징 클릭 시 처리
		replyPageFooter.on("click","li a",function(e){
			e.preventDefault();
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			showList(pageNum);
		});
		
		//댓글 읽기
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		
		$(".chat").on("click","li",function(e){
			var rno=$(this).data("rno");
			console.log(rno);
			
			replyService.get(rno,function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replydate)).attr("readonly","readonly");
				modal.data("rno",reply.rno);
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				$("#myModal").modal("show");
			});
		});
		
		//댓글 수정
		modalModBtn.on("click",function(e){
			var originalReplyer = modalInputReplyer.val();
			
			var reply={
					rno:modal.data("rno"),
					reply:modalInputReply.val(),
					replyer:originalReplyer
			};
			
			if(!replyer){
				alert("로그인 후 수정 가능");
				modal.modal("hide");
				return;
			}
			if(replyer != originalReplyer){
				alert("자신이 작성한 댓글만 수정 가능");
				modal.modal("hide");
				return;
			}
			
			replyService.update(reply,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		//댓글삭제
		modalRemoveBtn.on("click",function(e){
			var rno=modal.data("rno");
			var originalReplyer=modalInputReplyer.val();
			
			if(!replyer){
				alert("로그인 후 삭제 가능");
				modal.modal("hide");
				return;
			}
			if(replyer!=originalReplyer){
				alert("자신이 작성한 댓글만 삭제 가능");
				modal.modal("hide");
				return;
			}
			
			replyService.remove(rno,function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		//첨부파일 목록표시
		(function(){
			var bno='<c:out value="${board.bno}"/>';
			
			$.getJSON("/board/getAttachList",{bno:bno},function(arr){
				console.log(arr);
				
				var str="";
				$(arr).each(function(i,attach){
					str+="<li data-path='";
					str+=attach.uploadPath+"' data-uuid='";
					str+=attach.uuid+"' data-filename='";
					str+=attach.fileName+"' data-type='";
					str+=attach.fileType+"'><div>";
					str+="<img src='/resources/img/attach.png' width='20' height='20'>";
					str+="<span>"+attach.fileName+"</span><br/>";
					str+="</div></li>";
				});
				$(".uploadResult ul").html(str);
			});
		})();
		
		//첨부파일 다운로드
		$(".uploadResult").on("click","li",function(e){
			console.log("download file");
			
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			self.location="/download?fileName="+path;//url설정
		});
		
		
	});
</script>


<%@ include file="../includes/footer.jsp"%>