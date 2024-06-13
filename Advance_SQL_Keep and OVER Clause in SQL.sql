#  PARTITION BY with and without KEEP
# A common scenario involves needing to find specific data within groups. For instance, imagine you want to find the name of the employee with the highest salary in each department, given a table with employee data including deptno (department number), name (employee name), and sal (salary).
# The Stack Overflow question illustrates a scenario where KEEP and OVER clauses can be particularly useful. The user wants to understand the difference between using PARTITION BY with and without the KEEP clause

# Concepts:
# KEEP Clause
# The KEEP clause in Oracle SQL is an advanced aggregate function that allows you to find specific values from within a group, such as the maximum, minimum, or a specific rank. For example, you can find the employee name with the highest salary within each department.
# OVER Clause
# The OVER clause is a window function that allows you to perform calculations across a set of rows related to the current row. It's commonly used for ranking or aggregate functions within partitions of data.






Given a table named test with the following data:

deptno | name  | sal
-------|-------|----
10     | John  | 5000
10     | Jane  | 6000
20     | Alice | 7000
20     | Bob   | 5500
30     | Carol | 6500
30     | Dave  | 6000

To find the name of the employee with the highest salary in each department, as well as the maximum salary itself, you can use the KEEP clause:

SELECT deptno,
       MIN(name) KEEP (DENSE_RANK FIRST ORDER BY sal DESC, name),
       MAX(sal)
FROM test
GROUP BY deptno;