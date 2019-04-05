SELECT COUNT(*)
FROM stops

SELECT id
FROM stops
WHERE name = 'Craiglockhart'

SELECT s.id, s.name
FROM stops s JOIN route r ON s.id = r.stop
WHERE r.num = 4 AND r.company = 'LRT'

SELECT company, num, COUNT(*)
FROM route
WHERE stop=(SELECT id
  FROM stops
  WHERE id = 149) OR stop=(SELECT id
  FROM stops
  WHERE id = 53)
GROUP BY company, num
HAVING COUNT(*) = 2

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=(SELECT id
  FROM stops
  WHERE name = 'Craiglockhart')
  AND b.stop=(SELECT id
  FROM stops
  WHERE name = 'London Road')

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='London Road'

SELECT r1.company, r1.num
FROM route r1 JOIN route r2 ON r1.company = r2.company AND r1.num = r2.num
WHERE r1.stop = 115 AND r2.stop = 137
GROUP BY r1.company, r1.num

SELECT r1.company, r1.num
FROM route r1 JOIN route r2 ON r1.company = r2.company AND r1.num = r2.num
WHERE r1.stop = (SELECT id
  FROM stops
  WHERE name = 'Craiglockhart')
  AND r2.stop = (SELECT id
  FROM stops
  WHERE name = 'Tollcross' )
GROUP BY r1.company, r1.num

SELECT DISTINCT (SELECT name
  FROM stops
  WHERE id = r1.stop), r1.company, r2.num
FROM route r1 JOIN route r2 ON r1.company = r2.company AND r1.num = r2.num
WHERE r2.company = 'LRT' AND r2.stop = (SELECT id
  FROM stops
  WHERE name = 'Craiglockhart')

SELECT r1.num, r1.company, r1.name, r2.num, r2.company
FROM (SELECT DISTINCT r1a.num, r1a.company, s2.name
  FROM route r1a
    JOIN route r2a ON (r1a.company=r2a.company AND r1a.num=r2a.num)
    JOIN stops s1 ON (r1a.stop=s1.id)
    JOIN stops s2 ON (r2a.stop=s2.id)
  WHERE s1.name='Craiglockhart') AS r1
  JOIN (SELECT DISTINCT r1a.num, r1a.company, s2.name
  FROM route r1a
    JOIN route r2a ON (r1a.company=r2a.company AND r1a.num=r2a.num)
    JOIN stops s1 ON (r1a.stop=s1.id)
    JOIN stops s2 ON (r2a.stop=s2.id)
  WHERE s1.name='Lochend') AS r2
  ON r2.name = r1.name