\c coin_flipping_db

WITH streak_attempts AS (
  SELECT
    flipper,
    result,
    flipped_at,
    SUM(CASE WHEN result IS TRUE THEN 0 ELSE 1 END) OVER (
      PARTITION BY flipper
      ORDER BY flipped_at ASC
    ) AS steak_attempt_id
  FROM coin_flips
),
all_streak_counts AS ( SELECT
  flipper,
  result,
  COUNT(*) OVER (
    PARTITION BY flipper, steak_attempt_id
    ORDER BY flipped_at ASC
  ) AS heads_streak_counts
FROM streak_attempts
WHERE result IS TRUE
)
SELECT flipper, MAX(heads_streak_counts) AS max_streak
FROM all_streak_counts
GROUP BY flipper
ORDER BY 2 desc;
