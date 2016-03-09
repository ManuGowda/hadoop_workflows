CREATE EXTERNAL TABLE IF NOT EXISTS top_hotels(
        user_id int,
        hotel string
)
STORED AS TEXTFILE
LOCATION '/data/top_hotels';