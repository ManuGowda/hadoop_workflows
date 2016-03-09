INSERT INTO top_hotels
SELECT user_id,hotel FROM
(
	SELECT clicked.user_id, clicked.hotel
	FROM 
	(
		SELECT user_id, action, time, hotel, 
			row_number() over (partition by user_id order by user_id, time) as rnk  
		FROM clicklog
		WHERE action = 'Click' 
	)clicked WHERE clicked.rnk = 2
	 
	UNION ALL

	SELECT not_clicked.user_id, not_clicked.hotel   
	FROM
	(  
		SELECT user_id, hotel, count(user_id) as rnk  
		FROM clicklog
		WHERE action = 'Click' and hotel is null 
		GROUP BY user_id, hotel 
	)not_clicked  WHERE not_clicked.rnk =1
) FINAL