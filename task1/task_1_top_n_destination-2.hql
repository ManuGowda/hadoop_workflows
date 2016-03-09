INSERT INTO top_destination
SELECT destination,time_interval_10
FROM 
(
	SELECT  destination, time_interval_10, des_cnt
	,row_number() over (partition by time_interval_10 order by des_cnt DESC)as rnk
	from
	 (
	 	SELECT count(1) as des_cnt, destination
	 		,floor((floor(cast(substring(sh_time,1,2) as int)*600 + cast(substring(sh_time,4,2) as int)))/10) as time_interval_10
		FROM clicklog 
		WHERE destination is not null
	 	GROUP BY destination,  floor((floor(cast(substring(sh_time,1,2) as int)*600 + cast(substring(sh_time,4,2) as int)))/10)
	  ) res1

)res2 
WHERE rnk <=10 
GROUP BY destination, time_interval_10