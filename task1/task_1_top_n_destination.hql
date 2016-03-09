INSERT INTO top_destination
select a.destination,max(a.rnk) as rnk2 from
(
select destination,from_unixtime(unix_timestamp(time,'HH:mm:ss')+0) as time, 
  row_number() over (partition by destination order by unix_timestamp(time,'HH:mm:ss')) rnk 
  from  clicklog 
   where action = 'Search'
) a 
where a.time between from_unixtime(unix_timestamp('${time}','HH:mm:ss')+0) and from_unixtime(unix_timestamp('${time}','HH:mm:ss')+600) 
group by a.destination 
order by rnk2 desc
limit ${n};