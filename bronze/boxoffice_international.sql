-- Bronze Layer: BoxOffice International

CREATE OR REFRESH STREAMING TABLE movie.raw.bronze_boxoffice_international
AS SELECT *
FROM STREAM read_files(
  "/Volumes/movie/default/movie_pipeline/",
  format => "csv",
  header => true,
  pathGlobFilter => "provider3_international.csv"
)
