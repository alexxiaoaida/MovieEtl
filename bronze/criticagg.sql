-- Bronze Layer: CriticAgg

CREATE OR REFRESH STREAMING TABLE movie.raw.bronze_criticagg
AS SELECT *
FROM STREAM read_files(
  "/Volumes/movie/default/movie_pipeline/",
  format => "csv",
  header => true,
  pathGlobFilter => "provider1.csv"
)
