select deal_name, count(deal_name)
from deal
group by deal_name
having count (deal_name) > 1;


SELECT *
FROM deal d
WHERE EXISTS (
  SELECT * FROM deal
  WHERE deal_NAME = d.deal_NAME
  AND client_id < d.client_id
);
