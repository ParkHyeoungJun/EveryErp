<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 등록</h1>
	</div>
</div>

<div class="row">
	<div class=col-lg-12>
		<div class="panel-heading">글쓰기</div>
		<div class="panel-body">
			<form role="form" action="/board/register" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<div class="form-group">
					<label>제목</label><input class="form-control" name='title'>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='content'></textarea>
				</div>
				<div class="form-group">
				<label>작성자</label><input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly="readonly">
				</div>
				<button type="submit" class="btn btn-default">전송</button>
				<button type="reset" class="btn btn-dafault">모두 지우기</button>
			</form>
		</div>
	</div>
</div>

<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					파일 첨부: <input type="file" name="uploadFile" multiple>
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(e){
	var formObj=$("form[role='form']");
	
	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
		
		//첨부파일 첨부한 채로 글등록
		var str="";
		$(".uploadResult ul li").each(function(i,obj){
			var jobj=$(obj);//obj: li 배열
			console.dir(jobj);
			console.log("---------------");
			console.log(jobj.data("filename"));
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].fileName' value='"+jobj.data("filename");
			str+="'>";
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].uuid' value='"+jobj.data("uuid");
			str+="'>";
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].uploadPath' value='"+jobj.data("path");
			str+="'>";
			
			str+="<input type='hidden' name='attachList[";
			str+=i+"].fileType' value='"+jobj.data("type");
			str+="'>";
			
		});
		formObj.append(str).submit();
	});
	
	//첨부파일 등록
	var regex=new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert("파일 크기 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 불가");
			return false;
		}
		return true;
	}
	
	var csrfHeaderName= "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("input[type='file']").change(function(e){
		var formData = new FormData();
		var inputFile=$("input[name='uploadFile']");
		var files=inputFile[0].files;
		
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
			
		}
		$.ajax({
			type:'POST',
			url:'/uploadAjaxAction',
			data:formData,
			beforeSend:function(xhr){
				xhr.setRequestHeader(
						csrfHeaderName,csrfTokenValue);
			},
			processData:false,
			contentType:false,
			dataType:'json',
			success:function(result){
				console.log(result);
				showUploadResult(result);
			}
		});
	});
	
	//showUploadResult메소드
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length ==0){	
			return;
		}
		var uploadUL = $(".uploadResult ul");
		var str="";
		
		$(uploadResultArr).each(function(i,obj){
			var fileCallPath = encodeURIComponent(
				obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName		
			);
			
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			
			str += "<li data-path='";
			str += obj.uploadPath+"' data-uuid='";
			str += obj.uuid+"' data-filename='";
			str += obj.fileName+"' data-type='";
			str += obj.image+"'><div>";
			str += "<img src='/resources/img/attach.png' width='20' height='20'>";
			str += "<span>"+obj.fileName+"</span>";
			str += "<b data-file='"+fileCallPath;
			str += "' data-type='file'>[x]</b>";
			str += "</div></li>";
		});
		uploadUL.append(str);
	}
	
	//첨부파일 삭제
	$(".uploadResult").on("click","b",function(e){
		console.log("delete file");
		
		var targetFile=$(this).data("file");
		var type=$(this).data("type");
		var targetLi=$(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			data:{
				fileName: targetFile,
				type:type
			},
			beforeSend:function(xhr){
				xhr.setRequestHeader(
						csrfHeaderName,csrfTokenValue);
			},
			dataType:'text',
			type:'post',
			success:function(result){
				alert(result);
				targetLi.remove();
			}
		});
	});
	
	
	
});
</script>

<%@ include file="../includes/footer.jsp"%>