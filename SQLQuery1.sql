--创建数据库 LuoJun SQL语句：
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



----创建登录账户和数据库用户，并进行授权
----使用create语句创建登陆账号 'LuoJun07' 密码为 '928151'
use master
go
create login LuoJun07 
with password ='928151',
default_database=LuoJun07 

--go

----创建数据库用户，用户名为 LuoJun07 
use LuoJun07 
go
create user LuoJun07 
for login LuoJun07 

--go

----为数据库用户LuoJun07 赋予CRUD访问权限
use LuoJun07 
go
grant insert,delete,update,select to LuoJun07 

--go



----创建院系信息表
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='DepartmentInfo__LuoJun')					-- 如果DepartmentInfo表已存在，先删除
drop table DepartmentInfo_LuoJun
go
create table DepartmentInfo_LuoJun						--院系信息表
(
Deptno char(8) primary key,							--院系编号，主键
Deptname char(32)not null							--院系名称，非空
);

insert into DepartmentInfo_LuoJun values
('DEP1001','罗骏——计算机科学与软件工程学院'),
('DEP1002','大数据与人工智能学院'),
('DEP1003','电气与电子工程学院'),
('DEP1004','机械工程学院'),
('DEP1005','管理工程学院'),
('DEP1006','艺术设计学院'),
('DEP1007','通识教育与外国语学院'),
('DEP1008','马克思主义学院');



select *from DepartmentInfo_LuoJun;

--delete from DepartmentInfo;




----创建教室信息表
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='ClassroomInfo_LiuChang')					-- 如果ClassroomInfo表已存在，先删除
drop table ClassroomInfo_LiuChang
go
create table ClassroomInfo_LiuChang
(
Clano char(16) primary key,							--教室编号
Capacity smallint default 60,						--教室容量
Equipment char(128),								--教室设备
Form char(8) default '普通教室',						--教室类型 默认是普通教室
Position char(16) not null,							--教室位置 非空
FreeTime time default '21:00',						--空闲时间
check ((Form = '普通教室')or(Form = '阶梯教室'))		--检查约束
);

insert into ClassroomInfo_LiuChang values

