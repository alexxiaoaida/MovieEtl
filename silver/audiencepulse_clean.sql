-- Silver Layer: AudiencePulse Clean

CREATE OR REFRESH STREAMING TABLE movie.clean.silver_audiencepulse
AS
SELECT
  LOWER(title)                         AS title_key,
  title,
  CAST(year AS INT)                    AS release_year,
  CAST(audience_average_score AS DOUBLE) AS audience_score,
  domestic_box_office_gross            AS domestic_gross_p2
FROM STREAM movie.raw.bronze_audiencepulse
WHERE title IS NOT NULL