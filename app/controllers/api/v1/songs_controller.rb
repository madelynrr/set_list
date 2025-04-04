class Api::V1::SongsController < ApplicationController
    def index
        render json: Song.all
    end

    def show
        render json: Song.find(params[:id])
    end
end
