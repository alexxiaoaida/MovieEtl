-- Silver Layer: CriticAgg Clean

CREATE OR REFRESH STREAMING TABLE movie.clean.silver_criticagg
AS
SELECT
  LOWER(movie_title)               AS title_key,
  movie_title                      AS title,
  CAST(release_year AS INT)        AS release_year,
  CAST(critic_score_percentage AS INT) AS critic_score_pct,
  CAST(top_critic_score AS DOUBLE) AS top_critic_score
FROM STREAM movie.raw.bronze_criticagg
WHERE movie_title IS NOT NULL