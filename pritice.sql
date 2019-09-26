CREATE USER oaec IDENTIFIED BY oaec;

GRANT CONNECT ,RESOURCE TO oaec;
DESC s_dept;
col first_name format a10;
--查询部门表的所有信息
SELECT  id,name,region_id
FROM s_dept;

--查询员工的名，姓
SELECT first_name,last_name FROM s_emp;

--查询每个员工的月薪
SELECT id ,salary, salary*12 as 年薪 FROM  s_emp;
--NVL函数，有两个参数，第一个参数如果不为空，那么就返沪第一个参数值
SELECT id ,salary,salary*(1+NVL(commission_pct,0)/100)*12 年薪 
FROM s_emp;

SELECT id 编号,userid 工号,title 职位,salary 薪资 FROM s_emp;
--DISTINCT去重
SELECT DISTINCT name FROM s_dept;

SELECT id 编号, first_name||','||last_name 姓名,salary 薪资 FROM s_emp;

--CONCAT拼接，只能有两个参数

--查询结果的排序 ORDER BY 列名 DESC(降序) / ASC(升序默认)
--按照部门编号降序排列
SELECT id,dept_id,title
FROM s_emp
ORDER BY dept_id DESC;
--如果部门编号相同，再按职位升序排
SELECT id,dept_id,title
FROM s_emp
ORDER BY dept_id DESC,title ASC;
--对于空值，nulls LAST表示所有的空值都放在最后，nulls FIRST都放前
SELECT id,salary,commission_pct
FROM s_emp
ORDER BY commission_pct DESC nulls LAST;


--条件查询 WHERE 条件查询
SELECT id,salary
FROM s_emp
WHERE salary>1000;
--查询41号部门的所有员工，按照薪资升序排序
SELECT id,salary,dept_id
FROM s_emp
WHERE dept_id=41
ORDER BY salary ASC;

SELECT id,salary,dept_id
FROM s_emp
WHERE salary BETWEEN 1100 AND 4300; --闭区间

SELECT id,salary,dept_id
FROM s_emp
WHERE dept_id IN(41,44,45,60)  --等价于OR  OR
ORDER BY dept_id;

SELECT id,salary,commission_pct
FROM s_emp
WHERE commission_pct IS NULL;

SELECT id,salary,last_name
FROM s_emp
WHERE last_name='Smith';

--模糊查询 -代表一个字符，%代表零个或多个
SELECT id,salary,dept_id
FROM s_emp
WHERE first_name LIKE 'C%';

SELECT id,salary,dept_id
FROM s_emp
WHERE first_name LIKE '%y';

--
SELECT id,first_name,dept_id
FROM s_emp
WHERE first_name LIKE '_e%';

SELECT id,first_name,dept_id
FROM s_emp
WHERE first_name LIKE '____';

SELECT id,first_name,dept_id
FROM s_emp
WHERE first_name LIKE '____%';

