class Song < ApplicationRecord
    validates :title, presence: true
    validates :length, presence: true
    validates :play_count, presence: true

    belongs_to :artist
end
