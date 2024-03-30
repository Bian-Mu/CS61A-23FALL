SELECT name FROM records
WHERE supervisor='Oliver Warbucks';

SELECT * FROM records
WHERE name=supervisor
ORDER BY name ASC;

SELECT name FROM records
WHERE salary>50000;

SELECT day,time FROM meetings,records
WHERE records.supervisor='Oliver Warbucks' AND meetings.division=records.division;

SELECT name FROM records AS r1,records AS r2
WHERE r1.supervisor=r2.name AND r1.division<>r2.division;

SELECT DISTINCT r1.name 
FROM records AS r1, records AS r2, records AS r3
WHERE r2.supervisor = r1.name AND 
      r1.supervisor = r3.name AND 
      r1.name <> r1.supervisor; 

SELECT supervisor, SUM(salary)
FROM records
GROUP BY supervisor;

SELECT day
FROM meetings
GROUP BY day
HAVING COUNT(*) < 5;





