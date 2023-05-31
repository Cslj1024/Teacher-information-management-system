--�������ݿ� LuoJun SQL��䣺
use master
go
if exists (select *from sysdatabases where name='LuoJun07')
drop database LuoJun07
go
create database LuoJun07
on
(
name = 'LuoJun07_data',
filename = 'D:\Win 10 Develop Tools\Program Projects\SQL\SQL Server 2022\LuoJun07_data.mdf',
size = 8 MB,
filegrowth = 20%
)
log on(
name = 'Test_log',
filename = 'D:\Win 10 Develop Tools\Program Projects\SQL\SQL Server 2022\LuoJun07_log.ldf',
size = 4MB,
maxsize = 8MB,
filegrowth = 2MB
)


use LuoJun07
go



----������¼�˻������ݿ��û�����������Ȩ
----ʹ��create��䴴����½�˺� 'LuoJun07' ����Ϊ '928151'
use master
go
create login LuoJun07 
with password ='928151',
default_database=LuoJun07 

--go

----�������ݿ��û����û���Ϊ LuoJun07 
use LuoJun07 
go
create user LuoJun07 
for login LuoJun07 

--go

----Ϊ���ݿ��û�LuoJun07 ����CRUD����Ȩ��
use LuoJun07 
go
grant insert,delete,update,select to LuoJun07 

--go



----����Ժϵ��Ϣ��
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='DepartmentInfo__LuoJun')					-- ���DepartmentInfo���Ѵ��ڣ���ɾ��
drop table DepartmentInfo_LuoJun
go
create table DepartmentInfo_LuoJun						--Ժϵ��Ϣ��
(
Deptno char(8) primary key,							--Ժϵ��ţ�����
Deptname char(32)not null							--Ժϵ���ƣ��ǿ�
);

insert into DepartmentInfo_LuoJun values
('DEP1001','�޿������������ѧ���������ѧԺ'),
('DEP1002','���������˹�����ѧԺ'),
('DEP1003','��������ӹ���ѧԺ'),
('DEP1004','��е����ѧԺ'),
('DEP1005','������ѧԺ'),
('DEP1006','�������ѧԺ'),
('DEP1007','ͨʶ�����������ѧԺ'),
('DEP1008','���˼����ѧԺ');



select *from DepartmentInfo_LuoJun;

--delete from DepartmentInfo;




----����������Ϣ��
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='ClassroomInfo_LiuChang')					-- ���ClassroomInfo���Ѵ��ڣ���ɾ��
drop table ClassroomInfo_LiuChang
go
create table ClassroomInfo_LiuChang
(
Clano char(16) primary key,							--���ұ��
Capacity smallint default 60,						--��������
Equipment char(128),								--�����豸
Form char(8) default '��ͨ����',						--�������� Ĭ������ͨ����
Position char(16) not null,							--����λ�� �ǿ�
FreeTime time default '21:00',						--����ʱ��
check ((Form = '��ͨ����')or(Form = '���ݽ���'))		--���Լ��
);

insert into ClassroomInfo_LiuChang values