('CLA1001',120,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 101','21:00'),
('CLA1002',120,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 102','12:00'),
('CLA1003',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 103','21:00'),
('CLA1004',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 104','12:00'),
('CLA1005',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 105','21:00'),
('CLA1006',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 106','12:00'),
('CLA1007',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 107','21:00'),
('CLA1008',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 108','12:00'),
('CLA1009',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 109','21:00'),
('CLA2001',120,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 201','21:00'),
('CLA2002',120,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 202','12:00'),
('CLA2003',60,'刘畅——黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 203','21:00'),
('CLA2004',60,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 204','12:00'),
('CLA2005',60,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 205','21:00'),
('CLA2006',60,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 206','12:00'),
('CLA2007',60,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 207','21:00'),
('CLA2008',60,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 208','12:00'),
('CLA2009',60,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','普通教室','西三 209','21:00'),
('CLA3001',120,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 301','21:00'),
('CLA3002',120,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 302','12:00'),

('CLA3003',60,'黑板,讲桌,课桌椅','普通教室','西三 303','21:00'),
('CLA3004',60,'黑板,讲桌,课桌椅','普通教室','西三 304','12:00'),
('CLA3005',60,'黑板,讲桌,课桌椅','普通教室','西三 305','21:00'),
('CLA3006',60,'黑板,讲桌,课桌椅','普通教室','西三 306','12:00'),
('CLA3007',60,'黑板,讲桌,课桌椅','普通教室','西三 307','21:00'),
('CLA3008',60,'黑板,讲桌,课桌椅','普通教室','西三 308','12:00'),
('CLA3009',60,'黑板,讲桌,课桌椅','普通教室','西三 309','21:00'),
('CLA4001',120,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 401','21:00'),
('CLA4002',120,'黑板,多媒体机柜,微型计算机,IC卡控制器,读卡器,投影仪,电动幕布,音箱,课桌椅','阶梯教室','西三 402','12:00'),
('CLA4003',60,'黑板,讲桌,课桌椅','普通教室','西三 403','21:00'),
('CLA4004',60,'黑板,讲桌,课桌椅','普通教室','西三 404','12:00'),
('CLA4005',60,'黑板,讲桌,课桌椅','普通教室','西三 405','21:00'),
('CLA4006',60,'黑板,讲桌,课桌椅','普通教室','西三 406','12:00'),
('CLA4007',60,'黑板,讲桌,课桌椅','普通教室','西三 407','21:00'),
('CLA4008',60,'黑板,讲桌,课桌椅','普通教室','西三 408','12:00'),
('CLA4009',60,'黑板,讲桌,课桌椅','普通教室','西三 409','21:00'),

('CLA5001',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 401','19:00'),
('CLA5002',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 402','21:00'),
('CLA5003',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 403','19:00'),
('CLA5004',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 404','21:00'),
('CLA5005',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 405','19:00'),
('CLA5006',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 406','21:00'),
('CLA5007',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 407','19:00'),
('CLA5008',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','东一 408','21:00'),
('CLA6001',240,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','阶梯教室','西二 503','08:00'),
('CLA6002',60,'黑板,多媒体机柜,微型计算机,讲桌,课桌椅,投影仪,电动幕布,音箱','普通教室','图书馆 508','08:00'),
('CLA6003',240,'微型计算机,投影仪,电动幕布,音箱,课桌椅','阶梯教室','东二 503','08:00');


select 
Clano 教室编号,
Capacity 容纳人数,
Equipment 教室设备,
Form 教室类型,
Position 教室位置,
FreeTime 空闲时
from ClassroomInfo_LiuChang;

 
--delete from ClassroomInfo;


----创建课程信息表
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='CourseInfo_ChenXing')-- 如果Course表已存在，先删除
drop table CourseInfo_ChenXing
go
create table CourseInfo_ChenXing
(
Cno char(16) primary key,							--课程编号
Cname char(64) not null,							--课程名称
Ccredit smallint,									--课程学分	
Ctype char(8) default '专业选修',						--课程类型
Cdeptno char(8),									--开课院系 
check (Ctype = '专业选修' or Ctype = '专业必修'),		--检查约束
foreign key(Cdeptno) references DepartmentInfo_LuoJun(Deptno) --外键约束
);


insert into CourseInfo_ChenXing values
('COU01','陈星——计算机基础技能',2,'专业必修','DEP1001'),
('COU02','陈星——计算思维导论(C语言)',3,'专业必修','DEP1001'),
('COU03','陈星——数字逻辑电路基础',3,'专业必修','DEP1003'),
('COU04','陈星——模拟电子技术基础',3,'专业必修','DEP1003'),
('COU05','陈星——高等数学',5,'专业必修','DEP1007'),
('COU06','陈星——线性代数',3,'专业必修','DEP1007'),
('COU07','陈星——大学英语',2,'专业必修','DEP1007'),
('COU08','陈星——思想道德修养与法律基础',2,'专业必修','DEP1008'),
('COU09','陈星——中国近代史纲要',2,'专业必修','DEP1008'),
('COU10','机器学习基础与Python项目实践',2,'专业必修','DEP1001'),
('COU11','面向对象程序设计(C++)',3,'专业必修','DEP1001'),
('COU12','离散数学',3,'专业必修','DEP1007'),
('COU13','音乐鉴赏',1,'专业选修','DEP1006'),
('COU14','智能软件开发基础(Java)',3,'专业必修','DEP1001'),
('COU15','数据结构与算法',3,'专业必修','DEP1001'),
('COU16','计算机网络基础',3,'专业必修','DEP1001'),
('COU17','马克思主义基本原理概论',3,'专业必修','DEP1008'),
('COU18','毛泽东和中国特色社会主义理论体系',5,'专业必修','DEP1008'),
('COU19','数据库系统',3,'专业必修','DEP1001'),
('COU20','操作系统原理',3,'专业必修','DEP1001'),
('COU21','计算机组成原理',3,'专业必修','DEP1001'),
('COU22','现代教育技术基础',1,'专业选修','DEP1007'),
('COU23','Web前端开发基础',2,'专业必修','DEP1001'),
('COU24','操作系统原理',3,'专业必修','DEP1001'),
('COU25','工程应用写作',2,'专业必修','DEP1001'),
('COU26','职业能力与素养',2,'专业必修','DEP1005'),
('COU27','汇编语言程序设计',3,'专业必修','DEP1001'),
('COU28','编译原理',3,'专业必修','DEP1001'),
('COU29','工程力学',3,'专业必修','DEP1004'),
('COU30','工程热力学',3,'专业必修','DEP1004'),
('COU31','嵌入式高级开发基础',3,'专业必修','DEP1001'),
('COU32','51单片机应用技术基础',3,'专业必修','DEP1001'),
('COU33','Spring实战基础',3,'专业必修','DEP1001');

select *from CourseInfo_ChenXing;

--delete from CourseInfo;



----创建教师信息表
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME='TeacherInfo_LiuQingChao')-- 如果Teacher表已存在，先删除
drop table TeacherInfo_LiuQingChao
go

create table TeacherInfo_LiuQingChao
(
Tno char(16) primary key,							--教师编号
Tname char(16) not null,							--教师姓名
Tsex char(2) default '男',							--性别
Tprotitle char(8) default '讲师',					--职称
Tcourses char(32),									--教授课程
Ttime datetime,										--授课时间
Tdeptno char(8),									--所属院系
check((Tsex='男') OR (Tsex='女')),					--检查约束
check ((Tprotitle = '讲师') or (Tprotitle = '副教授') or (Tprotitle = '教授')),--检查约束
foreign key(Tdeptno) references DepartmentInfo_LuoJun (Deptno)
);


insert into TeacherInfo_LiuQingChao values
('TEA01','DaiPing','女','副教授','工程应用写作','2023-05-26 09:50:00','DEP1001'),
('TEA02','ChenBing','男','讲师','计算思维导论(C语言)','2023-05-17 09:50:00','DEP1001'),
('TEA03','WangXiaoNan','女','讲师','面向对象程序设计(C++)','2023-05-25 08:00:00','DEP1001'),
('TEA04','HuangYan','男','讲师','高等数学','2023-05-23 08:00:00','DEP1007'),
('TEA05','DaiYaFen','女','讲师','大学英语','2023-05-27 09:50:00','DEP1007'),
('TEA06','YeWen','男','讲师','离散数学','2023-05-24 08:00:00','DEP1007'),
('TEA07','CaiBing','男','讲师','机器学习基础与Python项目实践','2023-05-23 14:30:00','DEP1001'),
('TEA08','WangTian','女','讲师','音乐鉴赏','2023-05-23 19:00:00','DEP1006'),
('TEA09','HanYanyu','女','讲师','中国近代史纲要','2023-05-24 14:30:00','DEP1008'),
('TEA10','WangYongFeng','男','讲师','智能软件开发基础(Java)','2023-05-23 08:00','DEP1001'),
('TEA11','WuXiang','男','讲师','数字逻辑电路基础','2023-05-23 09:50:00','DEP1001'),
('TEA12','HanYanYu','男','讲师','马克思主义基本原理概论','2023-05-24 14:30:00','DEP1008'),
('TEA13','ShiJianGuo','男','讲师','计算机网络基础','2023-05-26 14:30','DEP1001'),
('TEA14','ChengFei','女','教授','数据结构与算法','2023-05-26 16:20:00','DEP1001'),
('TEA15','LiJun','男','教授','数据库系统','2023-05-24 08:00:00','DEP1001'),
('TEA16','HeJing','女','讲师','毛泽东和中国特色社会主义理论体系','2023-05-24 09:50:00','DEP1008'),
('TEA17','TaoJieYu','女','讲师','职业能力与素养','2023-05-26 08:00:00','DEP1005'),
('TEA18','ChenNaiJin','男','教授','计算机组成原理','2023-05-28 09:50:00','DEP1001'),
('TEA19','XueMengTing','女','讲师','现代教育技术基础','2023-05-26 19:00:00','DEP1007'),
('TEA20','FengNianRong','男','讲师','操作系统原理','2023-05-24 14:30:00','DEP1001'),
('TEA21','HangChao','男','讲师','模拟电子技术基础','2023-05-24 08:30:00','DEP1003'),
('TEA22','TangYeJian','男','讲师','Web前端开发基础','2023-05-24 14:20','DEP1001'),
('TEA23','HuangYan','男','讲师','线性代数','2023-05-25 08:00:00','DEP1007'),
('TEA24','DengRuiJuan','女','讲师','工程热力学','2023-05-30 08:00:00','DEP1007'),

('TEA25','罗骏','男','教授','汇编语言程序设计','2023-05-28 08:00:00','DEP1001'),
('TEA26','刘青超','男','副教授','编译原理','2023-05-28 09:50:00','DEP1001'),
('TEA27','刘畅','男','副教授','嵌入式高级开发基础','2023-05-28 14:00:00','DEP1001'),
('TEA28','陈星','男','讲师','51单片机应用技术基础','2023-05-28 16:20:00','DEP1001'),
('TEA29','ITHeiMa','男','讲师','Spring实战基础','2023-05-28 19:00:00','DEP1001');



select *from  TeacherInfo_LiuQingChao;

--delete from TeacherInfo;


----创建院系教室安排表
if exists (select *from INFORMATION_SCHEMA.TABLES
where TABLE_NAME=' CourseArrangementInfo')-- 如果Depart_class表已存在，先删除
drop table  CourseArrangementInfo
go

create table  ClassArrangementInfo
(
Tno char(16) ,--教师编号
Clano char(16) ,--教室编号
Cno char(16) ,--课程编号
Classtime datetime,--上课时间
Deptno char(8),--院系编号
Freetime_begin time,--空闲开始时间
Freetime_end time,--空闲结束时间
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

----查询中教室类型为阶梯教室的教室编号及其位置
use LuoJun07
go
create view v_ClassroomInfo_JieTi_LuoJun
as
select ClassroomInfo_LiuChang.Clano 教室编号,ClassroomInfo_LiuChang.Position 教室位置
from  ClassroomInfo_LiuChang
where  ClassroomInfo_LiuChang.Form='阶梯教室';

select *from v_ClassroomInfo_JieTi_LuoJun;

----查询曾在教室编号为CLA1001授过课的教师编号、职称、姓名、教授课程

use LuoJun07
go
create view v_ClassUseCLA1001_TeacherInfo_LiuChang
as
select TeacherInfo_LiuQingChao.Tno 教师编号 ,TeacherInfo_LiuQingChao.Tname 教师姓名,TeacherInfo_LiuQingChao.Tprotitle 教师职称,TeacherInfo_LiuQingChao.Tcourses 教授课程
from TeacherInfo_LiuQingChao where TeacherInfo_LiuQingChao.Tno in(select ClassArrangementInfo.Tno from ClassArrangementInfo where Clano='CLA1001');


select *from v_ClassUseCLA1001_TeacherInfo_LiuChang;

drop view v_ClassUseCLA1001_TeacherInfo_LiuChang;

----查询教室位置以西三开头的空闲时间

use LuoJun07
go
create view v_ClassFreeTime_LiuQingChao
as
select distinct FreeTime 空闲时间 from  ClassroomInfo_LiuChang 
where Position like '西三_%';

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
('TEA30','法外狂徒 罗骏','男','教授','刑法学','2023-06-01 08:00:00','DEP1008');


----输入教室编号，查询教室位置
use LuoJun07
go
create proc pro_ClassPosition_LuoJun
@clano char(16),
@position char(16) =null output
as
begin

select  Position 教室位置 from  ClassroomInfo_LiuChang
where Clano=@clano
end

exec pro_ClassPosition_LuoJun 'CLA1001'

--drop proc pro_ClassPosition


----输入教室编号，查询教室空闲时间
use LuoJun07
go
create proc pro_ClassFreeTime_LuoJun
@clano char(16)
as
begin
select  FreeTime 空闲时间 from  ClassroomInfo_LiuChang
where Clano=@clano
end

exec pro_ClassFreeTime_LuoJun 'CLA1001'

----创建函数,输入教室容量，返回教室位置
use LuoJun07
go
create function f_ClassPosition_LuoJun(@capacity smallint)
returns table
as
return (select Position from ClassroomInfo_LiuChang where Capacity=@capacity)

select *from f_ClassPosition_LuoJun(120);


--drop function f_ClassPosition_LuoJun