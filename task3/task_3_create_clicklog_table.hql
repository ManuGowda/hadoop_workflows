CREATE EXTERNAL TABLE IF NOT EXISTS clicklog(
        user_id bigint,
        time string,
        action string,
        destination string,
        hotel string
)
PARTITIONED BY (date string)
ROW FORMAT delimited fields terminated by ',' escaped by '\\'
STORED AS TEXTFILE
LOCATION '/data/clicklog';