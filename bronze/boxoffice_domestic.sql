-- Bronze Layer: BoxOffice Domestic

CREATE OR REFRESH STREAMING TABLE movie.raw.bronze_boxoffice_domestic
AS SELECT *
FROM STREAM read_files(
  "/Volumes/movie/default/movie_pipeline/",
  format => "csv",
  header => true,
  pathGlobFilter => "provider3_domestic.csv"
)
