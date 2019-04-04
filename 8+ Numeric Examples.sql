SELECT A_STRONGLY_AGREE
FROM nss
WHERE question='Q01'
  AND institution='Edinburgh Napier University'
  AND subject='(8) Computer Science'

SELECT institution, subject
FROM nss
WHERE question='Q15'
  and score > 99

SELECT institution, score
FROM nss
WHERE question='Q15'
  AND score < 50
  AND subject='(8) Computer Science'

SELECT subject, sum(response)
FROM nss
WHERE question='Q22'
  AND (subject='(8) Computer Science'
  OR subject='(H) Creative Arts and Design')
GROUP BY subject

SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
FROM nss
WHERE question='Q22'
  AND (subject='(8) Computer Science'
  OR subject = '(H) Creative Arts and Design')
GROUP BY subject

SELECT subject, ROUND(SUM(response*A_STRONGLY_AGREE)/SUM(response))
FROM nss
WHERE question='Q22'
  AND (subject='(8) Computer Science'
  OR subject='(H) Creative Arts and Design')
GROUP BY subject

SELECT institution, ROUND(SUM(response * score)/SUM(response)) as score
FROM nss
WHERE question='Q22'
  AND (institution LIKE '%Manchester%')
group by institution

SELECT institution, sum(sample), sum(CASE WHEN subject='(8) Computer Science' THEN sample ELSE 0 END)
FROM nss
WHERE question='Q01'
  AND (institution LIKE '%Manchester%')
group by institution