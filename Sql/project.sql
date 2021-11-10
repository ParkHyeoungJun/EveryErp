create table tbl_boardadmin(
code Number primary key	,
reply varchar2(1)		,--��� ����
answer varchar2(1)		,--��� ����
editor varchar2(1)		,--ckeditor���� ����, �ؽ�Ʈ�ڽ� Ȥ�� �̹���. p_editor����
attach varchar2(1)		,--÷������ ����
declar varchar2(1)		,--�Ű� ���
Notice varchar2(1)		,--���� ����
auth varchar2(1)		,--0�̸� ����, 1�̸� ����(�μ� ����, ����)
title varchar2(100)		,--�Խ��Ǹ�
writer varchar2(20)		,--�����
day date			,--�����
updater varchar2(20)	,--������
updatedate date		,--������
ip varchar2(15)		--���� ���� ������ ���
);

create table tbl_board(
num number primary key	,
code number		,--fk �Խ��ǰ�����ȣ
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
num number		,--fk �Խ��� ��ȣ
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
num number		,--fk �Խ��� ��ȣ
content varchar2(4000)	,
ip varchar2(15)		,
day date			,
writer varchar2(20)		,
updater varchar2(20)	,
updatedate date
);

create table tbl_declar(
idx number primary key	,
num number		,--fk �Խ��� ��ȣ
sel varchar2(10)		,--�Ű��׸�
val varchar2(4000)		,--�Ű� ����
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
zip varchar2(8)		,--�����ȣ
addr1 varchar2(250)	,--�ּ�1
addr2 varchar2(250)	,
phone varchar2(13)		,--����ó(-����)
hp varchar2(13)		,--������ȣ
job varchar2(20)		,--��å
dept varchar2(20)		,--�μ�
day date			--ȸ��������
);

create table tbl_schedule(
num number primary key	,
schedule varchar2(14)	,--������¥
period varchar2(1)		,--0�̸� �Ϻ�, 1�̸� �ֺ�, 2�� ����
title varchar2(250)		,
content varchar2(1000)	,
personal varchar2(1)	--0�̸� ����, 1�̸� �μ� ������, 2�� ��å ������
);

create table tbl_doc(
idx number primary key	,
num number		,--fk ������ �ѹ�. ��å���� �� ��������, �μ����� �� �������� ���� ����
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