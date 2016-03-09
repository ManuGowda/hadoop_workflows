LOAD DATA INPATH '/uploads/clicklog_${YEAR}-${MONTH}-${DAT}.csv' OVERWRITE INTO TABLE clicklog PARTITION (date='${YEAR}-${MONTH}-${DAT}');
