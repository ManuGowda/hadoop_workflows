CREATE EXTERNAL TABLE IF NOT EXISTS top_destination(
        destination string,
        time_interval_10 int
)
STORED AS TEXTFILE
LOCATION '/data/top_destination';