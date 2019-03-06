# MySql 기본 사용법

# MySql 접속 방법

# 로컬 MySql DB 서버에 접속하기
# mysql -u 사용자ID -p

# 외부 MySql 서버에 접속하기
# mysql -u 사용자id --host=접속주소 --port=포트번호 -p

# 데이터 베이스 생성
# create database DBname option;
# create schema DBname option;

# 데이터베이스 생성 시 문자셋 설정
# create database DBname default character set utf8; 

# 데이터 베이스 삭제
# drop database DBname;
# drop schema DBname;

# 데이터 베이스 사용자 생성
# create user 'USER ID';

# 사용자와 접속주소, 비밀번호를 동시에 생성
# create user 'USER ID'@'접속 주소' identified by 'passward';

# 사용자 삭제
# drop user 'USER ID';

# 사용자 비밀번호 변경

# mysql5.7 미만 구버전, mariadb사용시
# 사용자 비밀번호는 root계정에서만 수정이 가능하다.
# sql의 DML중 update 구문을 이용하여 사용자의 비밀번호를 수정한다.
# update user set password=passwrod('비밀번호') where user = '사용자id';

# 최신버전 경우
# 사용자의 비밀번호는 root계정에서만 수정이 가능하다.
# SQL의 DDL의 alter 구문을 사용하여 사용자의 비밀번호를 수정
# alter user 'USERID'@'접속주소' identified with mysql_native_password by 'new pw';

#실행 사항 즉시 적용
# mysql에서 콘솔로 DDL 및 DCL을 실행 시 DB에 바로 적용 되지 않는 현상이 발생할수 있음
# 그렇기 때문에 바로 적용을 위해서는 적용 명령어를 입력하여 DB에 바로 적용을 해야함
# flush privileges;

# DB 접근 권한 확인
# show grants for 'USER ID'@'접속주소';

# DB 접근 권한 설정
# grant all on DBname.tablename to 'USERID'@'접속주소';
# grant all privileges on DBname.tablename to 'USERID'@'접속주소';

# DB 접근 권한 및 비밀번호
# grant all privileges on DBname.tablename to 'USERID'@'접속주소' identified by 'passward' whit grant option;

# DB 접근 권한 삭제
# revoke all DBname.tablename form 'USERid'@'접속주소';

# 문제 1) 자신의 이름 이니셜로 사용자 id를 생성한다.
# 데이터 베이스 생성, 비밀번호 '더조은602' 로 설정
# 데이터 베이스를 자신이 이니셜 + DB로 생성, urf-8 문자 셋으로 설정하여 생성
# 생성한 사용자 id에 생성한 DB의 사용권한을 설정
# 마지막으로 생성된 id로 접속하여 생성된 DB가 보이는지 확인

# DB테이블 생성
# SQL의 DDL을 사용하여 create명령으로 테이블을 생성
# 테이블 생성 시 테이블 이름, 각각의 컬럼명, 컬럼의 데이터 타입, 제약조건 입력
# create table 테이블명(
#	컬럼명1 데이터타입 컬럼제약조건,
#	컬럼명2 데이터타입 컬럼제약조건,
#	컬럼명3 데이터타입 컬럼제약조건,
#	컬럼명n 데이터타입 컬럼제약조건
#	제약 조건
# ex) create table member (
#	num int(11) not null,
#	name varchar(10) not null,
#	tel varchar(12) not null,
#	email varchar(50),
#	adress varchar(200),
# 	primary key (num)
#);

# 테이블 구조확인
# desc 테이블명;

# 데이터 베이스에서 NULL은 '아무것도 존재하지 않는다.' 라는 의미
# NOT NULL은 어떠한 값이라도 들어가야한다는 의미

# 테이블 삭제
# drop table 테이블명;

# 테이블 내용 삭제
# truncate table 테이블명;

# 테이블의 내용 수정
# SQL의 DDL을 사용하려 alter 명령어로 기존 테이블 내용을 변경할 수 있음

# 열(colunm) 추가
# alter table 테이블 명 add 열 이름 데이터타입 옵션;

# 열(colunm) 타입 변경
# alter table 테이블 명 modify 열 이름 데이터타입 옵션;

# 열(colunm) 삭제
# alter table 테이블 명 drop 열 이름;

# 제약조건
# 기본키(primary key) : 하나의 테이블에 하나의 데이터를 구분하는데 사용하는 키
# 보통 테이블에 하나의 컬럽에 적용함
# 하나의 데이터를 식별하기 위해서 여러개의 컬럼을 모아서 하나의 기본키로 설정하기도 함
# 기본키 설정 시 unique와 not null 옵션이 사용됨

# 참조키(foreign key) : 현재의 테이블에서 다른 테이블의 정보를 불러와서 사용하는 키
# 하나의 테이블에서 여러개의 참조키를 사용할수 있음

# unique : 현재 테이블에서 단 하나의 값을 가지는 조건

# sql에서는 문자열 사용시 ""를 사용 하지 않음 '' 만 사용