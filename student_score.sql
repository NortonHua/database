
--所有的DML，必须commit确认才会写入到数据库中；如果不想把修改写入到数据库中，可以用rollback回滚。

CREATE TABLE t_student(
   id NUMBER(9),
   name VARCHAR2(55) CONSTRAINTS t_student_name_nn NOT NULL,
   sno NUMBER(9),
   gender CHAR(1) DEFAULT 'F',
   class_no NUMBER(9),
   CONSTRAINTS t_student_id_pk PRIMARY KEY(id),
   CONSTRAINTS t_student_sno_uk UNIQUE(sno),
   CONSTRAINTS t_student_gender_ck CHECK(gender='F' OR gender='M')
);

CREATE TABLE t_subject(
    id NUMBER(9),
	name VARCHAR2(99) CONSTRAINTS t_subject_name_nn NOT NULL,
	CONSTRAINTS t_subject_id_pk PRIMARY KEY(id)
);

CREATE TABLE t_score(
   id NUMBER(9),
   stu_id NUMBER(9),
   sub_id NUMBER(9),
   score NUMBER(5,2),
   CONSTRAINTS t_score_id_pk PRIMARY KEY(id),
   CONSTRAINTS t_score_stu_id_fk FOREIGN KEY(stu_id) REFERENCES t_student(id),
   CONSTRAINTS t_score_score_ud_fk FOREIGN KEY(sub_id) REFERENCES t_subject(id)
);


--向学生表中插入数据
INSERT INTO t_student
(id,name,sno,gender,class_no)
VALUES
(1,'张三',20190001,'M',20171111);

INSERT INTO t_student
(id,name,sno,gender,class_no)
VALUES
(2,'张翔',20190002,'M',20171111);

INSERT INTO t_subject
(id,name)
VALUES
(1,'JAVA');

INSERT INTO t_subject
(id,name)
VALUES
(2,'PYTHON');
INSERT INTO t_subject
(id,name)
VALUES
(3,'C');

INSERT INTO t_score
(id,stu_id,sub_id,score)
VALUES
(1,1,1,70.5);
INSERT INTO t_score
(id,stu_id,sub_id,score)
VALUES
(2,1,2,80);
INSERT INTO t_score
(id,stu_id,sub_id,score)
VALUES
(3,1,3,90);
INSERT INTO t_score
(id,stu_id,sub_id,score)
VALUES
(4,2,1,88);
INSERT INTO t_score
(id,stu_id,sub_id,score)
VALUES
(5,2,2,78);
INSERT INTO t_score
(id,stu_id,sub_id,score)
VALUES
(6,2,3,100);

CREATE USER oaec IDENTIFIED BY abc123;
GRANT CONNECT,RESOURCE TO oaec;

ALTER session set nls_date_language=ENGLISH;
