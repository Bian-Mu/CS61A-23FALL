.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color='blue' AND pet='dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color='blue' AND pet='dog';


CREATE TABLE smallest_int_having AS
  SELECT time,smallest FROM students GROUP BY smallest HAVING COUNT(*)=1;


CREATE TABLE matchmaker AS
  SELECT a.pet,a.song,a.color,b.color FROM students AS a,students AS b
      WHERE a.time<b.time AND a.pet=b.pet AND a.song=b.song;


CREATE TABLE sevens AS
  SELECT s.seven FROM students AS s,numbers AS n
  WHERE n.'7'='True'  AND s.smallest<=7 AND s.time=n.time;

