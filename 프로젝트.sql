alter session set "_ORACLE_SCRIPT"=TRUE;
create user project identified by "1234";

grant connect,resource,dba to project;
alter user project identified by "1234";

commit;
--게시판 관리 
Create Table tbl_boardAdmin
(
 code Number 	primary key ,
 reply  varchar2(1)		    , 
 answer  varchar2(1)        ,
 editor  varchar2(1)	    , 
 attach  varchar2(1) 	     , 		
 Declar  varchar2(1)         ,
 Notice  varchar2(1)          ,
auth     varchar2(1)         , -- 0 개인 , 1 관리 ,부서 수정 삭제 
Title     varchar2(100)	  , 
writer  varchar2(20)		,
day     Date		, 
updater varchar2(20)	,	
updatedate Date		,
ip varchar2(15)  	
);

Create Table tbl_board
(
  Num Number primary key	,
   code number		, -- fk 
  Title  varchar2(250)	,
  Content clob		, 
  writer  varchar2(20)		,
  day     Date		, 
  updater varchar2(20)	,	
  updatedate Date		,
  ip varchar2(15)  	
);

CREATE SEQUENCE board_seq;


create table tbl_attach(
idx Number primary key,
Num number, --fk,
FileName varchar2(50),
uuid varchar2(50),
writer varchar2(20),
day Date,
updater varchar2(20),
updatedate Date,
ip varchar2(15)
);
CREATE SEQUENCE attack_seq;

create table tbl_reply(
idx Number primary key,
Num number, --fk,
Content varchar2(4000),
writer varchar2(20),
day Date,
updater varchar2(20),
updatedate Date,
ip varchar2(15)
);
CREATE SEQUENCE reply_seq;


create table tbl_Declar(
idx Number primary key,
Num number, --fk,
sel varchar2(10),
val varchar2(4000),
writer varchar2(20),
day Date,
updater varchar2(20),
updatedate Date,
ip varchar2(15)
);
CREATE SEQUENCE Declar_seq;


Create Table tbl_Member
(
userid varchar2(20)		,
userpw varchar2(100)	,
username varchar2(10)	,
sex varchar2(1)		,
birth varchar2(10)		,
email varchar2(250)		, 
zip varchar2(8)		,
addr1	varchar2(250)	,
addr2	varchar2(250)	,
phone	varchar2(13)	,
hp	varchar2(13)	,
dept 	varchar2(20)	,
job	varchar2(20)	,
day     Date
);

Create Table tbl_Schedule
(
Num Number primary key	,
Schedule varchar2(14)		, 
period varchar2(1)		, -- 0 :일별, 1: 주별 , 2:월별 
Title  varchar2(250)		,
Content Varchar2(1000)	,
personal Varchar2(1)	, -- 0 개인 , 1 : 부서 , 2: 직책 
writer  varchar2(20)		,
day     Date		, 
updater varchar2(20)	,	
updatedate Date		,
ip varchar2(15) 
)

Create Table tbl_Doc
(
idx NUMBER primary key	    ,
Num Number		,
FileName varchar2(50)	,
uuid varchar2(50)		,
writer  varchar2(20)	,
day     Date		, 
updater varchar2(20)	,	
updatedate Date		,
ip varchar2(15)  		
);

commit;
