SELECT name
FROM world
WHERE name LIKE 'Y%'

SELECT name
FROM world
WHERE name LIKE '%Y'

SELECT name
FROM world
WHERE name LIKE '%x%'

SELECT name
FROM world
WHERE name LIKE '%land'

SELECT name
FROM world
WHERE name LIKE 'c%ia'

SELECT name
FROM world
WHERE name LIKE '%oo%'

SELECT name
FROM world
WHERE name LIKE '%a%a%a%'

SELECT name
FROM world
WHERE name LIKE '_t%'
ORDER BY name

SELECT name
FROM world
WHERE name LIKE '%o__o%'

SELECT name
FROM world
WHERE name LIKE '____'

SELECT name
FROM world
WHERE name = capital

SELECT name
FROM world
WHERE capital like concat(name, '%City%')

SELECT capital, name
FROM world
WHERE capital like concat('%',name, '%')

SELECT capital, name
FROM world
WHERE capital like concat('%_%',name)
  OR capital like concat(name, '%_%')

SELECT name, REPLACE(capital,name,'') as ext
FROM world
WHERE capital like concat('%_%',name)
  OR capital LIKE concat(name, '%_%')