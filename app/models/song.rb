class Song < ApplicationRecord
    before_save { |song| song.popularity = calculate_popularity }
    validates :title, presence: true
    validates :length, presence: true
    validates :play_count, presence: true

    belongs_to :artist

    def self.song_count
        all.count
    end

    private
    def calculate_popularity
        play_count > 5 ? "high" : "low"
    end
end
