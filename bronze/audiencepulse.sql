-- Bronze Layer: AudiencePulse

CREATE OR REFRESH STREAMING TABLE movie.raw.bronze_audiencepulse
AS SELECT *
FROM STREAM read_files(
  "/Volumes/movie/default/movie_pipeline/",
  format => "json",
  multiLine => true,
  pathGlobFilter => "provider2.json"
)
