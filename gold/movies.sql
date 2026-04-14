-- Gold Layer: Unified movies table

CREATE OR REFRESH MATERIALIZED VIEW movie.gold.gold_movies
AS
SELECT
  c.title                                          AS movie_title,
  c.release_year,
  c.critic_score_pct,
  a.audience_score,
  b.domestic_gross,
  b.international_gross,
  b.production_budget,
  b.domestic_gross + b.international_gross         AS total_box_office

FROM movie.clean.silver_criticagg c
LEFT JOIN movie.clean.silver_audiencepulse a
  ON c.title_key = a.title_key AND c.release_year = a.release_year
LEFT JOIN movie.clean.silver_boxoffice b
  ON c.title_key = b.title_key AND c.release_year = b.release_year;
