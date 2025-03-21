class Artist < ApplicationRecord
    validates :name, presence: true

    has_many :songs

    def average_song_length
        song_lengths = songs.pluck(:length)
        song_lengths.sum / song_lengths.count
    end
end
