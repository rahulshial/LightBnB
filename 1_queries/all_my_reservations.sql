SELECT r.*,
  p.*,
  AVG(pr.rating)
FROM reservations r
  JOIN properties p ON r.property_id = p.id
  JOIN property_reviews pr ON pr.property_id = p.id
WHERE r.guest_id = 1
AND r.end_date < now()
GROUP BY r.id, p.id
ORDER BY start_date ASC;