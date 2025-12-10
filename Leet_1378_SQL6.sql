SELECT unique_id, name
FROM Employees AS E
LEFT JOIN EmployeeUNI AS Em
ON E.id = Em.id;
-- The Employees table holds all employees including their unique id, name and the id of their manager.
-- The EmployeeUNI table holds the unique id and id of each employee.
-- Write a query to report the unique id and name of each employee. If an employee has
-- no unique id, report null instead.
-- Return the result table ordered by the unique id in ascending order. If there is a tie, order it by name in ascending order.
