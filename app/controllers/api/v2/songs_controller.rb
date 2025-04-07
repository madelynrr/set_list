class Api::V2::SongsController < ApplicationController
    def index
        songs = Song.all
        render json: SongSerializer.format_songs(songs)
    end
end
