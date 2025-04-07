class SongSerializer
    def self.format_songs(songs)
        songs.map do |song|
            {
                id: song.id,
                title: song.title,
                length: song.length,
                popularity: song.popularity,
                artist_id: song.artist_id
            }
        end
    end
end
