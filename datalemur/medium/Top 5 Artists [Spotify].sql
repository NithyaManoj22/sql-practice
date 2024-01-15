WITH top_artists 
AS (
  SELECT 
    top_songs.artist_id,
    top_songs.song_appearance,
    DENSE_RANK() OVER(ORDER BY song_appearance DESC) as rnk
  FROM
    (SELECT s.artist_id, COUNT(*) as song_appearance
    FROM songs AS s
    INNER JOIN global_song_rank AS gs
      ON s.song_id = gs.song_id
    WHERE gs.rank <= 10
    GROUP BY s.artist_id
    ORDER BY 2 DESC
    ) as top_songs
  )
  
SELECT a.artist_name, ta.rnk 
FROM top_artists ta
INNER JOIN artists a 
  ON ta.artist_id = a.artist_id
WHERE ta.rnk <= 5
ORDER BY ta.rnk ASC, a.artist_name ASC;