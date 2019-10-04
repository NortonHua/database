--名：first_name  姓：last_name  s_emp表
  --1.查询所有员工的first_name和last_name,要求查询结果为一列，用逗号隔开，并且列名为Name
  SELECT first_name||','||last_name AS Name FROM s_emp;
  --2.查看员工的员工id，名字和年薪,年薪列名为annual（注意如果有提成，需要算进去）
  SELECT id ,first_name||last_name Name,salary*(1+NVL(commission_pct,0)/100)*12 annual FROM s_emp;
  --3.查看员工的员工id，全名和职位名称，全名和职位名称合并成一列显示，且格式为：姓 名，职位名称
  SELECT id,first_name||''||last_name||','||title as "姓 名，职位名称" FROM s_emp;
  --4.查看员工号1,3,5,7,9员工的工资
  SELECT id,salary FROM s_emp WHERE id IN (1,3,5,7,9);
  --5.查看员工名字长度不小于5，且第四个字母为n字母的员工id和工资
  SELECT id,salary FROM s_emp WHERE first_name LIKE '___n_%';
  --6.查看员工部门为41 或者 44号部门且工资小于1000的员工id和名字
  SELECT id,first_name||last_name name FROM s_emp WHERE (dept_id=41 OR dept_id=44) AND salary<1000;
  --7.显示员工姓氏中第三个字母为“a”(不区分大小写)的所有员工的名字和姓氏
  SELECT first_name,last_name FROM s_emp WHERE first_name LIKE '__[aA]%';
  --8.显示员工姓氏中有“a”和“e”的所有员工的姓氏和名字
  SELECT first_name,last_name FROM s_emp WHERE last_name LIKE '%[ae]%';
  --9.显示在92年入职的所有员工的姓氏和录用日期,并按照姓氏升序排序
  SELECT last_name,start_date FROM s_emp WHERE start_date>="01-JAN-92 0:00" AND start_date<="31-DEC-92 23:59" ORDER BY last_name ASC;
  --10.查询有销售代表的客户名，销售编号
  SELECT name,sales_rep_id FROM s_customer WHERE sales_rep_id IS NOT NULL;
  --11.查询92年9月1号以来下单(date_ordered)所有的订单编号,下单时间，订单总额
  SELECT id,date_ordered,total FROM s_ord where date_ordered>="01-SEP-92 0:00";
  --12.	查询包含be的所有的员工名字,不区分大小写
  SELECT first_name FROM s_emp WHERE lower(first_name) like '%be%';