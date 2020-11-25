SELECT p.city,
  COUNT(r.property_id) AS total_reservations
FROM properties p
JOIN reservations r ON p.id = r.property_id
GROUP BY p.city
ORDER BY total_reservations DESC;