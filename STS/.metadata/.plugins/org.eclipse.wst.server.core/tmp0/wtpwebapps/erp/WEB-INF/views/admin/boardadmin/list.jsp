<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음. fmt : formatter 형식 맞춰서 표시 -->
<%@ include file="../../includes/adminheader.jsp"%>
리스트
<button id="btnwriter">작성</button>

<div class="modal fade" id="btnwriter" tabindex="-1" role="dialog"
   aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">코드 작성</div>
         <div class="modal-body" align="center">

            <div class="row">
               <div class="form-group row">
                  <label class="control-label col-1" for="email">게시판 제목</label>
                  <div class="col">
                     <input class="form-control" id="title" name='title'>
                  </div>
               </div>
            </div>

         </div>
         <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
         </div>
      </div>
   </div>
</div>
<script src="http://malsup.github.io/jquery.blockUI.js">
<script>
   $(document).ready(function() {
      $("#btnwriter").on("click", function() {
          $.blockUI({ message: $('#btnwriter') });
      });

   });
</script>


<%@ include file="../../includes/adminfooter.jsp"%>