('CLA1001',120,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 101','21:00'),
('CLA1002',120,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 102','12:00'),
('CLA1003',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 103','21:00'),
('CLA1004',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 104','12:00'),
('CLA1005',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 105','21:00'),
('CLA1006',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 106','12:00'),
('CLA1007',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 107','21:00'),
('CLA1008',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 108','12:00'),
('CLA1009',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 109','21:00'),
('CLA2001',120,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 201','21:00'),
('CLA2002',120,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 202','12:00'),
('CLA2003',60,'���������ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 203','21:00'),
('CLA2004',60,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 204','12:00'),
('CLA2005',60,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 205','21:00'),
('CLA2006',60,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 206','12:00'),
('CLA2007',60,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 207','21:00'),
('CLA2008',60,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 208','12:00'),
('CLA2009',60,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','��ͨ����','���� 209','21:00'),
('CLA3001',120,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 301','21:00'),
('CLA3002',120,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 302','12:00'),

('CLA3003',60,'�ڰ�,����,������','��ͨ����','���� 303','21:00'),
('CLA3004',60,'�ڰ�,����,������','��ͨ����','���� 304','12:00'),
('CLA3005',60,'�ڰ�,����,������','��ͨ����','���� 305','21:00'),
('CLA3006',60,'�ڰ�,����,������','��ͨ����','���� 306','12:00'),
('CLA3007',60,'�ڰ�,����,������','��ͨ����','���� 307','21:00'),
('CLA3008',60,'�ڰ�,����,������','��ͨ����','���� 308','12:00'),
('CLA3009',60,'�ڰ�,����,������','��ͨ����','���� 309','21:00'),
('CLA4001',120,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 401','21:00'),
('CLA4002',120,'�ڰ�,��ý�����,΢�ͼ����,IC��������,������,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 402','12:00'),
('CLA4003',60,'�ڰ�,����,������','��ͨ����','���� 403','21:00'),
('CLA4004',60,'�ڰ�,����,������','��ͨ����','���� 404','12:00'),
('CLA4005',60,'�ڰ�,����,������','��ͨ����','���� 405','21:00'),
('CLA4006',60,'�ڰ�,����,������','��ͨ����','���� 406','12:00'),
('CLA4007',60,'�ڰ�,����,������','��ͨ����','���� 407','21:00'),
('CLA4008',60,'�ڰ�,����,������','��ͨ����','���� 408','12:00'),
('CLA4009',60,'�ڰ�,����,������','��ͨ����','���� 409','21:00'),

('CLA5001',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 401','19:00'),
('CLA5002',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 402','21:00'),
('CLA5003',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 403','19:00'),
('CLA5004',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 404','21:00'),
('CLA5005',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 405','19:00'),
('CLA5006',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 406','21:00'),
('CLA5007',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 407','19:00'),
('CLA5008',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','��һ 408','21:00'),
('CLA6001',240,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','���ݽ���','���� 503','08:00'),
('CLA6002',60,'�ڰ�,��ý�����,΢�ͼ����,����,������,ͶӰ��,�綯Ļ��,����','��ͨ����','ͼ��� 508','08:00'),
('CLA6003',240,'΢�ͼ����,ͶӰ��,�綯Ļ��,����,������','���ݽ���','���� 503','08:00');


select 
Clano ���ұ��,
Capacity ��������,
Equipment �����豸,
Form ��������,
Position ����λ��,
FreeTime ����ʱ
from ClassroomInfo_LiuChang;

 
--delete from ClassroomInfo;


----�����γ���Ϣ��
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='CourseInfo_ChenXing')-- ���Course���Ѵ��ڣ���ɾ��
drop table CourseInfo_ChenXing
go
create table CourseInfo_ChenXing
(
Cno char(16) primary key,							--�γ̱��
Cname char(64) not null,							--�γ�����
Ccredit smallint,									--�γ�ѧ��	
Ctype char(8) default 'רҵѡ��',						--�γ�����
Cdeptno char(8),									--����Ժϵ 
check (Ctype = 'רҵѡ��' or Ctype = 'רҵ����'),		--���Լ��
foreign key(Cdeptno) references DepartmentInfo_LuoJun(Deptno) --���Լ��
);


insert into CourseInfo_ChenXing values
('COU01','���ǡ����������������',2,'רҵ����','DEP1001'),
('COU02','���ǡ�������˼ά����(C����)',3,'רҵ����','DEP1001'),
('COU03','���ǡ��������߼���·����',3,'רҵ����','DEP1003'),
('COU04','���ǡ���ģ����Ӽ�������',3,'רҵ����','DEP1003'),
('COU05','���ǡ����ߵ���ѧ',5,'רҵ����','DEP1007'),
('COU06','���ǡ������Դ���',3,'רҵ����','DEP1007'),
('COU07','���ǡ�����ѧӢ��',2,'רҵ����','DEP1007'),
('COU08','���ǡ���˼����������뷨�ɻ���',2,'רҵ����','DEP1008'),
('COU09','���ǡ����й�����ʷ��Ҫ',2,'רҵ����','DEP1008'),
('COU10','����ѧϰ������Python��Ŀʵ��',2,'רҵ����','DEP1001'),
('COU11','�������������(C++)',3,'רҵ����','DEP1001'),
('COU12','��ɢ��ѧ',3,'רҵ����','DEP1007'),
('COU13','���ּ���',1,'רҵѡ��','DEP1006'),
('COU14','���������������(Java)',3,'רҵ����','DEP1001'),
('COU15','���ݽṹ���㷨',3,'רҵ����','DEP1001'),
('COU16','������������',3,'רҵ����','DEP1001'),
('COU17','���˼�������ԭ�����',3,'רҵ����','DEP1008'),
('COU18','ë�󶫺��й���ɫ�������������ϵ',5,'רҵ����','DEP1008'),
('COU19','���ݿ�ϵͳ',3,'רҵ����','DEP1001'),
('COU20','����ϵͳԭ��',3,'רҵ����','DEP1001'),
('COU21','��������ԭ��',3,'רҵ����','DEP1001'),
('COU22','�ִ�������������',1,'רҵѡ��','DEP1007'),
('COU23','Webǰ�˿�������',2,'רҵ����','DEP1001'),
('COU24','����ϵͳԭ��',3,'רҵ����','DEP1001'),
('COU25','����Ӧ��д��',2,'רҵ����','DEP1001'),
('COU26','ְҵ����������',2,'רҵ����','DEP1005'),
('COU27','������Գ������',3,'רҵ����','DEP1001'),
('COU28','����ԭ��',3,'רҵ����','DEP1001'),
('COU29','������ѧ',3,'רҵ����','DEP1004'),
('COU30','��������ѧ',3,'רҵ����','DEP1004'),
('COU31','Ƕ��ʽ�߼���������',3,'רҵ����','DEP1001'),
('COU32','51��Ƭ��Ӧ�ü�������',3,'רҵ����','DEP1001'),
('COU33','Springʵս����',3,'רҵ����','DEP1001');

select *from CourseInfo_ChenXing;

--delete from CourseInfo;



----������ʦ��Ϣ��
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='TeacherInfo_LiuQingChao')-- ���Teacher���Ѵ��ڣ���ɾ��
drop table TeacherInfo_LiuQingChao
go

create table TeacherInfo_LiuQingChao
(
Tno char(16) primary key,							--��ʦ���
Tname char(16) not null,							--��ʦ����
Tsex char(2) default '��',							--�Ա�
Tprotitle char(8) default '��ʦ',					--ְ��
Tcourses char(32),									--���ڿγ�
Ttime datetime,										--�ڿ�ʱ��
Tdeptno char(8),									--����Ժϵ
check((Tsex='��') OR (Tsex='Ů')),					--���Լ��
check ((Tprotitle = '��ʦ') or (Tprotitle = '������') or (Tprotitle = '����')),--���Լ��
foreign key(Tdeptno) references DepartmentInfo_LuoJun (Deptno)
);


insert into TeacherInfo_LiuQingChao values
('TEA01','DaiPing','Ů','������','����Ӧ��д��','2023-05-26 09:50:00','DEP1001'),
('TEA02','ChenBing','��','��ʦ','����˼ά����(C����)','2023-05-17 09:50:00','DEP1001'),
('TEA03','WangXiaoNan','Ů','��ʦ','�������������(C++)','2023-05-25 08:00:00','DEP1001'),
('TEA04','HuangYan','��','��ʦ','�ߵ���ѧ','2023-05-23 08:00:00','DEP1007'),
('TEA05','DaiYaFen','Ů','��ʦ','��ѧӢ��','2023-05-27 09:50:00','DEP1007'),
('TEA06','YeWen','��','��ʦ','��ɢ��ѧ','2023-05-24 08:00:00','DEP1007'),
('TEA07','CaiBing','��','��ʦ','����ѧϰ������Python��Ŀʵ��','2023-05-23 14:30:00','DEP1001'),
('TEA08','WangTian','Ů','��ʦ','���ּ���','2023-05-23 19:00:00','DEP1006'),
('TEA09','HanYanyu','Ů','��ʦ','�й�����ʷ��Ҫ','2023-05-24 14:30:00','DEP1008'),
('TEA10','WangYongFeng','��','��ʦ','���������������(Java)','2023-05-23 08:00','DEP1001'),
('TEA11','WuXiang','��','��ʦ','�����߼���·����','2023-05-23 09:50:00','DEP1001'),
('TEA12','HanYanYu','��','��ʦ','���˼�������ԭ�����','2023-05-24 14:30:00','DEP1008'),
('TEA13','ShiJianGuo','��','��ʦ','������������','2023-05-26 14:30','DEP1001'),
('TEA14','ChengFei','Ů','����','���ݽṹ���㷨','2023-05-26 16:20:00','DEP1001'),
('TEA15','LiJun','��','����','���ݿ�ϵͳ','2023-05-24 08:00:00','DEP1001'),
('TEA16','HeJing','Ů','��ʦ','ë�󶫺��й���ɫ�������������ϵ','2023-05-24 09:50:00','DEP1008'),
('TEA17','TaoJieYu','Ů','��ʦ','ְҵ����������','2023-05-26 08:00:00','DEP1005'),
('TEA18','ChenNaiJin','��','����','��������ԭ��','2023-05-28 09:50:00','DEP1001'),
('TEA19','XueMengTing','Ů','��ʦ','�ִ�������������','2023-05-26 19:00:00','DEP1007'),
('TEA20','FengNianRong','��','��ʦ','����ϵͳԭ��','2023-05-24 14:30:00','DEP1001'),
('TEA21','HangChao','��','��ʦ','ģ����Ӽ�������','2023-05-24 08:30:00','DEP1003'),
('TEA22','TangYeJian','��','��ʦ','Webǰ�˿�������','2023-05-24 14:20','DEP1001'),
('TEA23','HuangYan','��','��ʦ','���Դ���','2023-05-25 08:00:00','DEP1007'),
('TEA24','DengRuiJuan','Ů','��ʦ','��������ѧ','2023-05-30 08:00:00','DEP1007'),

('TEA25','�޿�','��','����','������Գ������','2023-05-28 08:00:00','DEP1001'),
('TEA26','���೬','��','������','����ԭ��','2023-05-28 09:50:00','DEP1001'),
('TEA27','����','��','������','Ƕ��ʽ�߼���������','2023-05-28 14:00:00','DEP1001'),
('TEA28','����','��','��ʦ','51��Ƭ��Ӧ�ü�������','2023-05-28 16:20:00','DEP1001'),
('TEA29','ITHeiMa','��','��ʦ','Springʵս����','2023-05-28 19:00:00','DEP1001');



select *from  TeacherInfo_LiuQingChao;

--delete from TeacherInfo;


----����Ժϵ���Ұ��ű�
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME=' CourseArrangementInfo')-- ���Depart_class���Ѵ��ڣ���ɾ��
drop table  CourseArrangementInfo
go

create table  ClassArrangementInfo
(
Tno char(16) ,--��ʦ���
Clano char(16) ,--���ұ��
Cno char(16) ,--�γ̱��
Classtime datetime,--�Ͽ�ʱ��
Deptno char(8),--Ժϵ���
Freetime_begin time,--���п�ʼʱ��
Freetime_end time,--���н���ʱ��
foreign key(Tno) references TeacherInfo_LiuQingChao (Tno),
foreign key(Clano) references ClassroomInfo_LiuChang (Clano),
foreign key(Cno) references CourseInfo_ChenXing(Cno),
foreign key(Deptno) references DepartmentInfo_LuoJun (Deptno),
);


insert into ClassArrangementInfo values
('TEA25','CLA1001','COU27','2023-05-28 08:00:00','DEP1001','20:40:00','23:40:00'),
('TEA26','CLA1001','COU28','2023-05-28 09:50:00','DEP1001','20:40:00','23:40:00'),
('TEA27','CLA1001','COU31','2023-05-28 14:00:00','DEP1001','20:40:00','23:40:00'),
('TEA28','CLA1001','COU32','2023-05-28 16:20:00','DEP1001','20:40:00','23:40:00'),
('TEA29','CLA1001','COU33','2023-05-28 19:00:00','DEP1001','20:40:00','23:40:00');

select *from ClassArrangementInfo;

----��ѯ�н�������Ϊ���ݽ��ҵĽ��ұ�ż���λ��
use LuoJun07
go
create view v_ClassroomInfo_JieTi_LuoJun
as
select ClassroomInfo_LiuChang.Clano ���ұ��,ClassroomInfo_LiuChang.Position ����λ��
from  ClassroomInfo_LiuChang
where  ClassroomInfo_LiuChang.Form='���ݽ���';

select *from v_ClassroomInfo_JieTi_LuoJun;

----��ѯ���ڽ��ұ��ΪCLA1001�ڹ��εĽ�ʦ��š�ְ�ơ����������ڿγ�

use LuoJun07
go
create view v_ClassUseCLA1001_TeacherInfo_LiuChang
as
select TeacherInfo_LiuQingChao.Tno ��ʦ��� ,TeacherInfo_LiuQingChao.Tname ��ʦ����,TeacherInfo_LiuQingChao.Tprotitle ��ʦְ��,TeacherInfo_LiuQingChao.Tcourses ���ڿγ�
from TeacherInfo_LiuQingChao where TeacherInfo_LiuQingChao.Tno in(select ClassArrangementInfo.Tno from ClassArrangementInfo where Clano='CLA1001');


select *from v_ClassUseCLA1001_TeacherInfo_LiuChang;

drop view v_ClassUseCLA1001_TeacherInfo_LiuChang;

----��ѯ����λ����������ͷ�Ŀ���ʱ��

use LuoJun07
go
create view v_ClassFreeTime_LiuQingChao
as
select distinct FreeTime ����ʱ�� from  ClassroomInfo_LiuChang 
where Position like '����_%';

select *from v_ClassFreeTime_LiuQingChao;

create trigger tr_TeacherInfoInsert_ChenXing
on TeacherInfo_LiuQingChao
after  delete,update,insert
as 
begin
select * from inserted
select * from deleted 
end



insert into TeacherInfo_LiuQingChao values
('TEA30','�����ͽ �޿�','��','����','�̷�ѧ','2023-06-01 08:00:00','DEP1008');


----������ұ�ţ���ѯ����λ��
use LuoJun07
go
create proc pro_ClassPosition_LuoJun
@clano char(16),
@position char(16) =null output
as
begin

select  Position ����λ�� from  ClassroomInfo_LiuChang
where Clano=@clano
end

exec pro_ClassPosition_LuoJun 'CLA1001'

--drop proc pro_ClassPosition


----������ұ�ţ���ѯ���ҿ���ʱ��
use LuoJun07
go
create proc pro_ClassFreeTime_LuoJun
@clano char(16)
as
begin
select  FreeTime ����ʱ�� from  ClassroomInfo_LiuChang
where Clano=@clano
end

exec pro_ClassFreeTime_LuoJun 'CLA1001'

----��������,����������������ؽ���λ��
use LuoJun07
go
create function f_ClassPosition_LuoJun(@capacity smallint)
returns table
as
return (select Position from ClassroomInfo_LiuChang where Capacity=@capacity)

select *from f_ClassPosition_LuoJun(120);


--drop function f_ClassPosition_LuoJun