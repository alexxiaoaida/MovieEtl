-- Bronze Layer: BoxOffice Financials

CREATE OR REFRESH STREAMING TABLE movie.raw.bronze_boxoffice_financials
AS SELECT *
FROM STREAM read_files(
  "/Volumes/movie/default/movie_pipeline/",
  format => "csv",
  header => true,
  pathGlobFilter => "provider3_financials.csv"
)
