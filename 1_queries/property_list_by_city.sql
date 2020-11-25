SELECT p.*,
  ROUND(AVG(rating)) AS average_rating
FROM properties p
  JOIN property_reviews ON property_id = p.id
WHERE city LIKE '%ancouv%'
GROUP BY p.id
HAVING AVG(rating) >= 4
ORDER BY cost_per_night ASC;