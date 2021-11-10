create table tbl_boardadmin(
code Number primary key	,
reply varchar2(1)		,--댓글 여부
answer varchar2(1)		,--답글 여부
editor varchar2(1)		,--ckeditor적용 여부, 텍스트박스 혹은 이미지. p_editor참조
attach varchar2(1)		,--첨부파일 여부
declar varchar2(1)		,--신고 기능
Notice varchar2(1)		,--공지 여부
auth varchar2(1)		,--0이면 개인, 1이면 관리(부서 수정, 삭제)
title varchar2(100)		,--게시판명
writer varchar2(20)		,--등록자
day date			,--등록일
updater varchar2(20)	,--수정자
updatedate date		,--수정일
ip varchar2(15)		--보안 상의 이유로 사용
);

create table tbl_board(
num number primary key	,
code number		,--fk 게시판관리번호
title varchar2(250)		,
content clob		,
ip varchar2(15)		,
day date			,
writer varchar2(20)		,
updater varchar2(20)	,
updatedate date
);

create table tbl_attach(
idx number primary key	,
num number		,--fk 게시판 번호
uuid varchar2(50)		,
filename varchar2(50)	,
ip varchar2(15)		,
day date			,
writer varchar2(20)		,
updater varchar2(20)	,
updatedate date
);

create table tbl_reply(
idx number primary key	,
num number		,--fk 게시판 번호
content varchar2(4000)	,
ip varchar2(15)		,
day date			,
writer varchar2(20)		,
updater varchar2(20)	,
updatedate date
);

create table tbl_declar(
idx number primary key	,
num number		,--fk 게시판 번호
sel varchar2(10)		,--신고항목
val varchar2(4000)		,--신고 사유
ip varchar2(15)		,
day date			,
writer varchar2(20)		,
updater varchar2(20)	,
updatedate date
);

create table tbl_member(
userid varchar2(20)		,
userpw varchar2(100)	,
username varchar2(10)	,
sex varchar2(1)		,
birth varchar2(10)		,
email varchar2(250)	,
zip varchar2(8)		,--우편번호
addr1 varchar2(250)	,--주소1
addr2 varchar2(250)	,
phone varchar2(13)		,--연락처(-포함)
hp varchar2(13)		,--내선번호
job varchar2(20)		,--직책
dept varchar2(20)		,--부서
day date			--회원가입일
);

create table tbl_schedule(
num number primary key	,
schedule varchar2(14)	,--일정날짜
period varchar2(1)		,--0이면 일별, 1이면 주별, 2면 월별
title varchar2(250)		,
content varchar2(1000)	,
personal varchar2(1)	--0이면 개인, 1이면 부서 스케줄, 2면 직책 스케줄
);

create table tbl_doc(
idx number primary key	,
num number		,--fk 스케줄 넘버. 직책에서 온 문서인지, 부서에서 온 문서인지 구별 위해
uuid varchar2(50)		,
filename varchar2(50)	,
ip varchar2(15)		,
day date			,
writer varchar2(20)		,
updater varchar2(20)	,
updatedate date
);

create sequence board_seq;
create sequence boardadmin_seq;
create sequence reply_seq;
create sequence attach_seq;
create sequence schedule_seq;
create sequence member_seq;
create sequence doc_seq;
create sequence declar_seq;

commit;