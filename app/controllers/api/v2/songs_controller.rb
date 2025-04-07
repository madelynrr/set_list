class Api::V2::SongsController < ApplicationController
    def index
        render json: Song.all
    end
end
