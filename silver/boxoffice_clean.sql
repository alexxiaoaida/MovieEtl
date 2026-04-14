-- Silver Layer: BoxOffice Clean

CREATE OR REFRESH STREAMING TABLE movie.clean.silver_boxoffice
AS
SELECT
  LOWER(d.film_name)          AS title_key,
  d.film_name                 AS title,
  CAST(d.year_of_release AS INT) AS release_year,
  d.box_office_gross_usd      AS domestic_gross,
  i.box_office_gross_usd      AS international_gross,
  f.production_budget_usd     AS production_budget
FROM STREAM movie.raw.bronze_boxoffice_domestic d
LEFT JOIN movie.raw.bronze_boxoffice_international i
  ON LOWER(d.film_name) = LOWER(i.film_name)
  AND d.year_of_release = i.year_of_release
LEFT JOIN movie.raw.bronze_boxoffice_financials f
  ON LOWER(d.film_name) = LOWER(f.film_name)
  AND d.year_of_release = f.year_of_release
WHERE d.film_name IS NOT NULL