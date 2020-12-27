WITH s1 as (
  SELECT
    to_timestamp(unix_time) as ts,
    split_part(unnest(string_to_array(content, E'\n')), ': ', 1) as disk,
    replace(split_part(unnest(string_to_array(content, E'\n')), ': ', 3), '°C', '')::REAL as degrees_c
  FROM m1_sensors
  WHERE
    hostname = 'h1.radious.co'
    and cmd = 'hddtemp -w'
  ORDER BY unix_time DESC
  LIMIT 32
)

SELECT DISTINCT ON(disk) * FROM s1;
